
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screen/newspage.dart';
import 'package:newsapp/service/data_service.dart';
import 'package:newsapp/widget/carousel_widget.dart';

import '../model/articles.dart';
import '../utils/utils.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                    image: NetworkImage(
                      'https://media-exp1.licdn.com/dms/image/C5603AQE01nSH7JQImA/profile-displayphoto-shrink_800_800/0/1617547764581?e=1652313600&v=beta&t=02ylcCNN_V2WyjWX9HRJRE9zuxyIVLhi26Er3ZKkwCg',
                    ))),
            width: 10,
            margin: const EdgeInsets.all(5),
          ),
          title: const Text(
            'Good Morning',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.blue,
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: news.getNews(),
            builder: (context, snapshot) => snapshot.data != null
                ? NewsPage(snapshot.data as List<Article>)
                : const Center(child:   CircularProgressIndicator())));
  }
}