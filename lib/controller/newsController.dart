import 'package:get/state_manager.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/services/services.dart';

class NewsController extends GetxService {
  var newsList = List<Article>().obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    var news = await Services.fetchNews();
    if (news != null) {
      newsList.value = news;
    }
  }
}
