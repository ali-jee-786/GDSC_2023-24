import 'package:flutter/material.dart';

class ErrorRefresh extends StatelessWidget {
  const ErrorRefresh({super.key, required this.ontap});

  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.error_outline,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: ontap,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Refresh',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
