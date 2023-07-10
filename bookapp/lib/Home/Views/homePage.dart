import 'package:bookapp/Home/Controllers/homeController.dart';
import 'package:bookapp/Home/Views/bookDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookapp/common/styles.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  HomePageController controller = Get.put(HomePageController());

  @override
  void initState() {
    super.initState();
    controller.homePageApi();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.dataLoaded.value
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    children: List.generate(
                        controller.data.value.data?.books?.length ?? 0,
                        (index) => HorizontalBookListing(rowIndex: index))),
              ),
            ),
          ));
  }
}

class HorizontalBookListing extends StatelessWidget {
  int rowIndex;
  HomePageController controller = Get.find();
  HorizontalBookListing({super.key, required this.rowIndex});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.data.value.data?.books?.elementAt(rowIndex).header ?? '',
            style: h1(Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    controller.data.value.data?.books
                            ?.elementAt(rowIndex)
                            .bookList
                            ?.length ??
                        0,
                    (index) => GestureDetector(
                          onTap: () {
                            // rdirect to book details
                            Get.to(BookDetailsPage(
                                id: controller.data.value.data?.books
                                        ?.elementAt(rowIndex)
                                        .bookList
                                        ?.elementAt(index)
                                        .sId ??
                                    ''));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.network(
                                    controller.data.value.data?.books
                                            ?.elementAt(rowIndex)
                                            .bookList
                                            ?.elementAt(index)
                                            .coverImage ??
                                        '',
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Flexible(
                                    child: Text(
                                      controller.data.value.data?.books
                                              ?.elementAt(rowIndex)
                                              .bookList
                                              ?.elementAt(index)
                                              .title ??
                                          '',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "\$${controller.data.value.data?.books?.elementAt(rowIndex).bookList?.elementAt(index).price.toString() ?? ''}",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
              ))
        ],
      ),
    );
  }
}
