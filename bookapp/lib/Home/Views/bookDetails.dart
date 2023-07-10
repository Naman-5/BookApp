import 'package:bookapp/Home/Controllers/homeController.dart';
import 'package:bookapp/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookDetailsPage extends StatefulWidget {
  String id;
  BookDetailsPage({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => BookDetailsPageState();
}

class BookDetailsPageState extends State<BookDetailsPage> {
  HomePageController controller = Get.find();
  @override
  void initState() {
    super.initState();
    controller.getBookDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.bookDetailsLoaded.value
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                controller.bookDetails.value.title ?? '',
                style: h1(Colors.white),
              ),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Image.network(
                              controller.bookDetails.value.coverImage ?? '')),
                    ),
                    Text('Title: ${controller.bookDetails.value.title ?? ''}'),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(controller.bookDetails.value.about ?? ''),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Author: ${controller.bookDetails.value.author ?? ''}'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Genre: ${controller.bookDetails.value.genre ?? ''}'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        'Rating: ${controller.bookDetails.value.rating ?? ''}'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        'Page Count: ${controller.bookDetails.value.pageCount ?? ''}'),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      GestureDetector(
                        child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.shopping_bag),
                                Text('\$ ${controller.bookDetails.value.price}')
                              ],
                            )),
                      ),
                    ]),
                  ],
                ),
              ),
            )),
          ));
  }
}
