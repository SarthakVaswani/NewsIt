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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => PageView.builder(
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
