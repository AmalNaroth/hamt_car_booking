import 'package:flutter/material.dart';

void customSnackBar(String content, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}