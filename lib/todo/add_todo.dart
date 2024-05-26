import 'package:flutter/material.dart';

class Task {
  String title;
  String description;
  bool isCompleted;

  Task(
      {required this.title,
      required this.description,
      this.isCompleted = false});
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Task> _tasks = [];

  void _addTask(String title, String description) {
    setState(() {
      _tasks.add(Task(title: title, description: description));
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _showAddTaskDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Add Todo"),
            ),
            body: AlertDialog(
              title: const Text('Add New Task'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addTask(titleController.text, descriptionController.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Add Todo"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: _showAddTaskDialog,
              child: const Text('Add Task'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_tasks[index].title),
                    subtitle: Text(_tasks[index].description),
                    trailing: Checkbox(
                      value: _tasks[index].isCompleted,
                      onChanged: (bool? value) {
                        setState(() {
                          _tasks[index].isCompleted = value!;
                          if (_tasks[index].isCompleted) {
                            _removeTask(index);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
