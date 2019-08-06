
# xdemo_mobile_example

A new Flutter project.

## Getting Started

This project is a starting point for the XDemo Mobile Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Dependencies

* MultiValue Integration Server Community Edition - If this is not installed on your local machine, please follow the installation guide found [here](#)

* UniVerse - If UniVerse is not installed on your machine, please follow the installation guide found [here](#)

### Installation

This app depends on the Flutter SDK. The Flutter team has developed amazing online documentation. In order to get the MVoovies mobile app up and running, please follow the Flutter installion guide. Complete up to step 3, and then comeback to this wiki continue wth MVoovies specific steps.

[Click Here - Flutter Install Guide](https://flutter.dev/docs/get-started/install)

### Running a Local Instance of the Application

1. Clone [this](https://github.com/Chimer2017/xdemo_flutter) repo
2. Open up the project in your editor of choice
3. Run `flutter doctor`. Follow any recommended prompts to fix any issues.
    * Make sure that a mobile simulator or actual device is running and speaking to Flutter. This can be confirmed with the `flutter doctor` command
4. Run `flutter run`. This will start the app on the simulator or device of choice. However, this version is not deployable to app stores.

### Application Structure

* lib/ - This folder contains all dart classes and widget definitions for the application.
* ios/ & android/ - These folder contains operating system specific bundles to run the Flutter application on either platform.
* pubspec.yaml - This file contains all the dependicies for the application.
* main.dart - This file is the starting point of the app. Location of the main function.

### Configuration

The demo is by default set to work with a local copy of MVIS communit edition and the default port number. If you wish to configure your MVIS server or run it on premise or in the cloud, the demo will also need to be updated. There is the a "config.js" file in the root folder that contains the default port number and endpoint URI. Configure these to connect the demo application with your MVIS server






