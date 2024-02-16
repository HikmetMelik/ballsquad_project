import 'package:ballsquad_project/feature/authors/model/authors.dart';
import 'package:flutter/material.dart';

final class AuthorDetailsPage extends StatelessWidget {
  const AuthorDetailsPage({super.key, required this.authorDetails, Docs? author});
  final Docs authorDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(authorDetails.name ?? "Author Details"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            authorDetails.name ?? "Author Name",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Birth Date: ${authorDetails.birthDate ?? "Unknown"}",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Death Date: ${authorDetails.deathDate ?? "Unknown"}",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Top Work: ${authorDetails.topWork ?? "Unknown"}",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Work Count: ${authorDetails.workCount ?? "Unknown"}",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
