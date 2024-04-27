import 'package:flutter/material.dart';

class IIinput extends StatelessWidget {
  String? name;
  Widget? prefixIcon;
  Widget? suffixIcon;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  bool innermargin = false;


  IIinput({required this.name, this.prefixIcon, this.suffixIcon, this.onChanged,
      this.validator, this.onSaved, required this.innermargin});

  void innerMargin (bool inner) {
    if (inner == true) {
      innermargin = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          label: Text("$name"),
          hintText: '$name',
          contentPadding: innermargin ? EdgeInsets.all(40.0) : EdgeInsets.all(18.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)),
          // prefix: Icon(Icons.person),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: Colors.white38,
          filled: true),
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
