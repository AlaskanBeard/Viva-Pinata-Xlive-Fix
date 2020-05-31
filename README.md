# Viva Pinata Xbox Live/Games for Windows Live Fix
This repository hosts an installer and files to fix Viva Pinata's requirement of Games for Windows Live

### Steps Using the Install.bat
1. Download the files from GitHub
2. Extract the files to their own folder.
3. Right click on the Install.bat and click Run as Administrator.
4. Enter your desired username (it's what will show in game)
5. If your game is installed in the default directory, it will copy the files, updated with your desired username.
6. If your game is NOT installed in the default directory, it will ask you to browse to your game folder and copy the files.

### Steps to Install Manually
1. Download the files from GitHub.
2. Extract the files to their own folder.
3. Right click on xlive.ini and Click Open With
  1. Select Notepad, or Choose another App and select Notepad
4. Change Replace the YourName in Username = YourName with your desired username.
5. Copy the xlive.dll and xlive.ini to the root of your Viva Pinata install, where the Viva Pinata.exe is.
