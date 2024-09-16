
/*
import 'package:fizmat_app/models/book.dart';
import 'package:fizmat_app/screens/book/old/local_widgets/book_item.dart';
import 'package:flutter/material.dart';

class FizBooksView extends StatefulWidget {
  final List<FizBookInfo> books;
  final String currentGroup;
  const FizBooksView(
      {super.key, required this.books, required this.currentGroup});

  @override
  State<FizBooksView> createState() => _FizBooksViewState();
}

class _FizBooksViewState extends State<FizBooksView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Display 3 books per row
        crossAxisSpacing: 10.0, // Horizontal spacing
        mainAxisSpacing: 10.0, // Vertical spacing
      ),
      itemCount: widget.books.length, // Total number of books
      itemBuilder: (context, index) {
        // Build each book item
        // Check if the book matches the current age group selection
        if (widget.currentGroup == 'All' || widget.books[index].group == widget.currentGroup) {
          return FizBookItem(book: widget.books[index]); // Display matching book item
        } else {
          return Container(); // Non-matching book item is an empty container
        }
      },
    );
  }
}

*/
