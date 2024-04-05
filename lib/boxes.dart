import 'package:hive/hive.dart';
import 'package:flutter_1/todo.dart';

class Boxes{
  static Box<Todo> getBox() => Hive.box<Todo>("myBox");
}