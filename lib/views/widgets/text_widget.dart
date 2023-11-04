import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String text;
  Color color;
  double size;
  FontWeight? bold;
   TextWidget({super.key,required this.text,required this.color,required this.size,this.bold});

  @override
  Widget build(BuildContext context) {
    return  Text(text,style: TextStyle(color: color,fontSize: size,fontWeight: bold),);
  }
}