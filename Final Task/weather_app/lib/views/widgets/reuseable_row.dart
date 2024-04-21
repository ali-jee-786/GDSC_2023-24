import 'package:flutter/material.dart';

class ReuseableRow extends StatelessWidget {
  const ReuseableRow({
    super.key,
    required this.title1,
    required this.title2,
    required this.value1,
    required this.value2,
    required this.icon1,
    required this.icon2,
  });
  final IconData icon1;
  final IconData icon2;
  final String title1;
  final String title2;
  final String value1;
  final String value2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Row(
            children: [
              Icon(
                icon1,
                color: Colors.white,
                size: 37,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      value1,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Row(
            children: [
              Icon(
                icon2,
                color: Colors.white,
                size: 37,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title2,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      value2,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
