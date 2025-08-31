import 'package:flutter/material.dart';


class Ui_Helper{

  static customTextFiled(String text, IconData icon, bool obscureText){
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

  static customButton(String text, Color color, Color textColor, IconData icon, VoidCallback? onPressed ){
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor,),
          SizedBox(
            width: 10,
          ),
          Text(text, style: TextStyle(color: textColor),),
        ],
      ),
     ),
    );
  }


}