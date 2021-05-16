import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/model/model.dart';

class NewsWidget extends StatelessWidget {
  final Article news;
  NewsWidget({this.news});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          if (news.urlToImage == null)
            Container(
              height: MediaQuery.of(context).size.height / 1.037,
              child: Image.network(
                "https://media.istockphoto.com/vectors/breaking-news-isolated-vector-icon-sign-of-main-news-on-dark-world-vector-id1212012012?k=6&m=1212012012&s=612x612&w=0&h=2-p5uV3yHcD41lTunUTwFbyHMbFmrqA_WMlBGXUrVLQ=",
                fit: BoxFit.cover,
              ),
            ),
          if (news.urlToImage != null)
            Container(
              height: MediaQuery.of(context).size.height / 1.037,
              child: Image.network(
                news.urlToImage,
                fit: BoxFit.cover,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 7),
            child: Card(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
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
                                  fontSize: 23,
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
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
