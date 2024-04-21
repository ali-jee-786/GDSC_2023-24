import 'package:uuid/uuid.dart';

final uuid = Uuid();

class TodoModel {
  final String title;
  final String id;

  TodoModel({
    String? id,
    required this.title,
  }) : id = uuid.v4();
}
