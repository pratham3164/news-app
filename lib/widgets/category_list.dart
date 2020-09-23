import 'package:flutter/material.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/providers/articles.dart';
import 'package:newsapp/widgets/alert.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  Future<void> updateCategory([BuildContext context, String title]) async {
    try {
      await Provider.of<Articles>(context, listen: false).updateCategory(title);
    } catch (e) {
      print('eroor handlng');
      dialog(context, e.toString(), updateCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    String cat = Provider.of<Articles>(context).category;
    return Container(
      height: 105,
      padding: EdgeInsets.all(5),
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories.map((category) {
          print(cat + " " + category.title);
          return GestureDetector(
            onTap: () => updateCategory(context, category.title),
            child: Container(
              height: 90,
              width: 80,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: cat == category.title ? 70 : 65,
                    width: cat == category.title ? 70 : 65,
                    child: Center(child: Text(category.title[0])),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: cat == category.title ? 3 : 2,
                          color: cat == category.title
                              ? Theme.of(context).accentColor
                              : Colors.grey,
                        )),
                  ),
                  SizedBox(height: 5),
                  FittedBox(
                    child: Text(category.title,
                        // overflow: TextOverflow.fade,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
