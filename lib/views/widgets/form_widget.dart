import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {

  TextEditingController controller;
  IconData icon;
  IconData? suffixIconTrue;
  IconData? suffixIconFalse;
  String hinttext;

   TextFormFieldWidget({super.key,required this.controller,required this.icon,this.suffixIconTrue,this.suffixIconFalse,required this.hinttext});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
   bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        hintText: widget.hinttext,
        suffixIcon: IconButton(onPressed: (){
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
        }, icon: Icon(
          _passwordVisible ?
          widget.suffixIconFalse : widget.suffixIconTrue,
          color: const Color.fromARGB(255, 121, 121, 121),)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 134, 134, 134),
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 20, 1, 118)
          )
        ),
      ),
    );
  }
}