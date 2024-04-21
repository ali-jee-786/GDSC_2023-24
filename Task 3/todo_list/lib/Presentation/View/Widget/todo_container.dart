import 'package:flutter/material.dart';

class TodoContainer extends StatelessWidget {
  // final TodoModel todoModel;
  final int giveId;
  final String giveTitle;
  final int giveIndex;
  final Function() onLongPressTodo;
  final Function() onDeleteTodo;
  final Function() addToFav;

  const TodoContainer({
    super.key,
    required this.giveId,
    required this.giveTitle,
    required this.giveIndex,
    required this.onLongPressTodo,
    required this.onDeleteTodo,
    required this.addToFav,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPressTodo,
      child: Dismissible(
        key: Key(giveId.toString()),
        onDismissed: (_) {
          onDeleteTodo();
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(giveIndex.toString()),
              ),
              title: Text(giveTitle),
              trailing: IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: addToFav,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
