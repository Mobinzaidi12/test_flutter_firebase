import 'package:firebase_test_api/pages/ui_helper/ui_Helper.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Login', style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 60,),
                Ui_Helper.customTextFiled('Email', Icons.email, false),
                SizedBox(height: 30,),
                Ui_Helper.customTextFiled('Password', Icons.lock, true),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){}, child: Text('Forgot Password?')),
                ),
                SizedBox(height: 20,),
                Ui_Helper.customButton('Login', Colors.blue, Colors.white, (){

                }),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child:  Text(
                        "Sign up",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
