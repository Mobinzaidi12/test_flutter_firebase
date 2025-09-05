import 'package:flutter/material.dart';
import 'package:firebase_test_api/pages/ui_helper/ui_Helper.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;



  Future<void> _signUp() async {

    if(_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try{
        var userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());


        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account created successfully')),
        );

        Navigator.pushReplacementNamed(context, '/home');

      }on FirebaseAuthException catch(e) {
        String message;
        switch (e.code) {
          case 'email-already-in-use':
            message =
            'This email is already in use. Try logging in or use a different email.';
            break;
          case 'invalid-email':
            message = 'Please enter a valid email address.';
            break;
          case 'weak-password':
            message = 'Password is too weak. Please choose a stronger password.';
            break;
          default:
            message = e.message ?? 'An unknown error occurred';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      } finally{
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Signup',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 60),
                  Ui_Helper.customFormFiled(
                    'UserName',
                    Icons.person,
                    false,
                    userNameController,
                        (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      if (value.length < 3) {
                        return 'Username must be at least 3 characters';
                      }
                      return null;
                    },

                  ),
                  SizedBox(height: 30),
                  Ui_Helper.customFormFiled(
                    'Email',
                    Icons.email,
                    false,
                    emailController,
                        (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },

                  ),
                  SizedBox(height: 30),
                  Ui_Helper.customFormFiled(
                    'Password',
                    Icons.lock,
                    true,
                    passwordController,
                        (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
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
                    'Signup',
                    Colors.blue,
                    Colors.white,
                    _signUp,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          "Login",
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
    );
  }
}
