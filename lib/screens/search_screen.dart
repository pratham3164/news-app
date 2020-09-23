import 'package:flutter/material.dart';
import 'package:newsapp/widgets/search_bar.dart';
import 'package:newsapp/widgets/search_feed.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          SearchBar(),
          Expanded(
            child: SearchFeed(),
          )
        ]),
      ),
    );
  }
}
