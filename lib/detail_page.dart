import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_book_app/book.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Center(
                child: Image.asset(
                  book.image,
                  width: 120,
                  ),
                ),
              ),
          ),

          //Judul Buku
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(book.name,
              style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold
                ),
              ),         
            ),
          ),
          //info buku
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              bookInfo(book.rate.toString(), "Rating"),
              bookInfo(book.page.toString(), "Page"),
              bookInfo(book.language, "Language")
            ],
          ),
          //Desc buku
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: bookDesc(book.description)
            ),
        ],
      ),
    );
  }
  Widget bookInfo(String value, String info) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold
              ),
        ),
        Text(
          info,
          style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.w400
              ),
        ),
      ],
    );
  }

  Widget bookDesc(String description){
    return Column(
      children: [
        Text(
          description,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
      ],
    );
  }
}