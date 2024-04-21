import 'package:flutter/material.dart';
import 'package:todo_list/Data/db_connection.dart';
import 'package:todo_list/Presentation/View/Screen/add_todo_screen.dart';
import 'package:todo_list/Presentation/View/Widget/todo_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = DbConnection();

  List<Map<String, dynamic>> data = [];

  final searchController = TextEditingController();

  List favList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5F33E1),
      appBar: AppBar(
        backgroundColor: const Color(0xff5F33E1),
        centerTitle: true,
        title: const Text(
          'Todo List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          favIcon,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search here',
                  ),
                  controller: searchController,
                  onChanged: (_) {
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: DbConnection().readData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  data = snapshot.data!;
                  List filteredData = data
                      .where((todo) => todo['title']
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase()))
                      .toList();
                  if (searchController.text.isNotEmpty &&
                      filteredData.isEmpty) {
                    return const Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 40,
                        ),
                        Text(
                          'Not found',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ));
                  } else if (searchController.text.isEmpty &&
                      filteredData.isEmpty) {
                    return const Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.not_interested_rounded,
                          size: 40,
                          color: Colors.red,
                        ),
                        Text(
                          'Empty!',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        String title = filteredData[index]['title'];
                        int id = filteredData[index]
                            ['id']; // Get the id of the image
                        return TodoContainer(
                          giveTitle: title,
                          giveIndex: index + 1,
                          onLongPressTodo: () {},
                          onDeleteTodo: () async {
                            await db.deleteData(id);
                            setState(() {});
                          },
                          addToFav: () {
                            favList.add(filteredData[index]);
                          },
                          giveId: id,
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget favIcon = InkWell(
  onTap: () {},
  child: const Padding(
    padding: EdgeInsets.only(right: 12),
    child: Icon(
      Icons.favorite,
      size: 30,
      color: Colors.white,
    ),
  ),
);
