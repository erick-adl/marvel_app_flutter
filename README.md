# Marvel App flutter

A Flutter application looks alike Mavel app and using Inject and Bloc.

<img height="480px" src="https://github.com/erick-adl/marvel_app_flutter/blob/master/screenshot/5.jpg">

## First of all
### libraries and approaches:
```
dependencies:
  flutter:
    sdk: flutter
  flutter_launcher_icons: ^0.7.4
  cached_network_image: ^2.0.0
  rxdart: ^0.18.0
  http: ^0.12.0+1
  intl: ^0.15.8
  inject:
    git:
      url: https://github.com/google/inject.dart.git
      path: package/inject

dependency_overrides:
  analyzer: ^0.36.3

dev_dependencies:
  flutter_test:
    sdk: flutter

  mockito: ^4.1.0 
  build_runner: ^1.0.0
  inject_generator:
    git:
      url: https://github.com/google/inject.dart.git
      path: package/inject_generator
```


## Getting Started

1. First you need to install [Flutter](https://flutter.dev/docs/get-started/install) and the setup as well.
2. Second you need to install [Android Studio](https://developer.android.com/studio/install) and [Xcode](https://developer.apple.com/xcode/) for the virtual device.
    Clone this repository
    ```
    git clone git@github.com:erick-adl/flutter-marvel.git
    ```
3. Open the project in your favorite IDE, in this case I'm using [VSCode](https://code.visualstudio.com/), install Dart plugin, then 
    cmd + shift + p, type Pub: Get Packages.
4. cmd + shift + p, type Flutter: Run Flutter Doctor, this command will help you to check if your flutter application can run on both android and ios platform.
5. Navigate to marvel_app/lib/marvel_key.dart and change the key "<YOUR_MARVEL_API_KEY>" to your own api key. To get your api key please register first in here [MARVEL API Docs](https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0)
6. Run: 
    ```
    flutter packages pub run flutter_launcher_icons:main
    ```
   This command will change the app icons on start, see [flutter_launcher_icons](https://pub.dartlang.org/packages/flutter_launcher_icons)
7. Voila, now you can start the application, first navigate inside screeshot folder:
    ```
    cd marvel_app
    flutter run --release
    or 
    To run the application you can press F5.

    ```

8. If you want to run this app on iOS, navigate to 
    ```
    marvel_app/ios
    ```
    then in terminal type: 
    ```
    pod install
    ```
This command will help you generate pods file to bundle the library to xcode emulator. See [cocoapods](https://cocoapods.org/)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.



