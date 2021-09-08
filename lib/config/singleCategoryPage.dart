import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utilites/toolsUtilities.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webViewKey = GlobalKey<WebViewContainerState>();

class SingleCategoryPage extends StatefulWidget {
  final String categoryUrl;
  final String categoryName;
  final BuildContext context;

  final IconData icon;
  final String indexCategory;

  final int index;

  SingleCategoryPage({
    this.categoryUrl,
    this.categoryName,
    @required this.context,
    @required this.icon,
    @required this.indexCategory,
    @required this.index,
  });

  @override
  SingleCategoryPageState createState() => SingleCategoryPageState();
}

class SingleCategoryPageState extends State<SingleCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        backgroundColor: ToolsUtilities.mainColor,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // using currentState with question mark to ensure it's not null
              webViewKey.currentState?.reloadWebView();
            },
          )
        ],
      ),
      body: WebViewContainer(widget.categoryUrl, key: webViewKey),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  final String categoryUrl;
  WebViewContainer(this.categoryUrl, {Key key}) : super(key: key);

  @override
  WebViewContainerState createState() => WebViewContainerState();
}

class WebViewContainerState extends State<WebViewContainer> {
  WebViewController _webViewController;
  bool showSpinner = true;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Color(0xFF002147),
      inAsyncCall: showSpinner,
      child: WebView(
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        initialUrl: widget.categoryUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (finished) {
          setState(() {
            showSpinner = false;
          });
        },
      ),
    );
  }

  void reloadWebView() {
    _webViewController?.reload();
    print(widget.categoryUrl);
  }
}
