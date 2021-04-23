import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocatorTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: 'https://www.google.com/maps/search/pakistan+currency+exchange/@24.8604927,67.0549789,15.96z',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
