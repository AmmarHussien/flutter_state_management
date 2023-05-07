import 'package:flutter/material.dart';
import 'package:flutter_state_management/services/todo_service.dart';

import '../model/todo.dart';

class TodoProvider extends ChangeNotifier {
  final _todoService = TodoService();
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;
  bool isLoading = false;

  Future getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _todoService.getAll();
    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
