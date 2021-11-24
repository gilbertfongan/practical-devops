**Global Instructions-JENKINS**


Use this link to connect the CI Pipeline to the repository https://github.com/gilbertfongan/demo-jenkins



**INSTALL JAVA ON WINDOWS**

Step 0: Un-Install Older Version(s) of JDK/JRE
It is recommend that you install only the latest JDK. Although you can install multiple versions of JDK/JRE concurrently, it is messy.
If you have previously installed older version(s) of JDK/JRE, un-install ALL of them. Goto "Control Panel" ⇒ "Programs" ⇒ "Programs and Features" ⇒ Un-install ALL programs begin with "Java", such as "Java SE Development Kit ...", "Java SE Runtime ...", "Java X Update ...", and etc.

Step 1: Download JDK
1.	Goto Java SE download site @ http://www.oracle.com/technetwork/java/javase/downloads/index.html.
2.	Under "Java Platform, Standard Edition" ⇒ "Java SE 8.0.{x}", where {x} denotes a fast running update number ⇒ Click the JDK's "Download" button.
3.	Under "Java SE Development Kit 8.0.{x}" ⇒ Check "Accept License Agreement".
4.	Choose the JDK for your operating system, i.e., "Windows" (for 64-bit Windows OS), and download the installer (e.g., "jdk-8.0.{x}_windows-x64_bin.exe" - 283MB).

Step 2: Install JDK and JRE
Run the downloaded installer (e.g., "jdk-8.0.{x}_windows-x64_bin.exe"), which installs both the JDK and JRE.
By default:
•	JDK is installed in directory "C:\Program Files\Java\jdk-8.0.{x}", where {x} denotes the upgrade number; and
•	JRE is installed in "C:\Program Files\Java\jre-8.0.{x}".
Notes: In 64-bit Windows, "Program Files" is meant for 64-bit programs; while "Program Files (x86)" for 32-bit programs.
Accept the defaults and follow the screen instructions to install JDK and JRE.
Use the "File Explorer", goto "C:\Program Files\Java" to inspect these folders. Take note of your JDK installed directory, in particular, the varying upgrade number, which you will need in the next step.
In the following diagram, the JDK installed directory is "C:\Program Files\Java\jdk-8.0.1", where {x}=1. I shall refer to the JDK installed directory as <JAVA_HOME>, hereafter, in this article.

Step 3: Include JDK's "bin" Directory in the PATH
Windows' Shell searches the current directory and the directories listed in the PATH environment variable (system variable) for executable programs. JDK's programs (such as Java compiler javac.exe and Java runtime java.exe) reside in the sub-directory "bin" of the JDK installed directory. You need to include "bin" in the PATH to run the JDK programs.
To edit the PATH environment variable in Windows 7/8/10:
-	Launch "Control Panel" ⇒ (Optional) System and Security ⇒ System ⇒ Click "Advanced system settings" on the left pane.
-	Switch to "Advanced" tab ⇒ Push "Environment Variables" button.
-	Under "System Variables" (the bottom pane), scroll down to select "Path" ⇒ Click "Edit...".
-	For Windows 10 (newer releases):
You shall see a TABLE listing all the existing PATH entries (if not, goto next step). Click "New" ⇒ Enter the JDK's "bin" directory "c:\Program Files\Java\jdk-8.0.{x}\bin" (Replace {x} with your installation number!!!) ⇒ Select "Move Up" to move this entry all the way to the TOP.

Prior to newer Windows 10:
(CAUTION: Read this paragraph 3 times before doing this step! Don't push "Apply" or "OK" until you are 101% sure. There is no UNDO!!!)
(To be SAFE, copy the content of the "Variable value" to Notepad before changing it!!!)
In "Variable value" field, INSERT "c:\Program Files\Java\jdk-8.0.{x}\bin" (Replace {x} with your installation number!!!) IN FRONT of all the existing directories, followed by a semi-colon (;) which separates the JDK's bin directory from the rest of the existing directories. DO NOT DELETE any existing entries; otherwise, some existing applications may not run.
Variable name  : PATHVariable value : c:\Program Files\Java\jdk-8.0.{x}\bin;[do not delete exiting entries...]
Notes: Starting from JDK 1.8, the installation created a directory "c:\ProgramData\Oracle\Java\javapath" and added to the PATH. It contains only JRE executables (java.exe, javaw.exe, and javaws.exe), but NOT the JDK executables (e.g., javac.exe).

Step 4: Verify the JDK Installation
Launch a CMD shell via one of the following means:
-	Click "Search" button ⇒ Enter "cmd" ⇒ Choose "Command Prompt", or
-	right-click "Start" button ⇒ run... ⇒ enter "cmd", or
-	(Prior to Windows 10) click "Start" button ⇒ All Programs ⇒ Accessories (or Windows System) ⇒ Command Prompt, or
-	(Windows 10) click "Start" button ⇒ Windows System ⇒ Command Prompt.
Issue the following commands to verify your JDK installation:
1.	Issue "path" command to list the contents of the PATH environment variable. Check to make sure that your <JAVA_HOME>\bin is listed in the PATH.
Don't type prompt>, which denotes the command prompt!!! Key in the command (highlighted) only.
1.	// Display the PATH entriesprompt> pathPATH=c:\Program Files\Java\jdk-8.0.{x}\bin;[other entries...]
2.	Issue the following commands to verify that JDK/JRE are properly installed and display their version:
1.	// Display the JRE versionprompt> java -versionjava version "1.8.0_151"Java(TM) SE Runtime Environment (build 1.8.0_151-b12)Java HotSpot(TM) 64-Bit Server VM (build 25.151-b12, mixed mode)

