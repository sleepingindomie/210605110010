import 'package:flutter/material.dart';

class DescPage extends StatelessWidget {
  final String bookTitle;
  final String bookDescription;
  final String bookImage;
  final String author;
  final String publishDate;
  final String numberOfPages;

  DescPage({
    required this.bookTitle,
    required this.bookDescription,
    required this.bookImage,
    required this.author,
    required this.publishDate,
    required this.numberOfPages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deskripsi Buku'),
        backgroundColor: Color.fromARGB(255, 21, 156, 156),
      ),
      body: ListView.builder(
        itemCount: 1, // Hanya satu item, karena ini adalah halaman detail buku tunggal
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Center(
                child: Image.asset(
                  bookImage,
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(height: 16),
              Text(
                bookTitle,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildIconText(Icons.person, author),
                  buildIconText(Icons.date_range, publishDate),
                  buildIconText(Icons.pages, numberOfPages ),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  bookDescription,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildIconText(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Icon(icon),
        SizedBox(height: 4),
        Text(text),
      ],
    );
  }
}
