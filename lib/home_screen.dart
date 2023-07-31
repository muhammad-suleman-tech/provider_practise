import 'package:flutter/material.dart';
import 'package:flutter_provider/home_screen2.dart';
import 'package:flutter_provider/home_screen3.dart';
import 'package:flutter_provider/list_provider.dart';
import 'package:flutter_provider/news_screen.dart';
import 'package:flutter_provider/provider/login_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    print("build1");
    return Consumer<NumberListProvider>(
      builder: ((context,provider,child ) => Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text("Provider"),
        actions: [
          IconButton(onPressed: (){
              provider.changeMode();
          }, icon: Icon(provider.iconBool ? Icons.dark_mode : Icons.light_mode )
          ),
        ],
      ),
        drawer: Drawer(
          child: Column(
            children:   [
              const UserAccountsDrawerHeader(
                  decoration:  BoxDecoration(
                      color: Colors.amberAccent
                  ),
                  currentAccountPicture:  CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
                  ),
                  accountName:  Text("Muhammad Suleman"),
                  accountEmail:  Text("mssheikh333@gmail.com")
              ),
              ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                leading: const Icon(Icons.home,color: Colors.purple,),
                title: const Text("Home"),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PostsScreen()),
                  );
                },
                leading: const Icon(Icons.add_business_outlined,color: Colors.blueAccent,),
                title: const Text("Posts"),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewsScreen()),
                  );
                },
                leading: const Icon(Icons.my_library_books_outlined,color: Colors.orangeAccent,),
                title: const Text("News"),
              ),
              const ListTile(
                leading: Icon(Icons.favorite,color: Colors.red,),
                title: Text("Favorites"),
              ),
              const ListTile(
                leading: Icon(Icons.notifications_active,color: Colors.amber,),
                title:  Text("Notifications"),
              ),
              const ListTile(
                leading:  Icon(Icons.settings,color: Colors.grey,),
                title:  Text("Setting"),
              ),
              const Divider(
                height: 2,
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
               ListTile(
                onTap: (){
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.logout,color: Colors.red,),
                title: const Text("Logout"),
              ),
            ],
          ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
            Text(provider.numbers.last.toString(),style: const TextStyle(fontSize: 25),),
              SizedBox(
                height: 50,
                child: Center(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                    itemCount: provider.numbers.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(provider.numbers[index].toString(),
                            style: const TextStyle(fontSize: 25),),
                        );
                      }
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const HomeScreenTwo()),
                      );
                    }, child: const Text("Screen 2"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const PostsScreen()),
                      );
                    }, child: const Text("Posts Data"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const NewsScreen()),
                      );
                    }, child: const Text("News"),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Slider(
                  min: 0.0,
                  max: 1.0,
                  value: provider.opacityValue,
                  onChanged: (val) {
                  provider.setValue(val);
              }),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(provider.opacityValue),
                      ),
                      child: const Center(child: Text("Container 1")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(provider.opacityValue),
                      ),
                      child: const Center(child: Text("Container 2")),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.shopping.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        if(provider.favourites.contains(index) ){
                          provider.removeToFavourite(index);
                        }else {
                          provider.addToFavourite(index);
                          // print(index);
                        }
                      },
                      title: Text(provider.shopping[index].toString()),
                      leading: Text(index.toString()),
                      trailing:  Icon(provider.favourites.contains(index) ? Icons.favorite : Icons.favorite_border_outlined),
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
        child: const Icon(Icons.add),
        ),
      )
      ),

    );
  }
}
