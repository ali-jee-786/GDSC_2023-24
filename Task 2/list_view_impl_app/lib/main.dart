import 'package:flutter/material.dart';
import 'package:list_view_impl_app/listview_impl_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewImpl(),
    );
  }
}
