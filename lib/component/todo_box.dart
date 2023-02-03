import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/database/helper.dart';
import 'package:todo/service/todo_service.dart';

class TodoBox extends GetView<TodoService> {
  final TodoData todo;
  const TodoBox({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: Get.height * 0.1,
        width: double.infinity,
        child: Row(
          children: [
            Flexible(
                flex: 8,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    todo.title,
                    style: TextStyle(fontSize: Get.width * 0.05),
                  ),
                )),
            Flexible(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    controller.deleteTodo(todo.id);
                  },
                  child: const Icon(Icons.delete),
                ))
          ],
        ),
      ),
    );
  }
}
