import 'package:flutter/material.dart';
import 'package:news_app/controller/newsController.dart';
import 'package:get/get.dart';
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
            child: Obx(
              () => PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: newsController.newsList.length,
                itemBuilder: (context, index) {
                  return NewsWidget(
                    news: newsController.newsList[index],
                  );
                },
              ),
              // StaggeredGridView.countBuilder(
              //         itemCount: newsController.newsList.length,
              //         crossAxisCount: 1,
              //         crossAxisSpacing: 4,
              //         mainAxisSpacing: 10,
              //         itemBuilder: (context, index) {
              //           return NewsWidget(
              //             news: newsController.newsList[index],
              //           );
              //         },
              //         staggeredTileBuilder: (index) => StaggeredTile.fit(1))
              //  ListView.builder(
              //   itemCount: newsController.newsList.length,
              //   itemBuilder: (context, index) {
              //     return NewsWidget(
              //       news: newsController.newsList[index],
              //     );
              //   },
              // ),
            ),
          )
        ],
      ),
    );
  }
}
