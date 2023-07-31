import 'package:flutter/material.dart';
import 'package:flutter_provider/home_screen.dart';
import 'package:flutter_provider/list_provider.dart';
import 'package:flutter_provider/login.dart';
import 'package:flutter_provider/provider/login_provider.dart';
import 'package:flutter_provider/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

 ThemeData lightTheme = ThemeData(
   brightness: Brightness.light,
   primarySwatch: Colors.amber
 );
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  primarySwatch: Colors.green
);

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> NumberListProvider()),
        ChangeNotifierProvider(create: (context)=> AuthProvider()),
      ],
      child: Builder(builder: (BuildContext context){
        final changer = Provider.of<NumberListProvider>(context);
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: changer.iconBool ? lightTheme : darkTheme,
          home: const SplashScreen(),
        );
      })
    );
  }
}
