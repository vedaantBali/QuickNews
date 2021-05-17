import 'dart:async';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String newsUrl;
  ArticleView({this.newsUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState(newsUrl: newsUrl);
}

class _ArticleViewState extends State<ArticleView> {

  final String newsUrl;
  
  _ArticleViewState({this.newsUrl});
  
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  Share.share('Read news on the QuickNews App\n$newsUrl');
                }),
          )
        ],
        backgroundColor: Color(0xff121212),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Quick'),
            Text(
              'News',
              style: TextStyle(color: Colors.indigoAccent),
            )
          ],
        ),
      ),
      body: WebView(
          initialUrl: widget.newsUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          })),
    );
  }
}
