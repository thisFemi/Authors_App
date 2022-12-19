import 'package:authorsapp/providers/authors.dart';
import 'package:authorsapp/widgets/authors_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthorsListScreen extends StatefulWidget {
  const AuthorsListScreen({super.key});

  @override
  State<AuthorsListScreen> createState() => _AuthorsListScreenState();
}

class _AuthorsListScreenState extends State<AuthorsListScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(Duration(seconds: 1)).then((_) {
        Provider.of<Authors>(context, listen: false).fetchAndSetAuthors();
        setState(() {
          _isLoading = false;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Authors"),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : AuthorList());
  }
}
