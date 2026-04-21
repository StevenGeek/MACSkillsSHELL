    #!/bin/bash
    
    APP_NAME="WeChat"
    APP_PATH="/Applications/${APP_NAME}.app"
    COPY_PATH="/Applications/${APP_NAME}2.app"
    
    echo "正在检查原应用..."
    if [ ! -d "$APP_PATH" ]; then
        echo "错误：未在 /Applications 找到微信，请确认安装位置。"
        exit 1
    fi
    
    echo "正在创建副本..."
    sudo rm -rf "$COPY_PATH"
    sudo cp -R "$APP_PATH" "$COPY_PATH"
    
    echo "正在清除旧签名和属性..."
    sudo xattr -cr "$COPY_PATH"
    sudo codesign --remove-signature "$COPY_PATH"
    
    echo "正在修改 Bundle ID..."
    # 递归查找所有 Info.plist 并修改
    find "$COPY_PATH" -name "Info.plist" -exec sudo /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier com.tencent.xinWeChat2" {} \; 2>/dev/null
    
    echo "正在重新签名..."
    sudo codesign --force --deep --sign - "$COPY_PATH"
    
    echo "✅ 完成！请在应用程序文件夹中打开 'WeChat2' 进行登录。"