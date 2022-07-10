import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailWebView extends StatefulWidget {
  final url;
  DetailWebView(this.url);
  @override
  createState() => _DetailWebViewState(this.url);
}

class _DetailWebViewState extends State<DetailWebView> {
  var _url;
  final _key = UniqueKey();
  _DetailWebViewState(this._url);
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Parent(
              style: ParentStyle()..margin(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  InkWell(
                    child: const Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "Detail",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url,
                    onPageFinished: (finish) {
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Stack()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
