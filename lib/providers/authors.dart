import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'author.dart';

class Authors with ChangeNotifier {
  List<Author> _authors = [];

  List<Author> get authors {
    return [..._authors];
  }

  Author findById(String id) {
    return _authors.firstWhere((author) => author.id == id);
  }

  Future<void> fetchAndSetAuthors() async {
    final url = "https://quotable.io/authors";
    try {
      final response = await http.get(Uri.parse(url));
      final List<Author> loadedAuthors = [];
      final data = json.decode(response.body);
      var authorsList = data["results"];
      (authorsList as List).forEach((authorData) {
        loadedAuthors.add(Author(
            id: authorData["_id"],
            imageUrl: authorData["link"],
            name: authorData["name"],
            bio: authorData["bio"],
            dateAdded: authorData["dateAdded"],
            dateModified: authorData["dateModified"],
            description: authorData["description"],
            quoteCount: authorData["quoteCount"],
            slug: authorData["slug"]));
      });
      _authors = loadedAuthors;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
