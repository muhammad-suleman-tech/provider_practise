import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/login_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const Text("Login Into the App",style: TextStyle(fontSize: 23),),
          const Text("eve.holt@reqres.in"),
          const SizedBox(height: 30,),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 15,),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  _loading = true;
                });
                authProvider.login(emailController.text.toString(),
                    passwordController.text.toString(), context );
              }, child : Text( _loading ? " " : "Login" ),
            ),
            const SizedBox(height: 10,),
      _loading ?   const SpinKitFadingCircle(
          color: Colors.black,
          size: 50,
        ) : const Text(""),
          ],
        ),
      ),
    );
  }
}
