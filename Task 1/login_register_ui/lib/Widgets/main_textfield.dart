import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField(
      {super.key,
      required this.width,
      required this.hintText,
      required this.icon});
  final double width;
  final Icon icon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: TextFormField(
          decoration: InputDecoration(
              icon: icon,
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
    );
  }
}
