import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_book_app/book.dart';
import 'package:new_book_app/detail_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: const Text("Home Page"),
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                centerTitle: true,
                backgroundColor: Colors.blue
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                    "AYO SINAU \nLAN NGGAWE APLIKASI",
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.w600,
                      fontFamily: "Times New Roman",
                      ),
                    ),
                    Image.asset(
                      "images/banner.png",
                      width: 100,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                  "Buku",
                   style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.w600,
                      fontFamily: "Times New Roman",
                      ),
                  ),
                  ),
                  ListView.builder(
                    itemCount: listBook.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final book= listBook[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => DetailPage(book: book),
                              ),
                            );
                        },
                        child: Container(
                        width: double.infinity,
                        height: 90,
                        padding: EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 6.0,
                                offset: Offset(0,1),
                            )                      
                          ]
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              book.image,
                              width: 64,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(book.name),
                                  Text(book.categoryBook),
                                ],
                              )
                          ],
                          ),
                      ),
                      );
                    },
   
                  )
              ],
            ),
            ),
        ),
    );
  }
}