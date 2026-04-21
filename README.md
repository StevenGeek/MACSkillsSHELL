🚀 WeChat Dual-Boot for macOS
A simple shell script to help you run multiple instances of WeChat on a single Mac.
This script automates the process of copying the app, changing the Bundle ID, and re-signing the application, allowing you to log in to a second WeChat account simultaneously.
🛠️ How to Use
Download the wechat_dual.sh script.
Open your Terminal.
Grant execution permission to the script.
Run the script.
Commands:
```
# 1. Make the script executable
# (Replace the path if your file is not on the Desktop)
chmod +x ~/Desktop/doubleWechat.sh

# 2. Run the script with sudo (required for app modification)
sudo ~/Desktop/DoubleWechat.sh
```
⚠️ Note:
The script usually requires sudo privileges to modify system files and codesign the app.
If you moved the script to another folder, please update the path in the commands above.
⚙️ Customization
This script is designed to be flexible. You can easily modify it for other apps or change the copied app's name:
Change App Name: Open the .sh file with a text editor and look for the APP_NAME or COPY_NAME variables.
Support Other Apps: The logic works for other macOS apps that need multi-instance support. You just need to update the source path and the new Bundle ID.
📝 How it Works
Copy: Duplicates the original WeChat app.
Modify: Changes the CFBundleIdentifier in Info.plist to avoid conflicts.
Resign: Removes old signatures and applies a new one to ensure the app launches correctly.
