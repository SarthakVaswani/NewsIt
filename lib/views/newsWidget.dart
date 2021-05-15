import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';

class NewsWidget extends StatelessWidget {
  final Article news;
  NewsWidget({this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 800,
      child: Text(
        news.title,
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
