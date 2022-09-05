# LAB1 : Aspera setup and transfer using CLI

In this lab, the user will initiate a transfer using CLI between a client and the Aspera High Speed Transfer Server (HSTS) on CP4I.

Reference: [[CP4IDOC]](README.md#CP4IDOC) &rarr; Initiating transfers with Aspera High Speed Transfer Server

# 0- Prerequisites

* An Aspera HSTS instance installed in Cloud Pak, refer to [CLI setup](README.setup_cli.md)
* Login using `oc` to the openshift platform, refer to [CLI setup](README.setup_cli.md)
* Name of Aspera instance created in shell variable: <img src="images/icon-pencil.png" width="15px"/>`my_cp_hsts_instance_name`
* `ascli` installed (including `ascp`), refer to [Main Page](README.md)

# 1- Get Aspera HSTS Node API URL and credentials

Since we did not create specific credentials, some were generated automatically. Let's retrieve them:

```
my_node_username=$(oc get secret ${my_cp_hsts_instance_name}-asperanoded-admin --output jsonpath={.data.user}|base64 --decode)
my_node_password=$(oc get secret ${my_cp_hsts_instance_name}-asperanoded-admin --output jsonpath={.data.pass}|base64 --decode)
my_node_url=$(oc get IbmAsperaHsts --output jsonpath='{.items[?(@.metadata.name=="'${my_cp_hsts_instance_name}'")].status.endpoints[?(@.name=="asperanoded")].uri}')
```

Check the values.

```
set|grep '^node_'
```

Test the Aspera Node API:

```
curl -i -u $my_node_username:$my_node_password $my_node_url/info
```

Reference: Aspera Node API documentation: [[NAPIDOC]](README.md#NAPIDOC)

# 2- Create the Aspera access key using `ascli`

The Node API user was created and configured for use with Access Keys (no docroot, transfer user: xfer, file restrictions). So those credentials can be used to create Aspera Node Access Keys but cannot be used to perform transfers. Access keys can be used to authorize transfers.

Let's configure `ascli` with CP4I HSTS Node credentials.

Choose a configuration name, such as `my_cp4i_nodeadmin`, and create a configuration for more convenience (the same command line args can be recalled later by using `-Pmy_cp4i_nodeadmin`)

```bash
ascli conf id my_cp4i_nodeadmin update --url=$my_node_url --username=$my_node_username --password=$my_node_password
```

Test it:

```
ascli -Pmy_cp4i_nodeadmin node info
```

Let's provide the optional aspera access key id and secret at creation.
Note that if `id` or `secret` are not specified in creation parameters, then random values are generated and displayed on output (random secret: displayed only at creation).

Let's define our access key credentials:

```bash
my_node_access_key=mytestkey

my_node_secret=mySecr3t
```

Let's create the access key for the previously created persistent volume./

```
ascli -Pmy_cp4i_nodeadmin node access_key create --value=@json:'{"id":"'$my_node_access_key'","secret":"'$my_node_secret'","storage":{"type":"local", "path":"/data"}}'
```

For convenience, create a configuration preset named `my_cp4i_ak` for later use:

```bash
ascli conf id my_cp4i_ak update --url=$my_node_url --username=$my_node_access_key --password=$my_node_secret --ts=@json:'{"sshfp":null}'
```

Note: The option `sshfp=null` is added to avoid error: "Remote host is not who we expected" due to a change between `ascp` 3.9 and 4.0. Ref: [ascli manual](https://github.com/IBM/aspera-cli#error-remote-host-is-not-who-we-expected)

# 3- Upload files to the cluster

For convenience, set the configuration as default for `node` operation (this avoids having to use option `-Pmy_cp4i_ak` later):

```bash
ascli conf id default set node my_cp4i_ak
```

Create a data file to be transfered:

```
sample_file=$(whoami).bin

truncate --size=1G $sample_file
```

Execute the `node upload` command:

```bash
ascli node upload $sample_file
```

This method uses a token of type "Aspera Token" (ATx) generated using API: `files/upload_setup`. Add option `--log-level=debug` to see operation traces, or `-r` to see HTTP traffic.

The destination folder is `/` by default relative to the access key root: `/data`. Add option `--to-folder=/xxx` to specify another destination sub-folder.

Other operations can be tested such as: `browse`, `delete`, `mkdir`, `download` :

```
ascli node browse /

ascli node download $sample_file --to-folder=/tmp
```

# 4- Send files from cluster to remote demo server

In this section, the `ascli` client remotely controls the Transfer server (HSTS) so that, as a client, the HSTS connects to another remote server, and uploads (server to server) the file.

```
+-----+
|ascli|  <---- on workstation
+-----+
  |
  +----------- remotely start and monitor a transfer using Node API
  |
  V
+----+
|HSTS|  <----- in CP4I
+----+
  |
  +----------- connect to remote server using SSH credentials 
  |            and transfer file (here push/PUT)
  V
+----+
|HSTS|  <----- other remote Aspera Server
+----+
```

Provision demo server address and credentials:

```
ascli conf initdemo
```

One can check the current configurations:

```
ascli conf overview
```

One can see that the demo server is accessed through basic "SSH credentials" (as opposed to Node credentials (HTTPS Basic Auth)).

Transfer files from the cluster to the remote server. 

```
ascli server upload /$sample_file --to-folder=/Upload --transfer=node --transfer-info=@preset:my_cp4i_ak --ts=@json:'{"target_rate_kbps":500000}'
```

Check file on destination:

```
ascli server browse /Upload
```

# 5- Transfer files between clusters

It is possible to start a transfer between two clusters doing the following:

* create two node configurations: node_local_client and node_remote_server
* execute a command for: local uploads to remote

```
ascli -Pnode_remote_server node upload $sample_file --transfer=node --transfer-info=@preset:node_local_client
```

or (remote downloads from local)

```
ascli -Pnode_local_client node download $sample_file --transfer=node --transfer-info=@preset:node_remote_server
```
