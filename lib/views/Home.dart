import 'package:flutter/material.dart';
import 'package:news_app/controller/newsController.dart';
import 'package:get/get.dart';
import 'package:news_app/views/articlepage.dart';
import 'package:news_app/views/newsWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (newsController.isLoading.value)
                return Container(
                    color: Colors.black87,
                    child: Center(
                        child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                      backgroundColor: Colors.blue,
                    )));
              else
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: newsController.newsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ArticlePage(
                              postUrl: newsController.newsList[index].url,
                            ),
                          ),
                        );
                      },
                      child: NewsWidget(
                        news: newsController.newsList[index],
                      ),
                    );
                  },
                );
            }),
          )
        ],
      ),
    );
  }
}
