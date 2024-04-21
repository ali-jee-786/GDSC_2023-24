import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function() onPressSave;
  const SaveButton({super.key, required this.onPressSave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: onPressSave,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: Size(double.infinity, 50)),
        child: const Text(
          'Save',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
