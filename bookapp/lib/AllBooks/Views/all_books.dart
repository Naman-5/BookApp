import 'package:bookapp/AllBooks/Controllers/all_book_controller.dart';
import 'package:bookapp/Home/Views/bookDetails.dart';
import 'package:bookapp/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AllBooksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AllBooksPageState();
}

class AllBooksPageState extends State<AllBooksPage> {
  AllBooksController controller = Get.put(AllBooksController());
  @override
  void initState() {
    super.initState();
    controller.getAllBooks(body: {"searchTerm": ""});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.dataLoaded.value
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onSubmitted: (value) =>
                        controller.getAllBooks(body: {"searchTerm": value}),
                    decoration: InputDecoration(
                      hintText: "Search Books",
                      prefixIcon: const Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey)),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                      controller.data.value.data?.length ?? 0,
                      (index) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () => Get.to(() => BookDetailsPage(
                                  id: controller.data.value.data
                                          ?.elementAt(index)
                                          .sId ??
                                      '')),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                        controller.data.value.data
                                                ?.elementAt(index)
                                                .coverImage ??
                                            '',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                      ),
                                    ),
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          text:
                                              "${controller.data.value.data?.elementAt(index).title ?? ''}\n",
                                          style: h2(textColor: Colors.white),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    "${controller.data.value.data?.elementAt(index).author ?? ''}\n\n",
                                                style: h3(
                                                    textColor: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              ]),
            ),
          ));
  }
}
