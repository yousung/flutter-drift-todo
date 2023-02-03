import 'package:drift/drift.dart';

enum Status { ready, done }

class Todo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get status => text()();
}
