import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/Data/db_connection.dart';
import 'package:todo_list/Presentation/View/Widget/save_button.dart';
import 'package:todo_list/Presentation/View/Widget/title_textfield.dart';

class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({super.key});

  final titleController = TextEditingController();
  final db = DbConnection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff5F33E1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: backArrow,
          title: const Text(
            'Add Todo',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xff5F33E1),
        ),
        body: Column(
          children: [
            TitleTextField(
              giveController: titleController,
            ),
            const SizedBox(
              height: 20,
            ),
            SaveButton(
              onPressSave: () async {
                if (titleController.text.isNotEmpty &&
                    titleController.text.trim() != '') {
                  await db.insertData(titleController.text);
                  titleController.clear();
                  Get.back();
                }
                return;
              },
            )
          ],
        ));
  }
}

Widget backArrow = InkWell(
  onTap: () => Get.back(),
  child: const Icon(
    Icons.arrow_back,
    color: Colors.white,
  ),
);
