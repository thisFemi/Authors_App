import 'package:authorsapp/providers/authors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthorDetailScreen extends StatelessWidget {
  const AuthorDetailScreen({super.key});
  static const routeName = '/author-detail';

  @override
  Widget build(BuildContext context) {
    final authorId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedAuthor =
        Provider.of<Authors>(context, listen: false).findById(authorId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedAuthor.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                "https://images.quotable.dev/profile/400/${loadedAuthor.slug}.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(loadedAuthor.name),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Text('Description',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(
                  height: 5,
                ),
                Text(loadedAuthor.description),
                SizedBox(
                  height: 10,
                ),
                Text('Bio',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(
                  height: 5,
                ),
                Text(loadedAuthor.bio),
                SizedBox(
                  height: 10,
                ),
                Text('Quote Count',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(
                  height: 5,
                ),
                Text(loadedAuthor.quoteCount.toString()),
                SizedBox(
                  height: 10,
                ),
                Text('Date Added',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(
                  height: 5,
                ),
                Text(loadedAuthor.dateAdded),
                SizedBox(
                  height: 10,
                ),
                Text('Date Modified',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(
                  height: 5,
                ),
                Text(loadedAuthor.dateModified),
                SizedBox(
                  height: 10,
                ),
                Text('Link',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                    onTap: () => launchUrl(Uri.parse(loadedAuthor.imageUrl)),
                    child: Text(loadedAuthor.imageUrl)),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
