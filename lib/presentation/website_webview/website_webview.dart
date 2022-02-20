import 'dart:io';
import 'package:atsign_location_app/shared/colors.dart';
import 'package:atsign_location_app/shared/common_components/iconly_icon.dart';
import 'package:atsign_location_app/shared/common_components/icons_curved.dart';
import 'package:atsign_location_app/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsiteScreen extends StatefulWidget {
  const WebsiteScreen({Key? key, required this.title, required this.url})
      : super(key: key);

  final String title;
  final String url;
  @override
  _WebsiteScreenState createState() => _WebsiteScreenState();
}

class _WebsiteScreenState extends State<WebsiteScreen> {
  late bool loading;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AllColors().WHITE,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: IconlyIcon(
            path: IconlyCurved.ArrowLeft2,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
        ),
        title: Text(widget.title, style: CustomTextStyles().black18),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (test1) {
              setState(() {
                loading = false;
              });
            },
          ),
          if (loading)
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AllColors().ORANGE,
                ),
              ),
            )
          else
            const SizedBox()
        ],
      ),
    );
  }
}
