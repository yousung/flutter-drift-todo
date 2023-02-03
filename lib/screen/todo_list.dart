import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/component/todo_box.dart';
import 'package:todo/database/helper.dart';
import 'package:todo/service/todo_service.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoService>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: controller.titleController,
                    validator: (value) {
                      if (value!.length < 5) {
                        return "5자 이상";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.saveTodo(value.toString());
                      controller.titleController.clear();
                    },
                  ),
                )),
            Flexible(
                flex: 1,
                child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    },
                    child: const Text("저장"))),
            Flexible(
                flex: 9,
                child: StreamBuilder(
                    stream: controller.helper.stream(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text("data 없음");
                      }

                      List<TodoData> lists = snapshot.data!;
                      lists = lists..sort((t1, t2) => t2.id.compareTo(t1.id));

                      return SingleChildScrollView(
                        child: Column(
                          children: lists.map((e) => TodoBox(todo: e)).toList(),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
