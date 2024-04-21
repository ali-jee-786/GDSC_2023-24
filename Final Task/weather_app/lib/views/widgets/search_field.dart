import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({
    super.key,
    required this.Controller,
    required this.onSubmit,
  });

  TextEditingController Controller = TextEditingController();
  final void Function(String val) onSubmit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 150,
      child: TextFormField(
        onFieldSubmitted: onSubmit,
        style: const TextStyle(color: Colors.white),
        controller: Controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.white),
          focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25)),
          enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
