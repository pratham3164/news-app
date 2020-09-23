import 'package:flutter/material.dart';
import 'package:newsapp/providers/articles.dart';
import 'package:newsapp/screens/bookmark_screen.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/search_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 1;
  List<IconData> iconData = [Icons.search, Icons.home, Icons.menu];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          ChangeNotifierProvider(
            create: (ctx) => SearchArticles(),
            child: SearchScreen(),
          ),
          HomeScreen(),
          SavedScreen()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            elevation: 3,
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                  title: currentIndex == 0
                      ? SizedBox.shrink()
                      : Text('Search', style: TextStyle(color: Colors.grey)),
                  icon: currentIndex == 0
                      ? Container(
                          height: kBottomNavigationBarHeight * 0.8,
                          width: kBottomNavigationBarHeight * 0.8,
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              shape: BoxShape.circle),
                          child: Center(
                              child: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                        )
                      : Icon(
                          Icons.search,
                          color: Colors.grey,
                        )),
              BottomNavigationBarItem(
                  title: currentIndex == 1 ? SizedBox.shrink() : Text('Home'),
                  icon: currentIndex == 1
                      ? Container(
                          height: kBottomNavigationBarHeight * 0.8,
                          width: kBottomNavigationBarHeight * 0.8,
                          // padding: EdgeInsets.all(kBottomNavigationBarHeight * 0.2),
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              shape: BoxShape.circle),
                          child: Center(
                              child: const Icon(
                            Icons.home,
                            color: Colors.white,
                          )),
                        )
                      : const Icon(
                          Icons.home,
                          color: Colors.grey,
                        )),
              BottomNavigationBarItem(
                  title: currentIndex == 2
                      ? SizedBox.shrink()
                      : const Text('Saved'),
                  icon: currentIndex == 2
                      ? Container(
                          height: kBottomNavigationBarHeight * 0.8,
                          width: kBottomNavigationBarHeight * 0.8,
                          // padding: EdgeInsets.all(kBottomNavigationBarHeight * 0.2),
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              shape: BoxShape.circle),
                          child: Center(
                              child: Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          )),
                        )
                      : Icon(
                          Icons.bookmark,
                          color: Colors.grey,
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
