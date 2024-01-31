# IdeskLiveChat Flutter SDK

The IdeskLiveChat Flutter SDK allows you to easily integrate live chat functionality into your Android and IOS application. This README provides an overview of how to use the library and get started with live chat in your app.

## Installation

Add `idesk_live_chat` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

## Prerequisites
This app uses [flutter_inappwebview](https://pub.dev/packages/flutter_inappwebview/versions/5.8.0) version 5.8.0.<br>Please make sure that you have configured it properly before using this package.<br>
See the [flutter_inappwebview](https://inappwebview.dev/docs/5.x.x/intro/) documentation for more information.

## Usage

To open the chat window when a button is clicked, follow these steps:

1. Import the necessary classes at the top of your dart file:

```dart
import 'package:idesk_live_chat/idesk_chat_config.dart';
import 'package:idesk_live_chat/idesk_live_chat.dart';
```

2. Berfore calling live chat widget config you need a configuration. Make an `IDeskLiveChatConfig` object with the required parameters:

```dart
 IDeskLiveChatConfig config = IDeskLiveChatConfig(
    resourceUri : "xxxx.idesk360.com",//required
    appUri : "xxx.idesk360.com",//required
    pageId : "xxxxxxx",//required
    miscellaneous : {"float": 0},//optional,
    customerInfo : {"name": "xxx", "rmn": "xxx"}//optional
);
```

Replace the values with your actual configuration provided by [Idesk360](https://www.idesk360.com/).


3. call  the `IDeskLiveChat` statefull widget where you want to use the live chat option:

```dart
IDeskLiveChat(config: config);
```
That's it! You can now see the live chat UI in your app.

## Attaching files
See the [Enable camera for HTML inputs](https://inappwebview.dev/docs/5.x.x/intro/#enable-camera-for-html-inputs) documentation for more information.

## Additional Configuration

You can further customize the chat window and behavior by modifying the `IDeskLiveChatConfig` object with additional options as needed.

## License
This SDK is licensed under the [MIT License.](https://opensource.org/license/mit/)

## Support

If you encounter any issues or have questions, [please contact our support team.](https://www.idesk360.com/contact/)
