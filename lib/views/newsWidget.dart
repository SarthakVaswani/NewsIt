import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/model/model.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';

class NewsWidget extends StatelessWidget {
  final _screenshotController = ScreenshotController();
  final Article news;
  NewsWidget({this.news});
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _screenshotController,
      child: Column(
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            if (news.urlToImage == null)
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                  "https://media.istockphoto.com/vectors/breaking-news-isolated-vector-icon-sign-of-main-news-on-dark-world-vector-id1212012012?k=6&m=1212012012&s=612x612&w=0&h=2-p5uV3yHcD41lTunUTwFbyHMbFmrqA_WMlBGXUrVLQ=",
                  fit: BoxFit.cover,
                ),
              ),
            if (news.urlToImage != null)
              Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                  news.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 7),
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 7),
                        child: Column(
                          children: [
                            if (news.title != null)
                              Text(
                                news.title,
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            SizedBox(
                              height: 13,
                            ),
                            if (news.description != null)
                              Text(
                                news.description,
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black87.withOpacity(0.7)),
                              ),
                            SizedBox(
                              height: 14,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Click to read more",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87.withOpacity(0.65)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                      onPressed: _takeScreenshot),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  void _takeScreenshot() async {
    final uint8List = await _screenshotController.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/image.png');
    await file.writeAsBytes(uint8List);
    await Share.shareFiles([file.path]);
  }
}
