import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/database/helper.dart';

class TodoService extends GetxService {
  final titleController = TextEditingController();
  Helper helper = Helper();

  saveTodo(String title) {
    helper.addTodo(title);
  }

  deleteTodo(int id) {
    helper.deleteTodo(id);
  }
}
