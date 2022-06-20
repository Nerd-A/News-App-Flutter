import 'package:flutter/material.dart';
import 'package:news/models/article.dart';

import '../fetch/news.dart';
import 'articles.dart';

class Category extends StatefulWidget {
  final String categary;

  Category({required this.categary});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Article> article = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getCatogaryNews();
    loading = true;
  }

  getCatogaryNews() async {
    CatogoryNews newsclass = CatogoryNews();
    await newsclass.getNews(widget.categary);
    article = newsclass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Today's",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                " NEWS",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
            )
          ],
        ),
        body: loading
            ? Center(child: Container(child: CircularProgressIndicator()))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: article.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return BlogTile(
                              imgurl: article[index].urlToImage,
                              title: article[index].title,
                              des: article[index].description,
                              url: article[index].url);
                        },
                      ),
                    )
                  ],
                ),
              ));
  }
}

class BlogTile extends StatelessWidget {
  final String imgurl, title, des, url;
  BlogTile(
      {required this.imgurl,
      required this.title,
      required this.des,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => articles(
                      Blogurl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20, left: 12, right: 12),
        child: Column(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imgurl)),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 8,
          ),
          Text(des,
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 21, 109, 153)))
        ]),
      ),
    );
  }
}
