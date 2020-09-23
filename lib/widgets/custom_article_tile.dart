import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/screens/webview_screen.dart';

class CustomArticleTile extends StatelessWidget {
  const CustomArticleTile({
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
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: article.urlToImage,
                  errorWidget: (ctx, _, __) => Container(
                      width: double.infinity,
                      height: 130,
                      child: Center(
                          child: Icon(Icons.error_outline, color: Colors.red)),
                      color: Colors.grey),
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
            SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title == null ? '' : article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 7),
                  Text(article.description == null ? '' : article.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 13,
                      )),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Time',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                      Text(
                        'Read More >',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
