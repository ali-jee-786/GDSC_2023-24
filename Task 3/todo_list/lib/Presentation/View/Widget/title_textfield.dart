import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  TextEditingController giveController = TextEditingController();
  TitleTextField({super.key, required this.giveController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: giveController,
          maxLines: 5,
          decoration: const InputDecoration(
              hintText: "What's the task for today",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
