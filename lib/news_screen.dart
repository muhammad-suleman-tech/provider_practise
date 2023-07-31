
import 'package:flutter/material.dart';
import 'package:flutter_provider/news_detail_screen.dart';
import 'package:flutter_provider/services/api_services.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  ApiService client = ApiService();
  final String greet = "Published at : ";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("News Api App"),
      ),
      body:  Column(
        children: [
          Expanded(
            child: FutureBuilder(
                 future: client.getArticle(),
                 builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot)  {
                   List<dynamic> articles = snapshot.data ?? [];
                   return  articles.isEmpty ? const Center(child: CircularProgressIndicator())  :  ListView.builder(
                     itemCount: articles.length,
                       itemBuilder: (context,index) =>
                       InkWell(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) =>  NewsDetailScreen( obj:articles[index] ) ),
                           );
                         },
                         child: Container(
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
                             height: 200.0,
                             width: double.infinity,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: articles[index]["urlToImage"] == null ?
                                    const NetworkImage("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg")
                                       : NetworkImage(articles[index]["urlToImage"]) ,
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
                                     child: Text(articles[index]["source"]["name"],
                                       style: const TextStyle(
                                         color: Colors.white,
                                       ),
                                     ),
                                   ),

                                   Text(greet+articles[index]["publishedAt"].toString().substring(0,10) ) ,
                                 ],
                               ),
                               const SizedBox(
                                 height: 8.0,
                               ),
                               Text(articles[index]["title"],
                                 textAlign: TextAlign.justify,
                                 style: const TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14.0,
                                 ),
                               ),
                               const SizedBox(
                                 height: 5.0,
                               ),
                               Text(articles[index]["description"],
                                 textAlign: TextAlign.justify,
                                 style: const TextStyle(
                                   fontSize: 14.0,
                                 ),
                               ),
                               Text(articles[3]["urlToImage"].toString()),
                           ]
                         )
                         ),
                       )
                   );
                }
            ),
          ),
        ],
      ),
    );
  }
}
