import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Modal/ApiModal.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {



  // create the empty list for saving the api received data init
  List<PostModal> postList = [];

  // creating the fetch api function

  Future<List<PostModal>> getPostApi () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200 ){
      postList.clear();
      for(Map i in data){
        postList.add(PostModal.fromJson(i));
      }
    return postList;
    } else {
      return postList;
    }

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("News Api App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                     return const Center(child: CircularProgressIndicator());
                  } else {
                        return ListView.builder(
                          itemCount: postList.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ListTile(
                                  title: Text(postList[index].title.toString()),
                                  subtitle: Text(postList[index].body.toString()),
                                  leading: Text(postList[index].id.toString()),
                                ),
                              );
                            }
                        );
                  }
                },
            ),
          )
        ],
      ),
    );
  }
}
