// ignore_for_file: unnecessary_const

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/fetch/data.dart';
import 'package:news/models/article.dart';
import 'package:news/models/model.dart';
import 'package:news/views/articles.dart';
import 'package:news/fetch/news.dart';
import 'package:news/views/category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<data> a = getcatogories();
  List<Article> b = <Article>[];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    a = getcatogories();
    getTodayNews();
  }

  getTodayNews() async {
    News newsclass = News();
    await newsclass.getNews();
    b = newsclass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        //drawer: AppBar(
        //  backgroundColor: Colors.black26,
        // ),
        // ignore: prefer_const_literals_to_create_immutables
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
        ),
        body: loading
            ? Center(child: Container(child: CircularProgressIndicator()))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // decoration: BoxDecoration(color: Colors.black87),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      height: 75,
                      child: ListView.builder(
                          itemCount: a.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return catTile(
                              imgurl: a[index].imgageURL,
                              catname: a[index].categoryName,
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: b.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return BlogTile(
                              imgurl: b[index].urlToImage,
                              title: b[index].title,
                              des: b[index].description,
                              url: b[index].url);
                        },
                      ),
                    )
                  ],
                ),
              ));
  }
}

class catTile extends StatelessWidget {
  final String imgurl, catname;
  catTile({required this.imgurl, required this.catname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Category(categary: catname.toLowerCase())));
        },
        child: Container(
          margin: EdgeInsets.only(right: 15),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: imgurl,
                    width: 120,
                    height: 60,
                    fit: BoxFit.cover,
                  )),
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black26),
                child: Text(
                  catname,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
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
