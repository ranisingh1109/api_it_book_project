import 'package:api_it_book_project/search_item_model.dart';
import 'package:flutter/material.dart';

import 'Book_Details_Screen.dart';
import 'api_book_services.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Book Search',
            style: TextStyle(color: Colors.white),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for books...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    ApiBookServicse().fatchData();
                  },
                ),
              ),
              // onSubmitted: _searchBooks,
              //onSubmitted:ApiBookServicse,
            ),
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder(
        future: ApiBookServicse().fatchData(),
        builder: (context, snapshot) {
          var data = snapshot.data ?? List<Book>.empty();
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(13),
                child: Card(
                  child: ListTile(
                    title: Text("${data[index].title}"),
                    subtitle: Text("${data[index].subtitle}"),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("${data[index].image}"),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookDetailsScreen(),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
