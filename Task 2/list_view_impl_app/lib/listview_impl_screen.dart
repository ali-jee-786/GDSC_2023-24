import 'package:flutter/material.dart';

class ListViewImpl extends StatefulWidget {
  const ListViewImpl({super.key});

  @override
  State<ListViewImpl> createState() => _ListViewImplState();
}

class _ListViewImplState extends State<ListViewImpl> {
  final List<String> dataList = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
    'Jackfruit',
    'Kiwi',
  ];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple List Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                if (_controller.text.isEmpty ||
                    dataList[index]
                        .toLowerCase()
                        .contains(_controller.text.toLowerCase())) {
                  return ListTile(
                    title: Text(dataList[index]),
                  );
                } else {
                  return Container(); // Return an empty container if the item should not be shown
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
