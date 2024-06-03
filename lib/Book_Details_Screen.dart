import 'package:flutter/material.dart';
import 'api_book_services.dart';
class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key,
  });

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  // late Future<BookItemModel> _bookFuture;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _bookFuture = ApiBookServicse().getData(widget.isbn) as Future<BookItemModel>;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: const Text("Book Details")),),
        body: FutureBuilder(
          future:ApiBookServicse().getData(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            return ListView.builder(itemCount: data?.length,
              itemBuilder: (context, index) {
                return  Column(
                  children: [
                    Text("${data?[index].error}"),
                    Text("${data?[index].title}"),
                    Text("${data?[index].subtitle}"),
                    Text("${data?[index].desc}"),
                    Text("${data?[index].publisher}"),
                    Text("${data?[index].authors}"),
                    // Text("${data?[index].isbn10}"),
                    // Text("${data?[index].pages}"),
                    // Text("${data?[index].price}"),
                    // Text("${data?[index].image}"),

                    // widget.book['pdfUrl'] != null
                    //     ? ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) =>
                    //             PDFViewerScreen(pdfUrl: widget.book['pdfUrl']),
                    //       ),
                    //     );
                    //   },
                    //        child: Text('${data?[index].pdf?.chapter5}'),
                    // )
                    //     : Text('No available'),
                  ],
                );
              },
            );
          },
        )

        );
  }
}
// class PDFViewerScreen extends StatelessWidget {
//   final String pdfUrl;
//
//   PDFViewerScreen({required this.pdfUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('PDF Viewer'),
//         ),
//         body: PDFView(
//             filePath: pdfUrl,
//             ),
//     );
//     }}