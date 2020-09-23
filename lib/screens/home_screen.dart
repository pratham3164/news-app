import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/providers/articles.dart';
import 'package:newsapp/providers/theme.dart';
import 'package:newsapp/widgets/alert.dart';
import 'package:newsapp/widgets/category_list.dart';
import 'package:newsapp/widgets/custom_article_card.dart';
import 'package:newsapp/widgets/custom_article_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  bool isInit = false;
  @override
  void initState() {
    super.initState();
  }

  fetchInitialData() async {
    try {
      await Provider.of<Articles>(context, listen: false)
          .fetchData()
          .then((_) => setState(() {
                isLoading = false;
              }));
    } catch (e) {
      dialog(context, e.toString(), fetchInitialData);
    }
  }

  @override
  void didChangeDependencies() {
    if (!isInit) {
      fetchInitialData();
    }
    isInit = true;
    super.didChangeDependencies();
  }

  String cat = categories[0].title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PNews'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb_outline,
                color: Provider.of<DarkThemeProvider>(context).isDarkTheme
                    ? Colors.black
                    : Colors.white),
            onPressed: () =>
                Provider.of<DarkThemeProvider>(context, listen: false)
                        .toggleTheme =
                    !Provider.of<DarkThemeProvider>(context).isDarkTheme,
          )
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                CategoryList(),
                Expanded(
                  child: Feed(),
                ),
              ],
            ),
    );
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Article> _articles = Provider.of<Articles>(context).articles;
    print('Feed');
    return _articles.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (context, index) {
              Article article = _articles[index];
              return article.title == null
                  ? SizedBox.shrink()
                  : (index == 0)
                      ? CustomArticleCard(article: article)
                      : CustomArticleTile(article: article);
            });
  }
}
