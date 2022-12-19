import 'package:authorsapp/providers/authors.dart';
import 'package:authorsapp/widgets/author_item.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthorList extends StatelessWidget {
  const AuthorList({super.key});

  @override
  Widget build(BuildContext context) {
    final authorsData = Provider.of<Authors>(context);
    final authors = authorsData.authors;
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: authors.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: authors[i],
        child: AuthorItem(),
      ),
    );
  }
}
