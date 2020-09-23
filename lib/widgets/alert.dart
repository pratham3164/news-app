import 'package:flutter/material.dart';

final dialog = (BuildContext context, String title,
        Function([BuildContext context, String title]) update) =>
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              actions: [
                FlatButton(
                    onPressed: () {
                      update(context, title);
                      Navigator.pop(context);
                    },
                    child: Text('Retry'))
              ],
            ));
