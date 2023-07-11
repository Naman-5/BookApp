import 'package:bookapp/AllBooks/Models/book_search_data.dart';
import 'package:get/get.dart';
import '../../Services/api.dart';

class AllBooksController extends GetxController {
  final ApiController api = Get.find();
  Rx<bool> dataLoaded = false.obs;
  Rx<BookSearchData> data = BookSearchData().obs;

  Future<void> getAllBooks({Map? body}) async {
    dataLoaded.value = false;
    await api.fetch(
        method: HttpMethod.post,
        endpoint: '/book/bookSearch',
        body: body ?? {},
        onSuccess: (res) {
          data.value = BookSearchData.fromJson(res.data);
          dataLoaded.value = true;
        },
        onFailure: (res) {
          // api error
        });
  }
}
