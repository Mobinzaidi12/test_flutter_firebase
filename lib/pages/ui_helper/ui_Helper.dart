import 'package:flutter/material.dart';


class Ui_Helper{

  static Widget customTextFiled(String text, IconData icon, bool obscureText){
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }

  static Widget customButton(String text, Color color, Color textColor, VoidCallback? onPressed ){
    return SizedBox(
     width: double.infinity,
     height: 50,
     child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      onPressed: onPressed,
      child: Center(
        child:  Text(text, style: TextStyle(color: textColor, fontSize: 22),),
      )
      ),
    );
  }


}