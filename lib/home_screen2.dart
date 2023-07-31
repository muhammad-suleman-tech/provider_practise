import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_provider.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {


  @override
  Widget build(BuildContext context) {
    print("build2");
    return Consumer<NumberListProvider>(
      builder: ((context,provider,child ) => Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
    body:  SizedBox(
    child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(provider.numbers.last.toString(),style: const TextStyle(fontSize: 25),),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: provider.numbers.length,
                      itemBuilder: (context,index){
                        return Text(provider.numbers[index].toString(),
                          style: const TextStyle(fontSize: 25),);
                      }
                  ),
                ),

                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.favourites.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        onTap: (){
                            provider.removeToFavouriteAtIndex(index);
                        },
                        title: Text(provider.shopping[provider.favourites[index]].toString()),
                        leading: Text(index.toString()),
                        trailing:  const Icon(Icons.favorite ),
                      );
                    }
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            provider.add();
          },
          child: const Icon(Icons.add),),
      )
      ),
    );
  }
}
