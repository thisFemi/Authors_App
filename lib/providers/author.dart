import 'package:flutter/material.dart';

class Author with ChangeNotifier {
  final String? id;
  final String name;
  final String imageUrl;
  final String bio;
  final String description;
  final int quoteCount;
  final String slug;
  final String dateAdded;
  final String dateModified;
  Author(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.bio,
      required this.dateAdded,
      required this.dateModified,
      required this.description,
      required this.quoteCount,
      required this.slug});
}
