Notes
--------
A simple notes app written in Dart using Flutter framework.

<a href='https://play.google.com/store/apps/details?id=com.theimpulson.notes'><img src='assets/google-play.png' alt='Get it on Google Play' height=45/></a>

## Compilation

To compile this app, simply clone the repo and run the following command:

```
flutter build <package-type> --target-platform <platform> --split-per-abi
```

- Package types can be : `apk` or `aab`
- Platforms can be : As supported by Flutter for e.g. `android-arm`, `android-arm64` etc. If no platform is specified, flutter will default to all platforms supported at the moment.
- If `--split-per-abi` argument is not provided, Flutter will generate a `fat` package which will be larger in size but will support all platforms.

## Development

You can simply import this project into your Android Studio or VS Code. Follow [official instructions](https://flutter.dev/docs/get-started/install) to set up SDKs required for development if not done already.
