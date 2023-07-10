import 'package:bookapp/Home/Models/homeDataModel.dart';
import 'package:bookapp/Services/api.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final ApiController api = Get.find();
  Rx<bool> dataLoaded = false.obs;
  Rx<HomeDataModel> data = HomeDataModel().obs;
  Rx<bool> bookDetailsLoaded = false.obs;
  Rx<BookList> bookDetails = BookList().obs;

  Future<void> homePageApi() async {
    dataLoaded.value = false;
    await api.fetch(
        method: HttpMethod.get,
        endpoint: '/home/',
        onSuccess: (res) {
          data.value = HomeDataModel.fromJson(res.data);
          dataLoaded.value = true;
        },
        onFailure: (res) {
          // api error
        });
  }

  Future<void> getBookDetails(String bookId) async {
    bookDetailsLoaded.value = false;
    await api.fetch(
        method: HttpMethod.get,
        endpoint: '/book/$bookId',
        onSuccess: (res) {
          bookDetails.value = BookList.fromJson(res.data);
          bookDetailsLoaded.value = true;
          print(bookDetails.value.title);
        });
  }
}
