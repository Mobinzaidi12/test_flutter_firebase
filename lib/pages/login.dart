import 'package:firebase_test_api/pages/ui_helper/ui_Helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _login() async {
    if(_formKey.currentState!.validate()){
        setState(() {
          _isLoading = true;
        });

        try{
          var userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Logged in successfully')),
          );
          Navigator.pushReplacementNamed(context, '/home');
        }on FirebaseAuthException catch(e){
          String message;
          switch(e.code){
            case 'user-not-found':
              message = 'No user found for that email.';
              break;
            case 'wrong-password':
              message = 'Wrong password provided for that user.';
              break;
            default:
              message = e.message ?? 'An unknown error occurred';
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );

        }finally{
          setState(() {
            _isLoading = false;
          });
        }
    }
  }

@override void dispose(){
    super.dispose();
  emailController.dispose();
  passwordController.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 60),
                    Ui_Helper.customFormFiled(
                      'Email',
                      Icons.email,
                      false,
                      emailController,
                        (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter email';
                          }
                          if(!value.contains('@') || !value.contains('.')){
                            return 'Please enter a valid email';
                          }
                          return null;
                        }
                    ),
                    SizedBox(height: 30),
                    Ui_Helper.customFormFiled(
                      'Password',
                      Icons.lock,
                      true,
                      passwordController,
                        (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter password';
                          }
                          if(value.length < 6){
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        }
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Forgot Password?'),
                      ),
                    ),
                    SizedBox(height: 20),
                    _isLoading
                        ? const CircularProgressIndicator()
                        : Ui_Helper.customButton(
                      'Login',
                      Colors.blue,
                      Colors.white,
                      _login,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
