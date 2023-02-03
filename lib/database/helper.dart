import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:todo/database/todo.dart';

part 'helper.g.dart';

@DriftDatabase(tables: [Todo])
class Helper extends _$Helper {
  Helper() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> addTodo(String title) {
    return into(todo).insert(TodoCompanion(
        title: Value(title), status: Value(Status.ready.toString())));
  }

  Stream<List<TodoData>> stream() {
    return select(todo).watch();
  }

  Future resetDB() {
    return delete(todo).go();
  }

  Future<TodoData?> find(int id) {
    return (select(todo)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> deleteTodo(int id) {
    return (delete(todo)..where((tbl) => tbl.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    // sqlite 를 저장할 파일명
    final file = File(p.join(dbFolder.path, 'todo-v1.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
