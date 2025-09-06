import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> _signOut() async {
   try{
     await FirebaseAuth.instance.signOut();

     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Logged out successfully')),
     );

     Navigator.pushReplacementNamed(context, '/login');
   }catch(e){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error logging out: $e")),);
   }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('welcome HomeScreen'),
          ElevatedButton(onPressed: _signOut, child: Text('Logout'))
        ],
      )),
    );
  }
}
