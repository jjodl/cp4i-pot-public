# Setup environment for MQ PoT

[Return to Message Prereq lab page](../../../Messaging/msg-index.md#lab-prereq)

<a name="download"></a>	
## Download artifacts for MQ on CP4I PoT

You should be logged on your VDI as *student*. 

1. Open a Firefox browser tab and navigate to [Github MQonCP4i](https://github.com/jjodl/mqoncp4i).

	![](./images/image108.png)
	
1. Click *Code* and select *Download zip*.

	![](./images/image109.png)

1. Click *Save file* radio button then click *OK*.

	![](./images/image110.png)
	
1. Open a terminal window by double-clicking the icon on the desktop.

	![](./images/image111.png)
	
1. Enter the following command to see the zip file you just downloaded.

	```
	cd Downloads
	```
	
1. Enter the following command to unzip the downloaded file:

	```
	unzip mqoncp4i-main.zip
	```
	
	![](./images/image112a.png)
	
1. Move the unzipped directory to your home directory with the following command:
	
	```
	cd mqoncp4i-main
	```
	
	```
	mv MQonCP4I/ ~/
	```
	
	![](./images/image113a.png) 
	
	This will create the directory **/home/student/MQonCP4I**.  Change to your home directory and list the contents of the directory to verify that it contains *MQonCP4I*. 
	
	```sh
	cd ~/MQonCP4I
	ls -l 
	```
1. Now first we will need to change the mode to executable for all the scripts.   From the MQonCP4I directory run the following command.

	```
	find . -type f -iname "*.sh" -exec chmod +x {} \;
	```
	
![](./images/image114a.png)

9. Now we will change to the **setup** directory to run the script that will create all the install scripts for your userid.  
	
	```sh
	cd setup
	ls -l 
	```
	
	![](./images/image114b.png)

1. 	Now run the MQ_script_setup.sh You will use your student id that was given to you from the instructor.

**Note:** In this example we are user palpatine5 so would use that as the namespace and 05 as the student id.

![](./images/image114c.png)
	
Great! You are now ready to start working in the MQ and Kafka labs. 

[Return to Message Prereq lab page](../../../Messaging/msg-index.md#lab-prereq)