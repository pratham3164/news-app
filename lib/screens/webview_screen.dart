import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/providers/articles.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final Article article;
  const WebViewScreen({Key key, this.article}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  Article get article => widget.article;
  int index = 1;

  finished() => setState(() {
        index = 0;
      });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(article.title),
            centerTitle: true,
            actions: [BookMarkButtton(article: article)],
          ),
          body: IndexedStack(
            index: index,
            children: [
              WebView(
                initialUrl: article.url,
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (_) => finished(),
              ),
              Center(child: CircularProgressIndicator()),
            ],
          )),
    );
  }
}

class BookMarkButtton extends StatefulWidget {
  const BookMarkButtton({
    Key key,
    @required this.article,
  }) : super(key: key);

  final Article article;

  @override
  _BookMarkButttonState createState() => _BookMarkButttonState();
}

class _BookMarkButttonState extends State<BookMarkButtton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          widget.article.isSaved ? Icons.bookmark : Icons.bookmark_border,
        ),
        onPressed: () {
          widget.article.isSaved = !widget.article.isSaved;
          setState(() {});
          widget.article.isSaved
              ? Provider.of<SavedArticles>(context, listen: false)
                  .saveArticle(widget.article)
              : Provider.of<SavedArticles>(context, listen: false)
                  .removeArticle(widget.article);
        });
  }
}
