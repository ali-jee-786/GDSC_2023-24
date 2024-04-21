import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => 0,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, minimumSize: Size(330, 50)),
        child: Text(title),
      ),
    );
  }
}
