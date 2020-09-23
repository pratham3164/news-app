import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/providers/articles.dart';
import 'package:newsapp/widgets/custom_article_tile.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Articles'),
        centerTitle: true,
      ),
      body: Feed(),
    );
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Article> _articles = Provider.of<SavedArticles>(context).articles;
    print('Feed');
    return _articles.isEmpty
        ? Center(child: const Text('No Bookmarks Yet'))
        : ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (context, index) {
              Article article = _articles[index];
              return article.title == null
                  ? SizedBox.shrink()
                  : CustomArticleTile(article: article);
            });
  }
}
