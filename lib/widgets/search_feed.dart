import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/providers/articles.dart';
import 'package:newsapp/widgets/custom_article_tile.dart';
import 'package:provider/provider.dart';

class SearchFeed extends StatefulWidget {
  @override
  _SearchFeedState createState() => _SearchFeedState();
}

class _SearchFeedState extends State<SearchFeed> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchArticles>(context);
    List<Article> _articles = provider.articles;
    print('inside Search');
    print(_articles);

    return _articles.isEmpty
        ?provider.isSearching? Center(child: CircularProgressIndicator()):SizedBox.shrink()
        :

        AnimatedList(
            key: _listKey,
            
            initialItemCount: _articles.isEmpty ? 0 : _articles.length,
            itemBuilder: (ctx, index, animation) {
              Article article = _articles[index];
              return article.title == null
                  ? SizedBox.shrink()
                  : FadeTransition(
                      opacity: animation,
                      child: CustomArticleTile(article: article));
            });

  //       ListView.builder(
  //           itemCount: _articles.length,
  //           itemBuilder: (context, index) {
  //             Article article = _articles[index];
  //             return article.title == null
  //                 ? SizedBox.shrink()
  //                 : CustomArticleTile(article: article);
  //           });
  }
}
