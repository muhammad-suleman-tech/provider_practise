
import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {

  const NewsDetailScreen({super.key, this.obj });

  final dynamic obj;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {

  final String greet = "Published at : ";
  final String author = "Author - ";

  @override
  Widget build(BuildContext context) {
    // print(widget.obj.toString());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Detail")
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 10),
            child: Column(
                children: [
                  widget.obj.toString().isEmpty ? const CircularProgressIndicator() :
                  Container(
                      margin: const EdgeInsets.all(12.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3.0,
                            ),
                          ]),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Container(
                              height: 300.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: widget.obj["urlToImage"] == null ?
                                      const  NetworkImage("https://cdn.pixabay.com/photo/2015/02/15/09/33/news-636978_1280.jpg")
                                        : NetworkImage(widget.obj["urlToImage"]) ,
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            const  SizedBox( height: 8.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Text(widget.obj["source"]["name"],
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                Text(greet+widget.obj["publishedAt"].toString().substring(0,10) ) ,
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text( author+widget.obj["author"].toString() == "null" ? "Anonymus"  :  author+widget.obj["author"].toString(),
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                                TextButton(onPressed: (){
                                  Text(widget.obj["url"]);
                                }, child: const Text('Visit Website') )
                              ],
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(widget.obj["title"],
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(widget.obj["description"],
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            Text(widget.obj["content"],
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ]
                      )
                  ),
    ]
    ,
    ),
          ),
        )
    ,
    );
  }
}
