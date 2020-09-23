import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/screens/webview_screen.dart';

class CustomArticleCard extends StatelessWidget {
  const CustomArticleCard({
    Key key,
    @required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => WebViewScreen(
                article: article,
              ))),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(5),
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3),
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      errorWidget: (ctx, _, __) => Container(
                          width: double.infinity,
                          height: 130,
                          child: Center(
                              child:
                                  Icon(Icons.error_outline, color: Colors.red)),
                          color: Colors.grey),
                      imageUrl: article.urlToImage,
                      progressIndicatorBuilder: (ctx, _, dp) => Container(
                          width: double.infinity,
                          height: 130,
                          child: Center(
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                value: dp.progress,
                              ),
                            ),
                          ),
                          color: Colors.grey),
                    )),
                SizedBox(height: 4),
                Text(
                  article.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )),
      ),
    );
  }
}
