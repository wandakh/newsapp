import 'package:flutter/material.dart';
import 'package:newsapp/model/articles.dart';
import 'package:newsapp/screen/detail_screen.dart';
import 'package:newsapp/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeaago;

class NewsItem extends StatelessWidget {
  final Article article;
  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(article)));
      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: EdgeInsets.only(
            bottom: edgeDetail
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  article.urlToImage.toString(),
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
                child: Container(
                  width: 220,
                  child: Column(
                    children: [
                      Text(
                        article.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: titleArticle.copyWith(
                            fontSize: 14
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          // ini untuk date
                          Row(
                            children: [
                              Icon(Icons.calendar_today_outlined, size: 12,),
                              SizedBox(width: 3,),
                              Container(
                                width: 80,
                                child: Text( timeUntil(DateTime.parse(article.publishedAt.toString())),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: authorDateArticle.copyWith(
                                      fontSize: 12
                                  ),
                                ),
                              )
                            ],
                          ),
                          //in untuk author
                          Row(
                            children: [
                              Icon(Icons.person, size: 12,),
                              SizedBox(width: 3,),
                              Container(
                                width: 80,
                                child: Text(article.author.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: authorDateArticle.copyWith(
                                      fontSize: 12
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      );
    }

//  buat func untuk konversi tanggalnya
  String timeUntil(DateTime parse){
    return timeaago.format(parse, allowFromNow: true, locale: 'en');
  }
}