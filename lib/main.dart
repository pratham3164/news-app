import 'package:flutter/material.dart';
import 'package:newsapp/providers/articles.dart';
import 'package:newsapp/providers/theme.dart';
import 'package:newsapp/screens/tabs.dart';
import 'package:newsapp/utils/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeProvider.toggleTheme = await themeProvider.theme.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: Consumer(
          builder: (ctx, value, _) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: Styles.themedata(themeProvider.isDarkTheme, context),
                home: MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (_) => Articles(),
                    ),
                    ChangeNotifierProvider(
                      create: (_) => SavedArticles(),
                    ),
                  ],
                  child: TabsScreen(),
                ),
              )),
    );
  }
}
