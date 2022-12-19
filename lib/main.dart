import 'package:authorsapp/screens/author_detail_screen.dart';
import 'package:authorsapp/screens/authors_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:authorsapp/providers/authors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authors(),
        )
      ],
      child: MaterialApp(
        title: 'Authors App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: AuthorsListScreen(),
        routes: {AuthorDetailScreen.routeName: (ctx) => AuthorDetailScreen()},
      ),
    );
  }
}
