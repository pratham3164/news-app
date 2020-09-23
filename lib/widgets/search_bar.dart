import 'package:flutter/material.dart';
import 'package:newsapp/providers/articles.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String searchKey;

  search() {
    try {
      Provider.of<SearchArticles>(context, listen: false).fetchData(searchKey);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Provider.of<SearchArticles>(context, listen: false)
                            .fetchData(searchKey);
                        Navigator.pop(context);
                      },
                      child: Text('Retry'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: TextFormField(
        onChanged: (value) {
          searchKey = value;
          setState(() {});
        },
        onFieldSubmitted: (_) => searchKey?.trim()?.isNotEmpty != null &&
                searchKey.trim().isNotEmpty == false
            ? null
            : search(), //Todo:
        decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: searchKey?.trim()?.isNotEmpty != null &&
                          searchKey.trim().isNotEmpty
                      ? Colors.black
                      : Colors.grey,
                ),
                onPressed: () => searchKey?.trim()?.isNotEmpty != null &&
                        searchKey.trim().isNotEmpty
                    ? search()
                    : null),
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30.0))),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30.0)))),
      ),
    );
  }
}
