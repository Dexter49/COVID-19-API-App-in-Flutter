# COVID-19 API app

A Demo Flutter app.

## Getting Started

A simple guide on how to deploy and run my COVID-19 API app built using Flutter from Google.
Although Flutter has a single code-base and is cross-platform(for Android & iOS), this guide is
meant for developers looking to run and test their Android apps on the Windows OS. For an elaborate
guide for developing for iOS devices on the macOS platform, refer the Flutter Docs for iOS.

You should have installed JDK 8 Android SDK and added them to PATH to be able to build and run Android apps on Windows.

## Requirements for Windows

1. Windows 7/8/8.1/10 (preferably Windows 10 64-bit).
2. Android Studio 3.6 or later.
3. Android SDK Tools and Emulators (latest version).
4. Code Editor (preferably VS Code).

## Tools for Windows

1. Dart 2.7.0 or later.
2. Flutter 1.12.13+hotfix.8 or later.

## Plugins for Android Studio

1. Flutter.
2. Dart.

## Extensions for VS Code

1. Flutter support for VS Code.
2. Dart language support for VS Code.

## Installation

```
To be able to run this app on Windows, ensure you have installed the items listed under
"Requirements for Windows".
```

```
Next, download the items listed under "Tools for Windows".

Having downloaded the tools, run the Dart setup file to install the Dart programming language.

Also, extract the Flutter ZIP file.
```

## Warning

```
NOTE
Do not install in a directory like 'Program Files' or any directory that has whitespaces
because you will encounter errors when running commands like `flutter --version` in the
command-line and also experience difficulties when trying to point the Dart installation
and Flutter SDK to PATH.

Install in a directory like mine to be able to run commands like `flutter run` & `flutter --version`
from the command prompt(command-line)

Dart installation folder: `C:\Users\hpuser\dart-sdk`
Flutter installation folder: `C:\Users\hpuser\flutter`
```

### Adding to PATH

Adding to PATH can be very tricky and a little annoying, but with this guide, your setup process
should be hassle-free.

```
1. From the desktop, right-click on 'My Computer', 'This PC' or whatever is the name of your PC and click on 'Properties'.
2. Next, click on 'Advanced system settings' then click on 'Environment Variables'.
3. Under the 'User variables' tab, scroll down to 'PATH' and double-click to edit it.
4. To add Flutter to PATH, click on 'New' and put the Flutter installation directory like so:
    'C:\UserPC\User\flutter\bin'. Mine was'C:\Users\hpuser\flutter\bin'.
5. Then hit OK.
6. Next, go to the 'System variables' tab and click 'New'.
7. For Variable Name type in DART_SDK and for Variable value type in the directory of your Dart installation directory like so:
        'C:\UserPC\User\dart-sdk\Dart\dart-sdk'. Mine was 'C:\Users\hpuser\dart-sdk\Dart\dart-sdk'.
8. Then hit OK.
9. Still under 'System variables' tab, scroll down and find "Path" and double-click it to edit it.
10. Next, click on 'New' and point to the BIN folder in your Dart installation directory like so:
        'C:\UserPC\User\dart-sdk\Dart\dart-sdk\bin'. Mine was 'C:\Users\hpuser\dart-sdk\Dart\dart-sdk\bin'.
11. Then hit OK thrice(three times).
12. Now, type cmd.exe in the Windows search bar and hit Enter
13. Type `flutter --version` and hit Enter. It should print out details of your Dart and Flutter installations similar to this below:
        Flutter 1.12.13+hotfix.8 • channel stable • https://github.com/flutter/flutter.git
        Framework • revision 0b8abb4724 (3 weeks ago) • 2020-02-11 11:44:36 -0800
        Engine • revision e1e6ced81d
        Tools • Dart 2.7.0
14. If for some reason it gives and error, go over this section for anything you might have missed.
```

## Building and running the app

```
1. Start up the Android Emulator on your PC and leave it running
2. In the command-line, type `flutter doctor`. You should see something like so:
        Doctor summary (to see all details, run flutter doctor -v):
        [√] Flutter (Channel stable, v1.12.13+hotfix.9, on Microsoft Windows [Version 10.0.18363.693],
        locale en-US)

        [!] Android toolchain - develop for Android devices (Android SDK version 29.0.3)
        X Android license status unknown.
        Try re-installing or updating your Android SDK Manager.
        See https://developer.android.com/studio/#downloads or visit
        https://flutter.dev/setup/#android-setup for detailed instructions.
        [√] Android Studio (version 3.6)
        [√] Connected device (1 available)

        !Doctor found issues in 1 category.

    Note that mine is having issues finding the Android toolchain but the app still builds and runs fine.
3. From the command-line on your machine, clone the app project like so:
        git clone https://github.com/Dexter49/COVID-19-API-App-in-Flutter.git
4. Once successfully cloned, cd into the directory of the app, type `flutter run` and hit Enter
5. Depending on the specs of your machine, it should take between 30-120 seconds
   for the app to be built and run successfully.
6. That's it. You're done. You are now a tester for Flutter apps
```
