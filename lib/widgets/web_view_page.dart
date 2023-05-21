import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:first/widgets/centered_circular_progress_indicator.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  bool _isLoading = false;
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0xffffffff))
    ..loadRequest(Uri.parse("https://search.club"));

  @override
  void initState() {
    super.initState();
    controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          print('progress----------$progress');
        },
        onPageStarted: (String url) {
          _isLoading = true;
          print('Started-------$url -- $_isLoading');
        },
        onPageFinished: (String url) {
          _isLoading = false;
          print('Finished--------$url -- $_isLoading');
        },
        onWebResourceError: (WebResourceError request) {},
        // onNavigationRequest: (NavigationRequest request) {
        //   return NavigationDecision.navigate;
        // },
      ),
    );
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    controller
      ..clearLocalStorage()
      ..clearCache()
      ..removeJavaScriptChannel('channel');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("web"),
        // ),
        appBar: null,
        backgroundColor: const Color(0xFF666666),
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.topCenter,
            child: WebViewWidget(controller: controller),
          ),
          // _isLoading ? const CenteredCircularProgressIndicator() : const Stack()
          Visibility(
            visible: _isLoading,
            child: const CenteredCircularProgressIndicator(),
          )
        ]));
  }
}
