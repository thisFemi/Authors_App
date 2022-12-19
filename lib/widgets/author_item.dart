import 'package:authorsapp/providers/author.dart';
import 'package:authorsapp/screens/author_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthorItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final author = Provider.of<Author>(context, listen: false);
    return ListTile(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AuthorDetailScreen.routeName, arguments: author.id);
      },
      leading: Image.network(
          "https://images.quotable.dev/profile/400/${author.slug}.jpg"),
      title: Text(author.name),
      subtitle: Text(author.description),
      trailing: Text(author.quoteCount.toString()),
    );
  }
}
