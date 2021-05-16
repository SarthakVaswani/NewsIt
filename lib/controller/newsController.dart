import 'package:get/state_manager.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/services/services.dart';

class NewsController extends GetxService {
  var newsList = List<Article>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var news = await Services.fetchNews();
      if (news != null) {
        newsList.value = news;
      }
    } finally {
      isLoading(false);
    }
  }
}
