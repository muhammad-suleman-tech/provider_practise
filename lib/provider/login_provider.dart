

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/home_screen.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {

  bool isLoading = false;
  setLoading(bool val) {
    isLoading = val;
  }

void login(String email , String password,BuildContext context) async {

  try{
    Response response = await post(Uri.parse('https://reqres.in/api/login'),
        body: {
            'email' : email,
            'password' : password,
        }
    );

    if(response.statusCode == 200)  {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Welcome Login Successfully'),
    duration: Duration(seconds: 1),
  ));
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
  );
  // print("Success");
} else {
  setLoading(false);
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.amber,
        content: Text('kindly check your email and password again.',style: TextStyle(color: Colors.black),),
        duration: Duration(seconds: 2),
      ));
}
  } catch(e) {
    setLoading(false);
    print(e.toString());

  }
}    // login api





}