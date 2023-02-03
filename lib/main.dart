import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screen/todo_list.dart';
import 'package:todo/service/todo_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo',
      initialBinding: BindingsBuilder(() {
        Get.put(TodoService());
      }),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoList(),
    );
  }
}
