@echo off
echo ==================================================
echo Michael Gritzbach Digital Business Card - APK Builder
echo ==================================================
echo.
echo Phase 1: Checking for Docker...
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker is not running. 
    echo Please start Docker Desktop and try again.
    pause
    exit /b
)

echo Phase 2: Building your APK using a cloud-ready container...
echo This may take a few minutes for the first run...
echo.

docker run --rm -v "%cd%:/project" -w /project alvrme/alpine-android:latest /bin/sh -c "
    echo 'Installing build dependencies...' &&
    apk add --no-cache nodejs npm &&
    npm install &&
    npm run build &&
    npx cap sync android &&
    cd android &&
    chmod +x gradlew &&
    ./gradlew assembleDebug
"

if exist "android\app\build\outputs\apk\debug\app-debug.apk" (
    copy "android\app\build\outputs\apk\debug\app-debug.apk" "..\michael-gritzbach-card.apk"
    echo.
    echo [SUCCESS] Your APK has been created: michael-gritzbach-card.apk
    echo You can find it in the 'Others' folder.
) else (
    echo.
    echo [ERROR] Build failed. Check the output above.
)

pause
