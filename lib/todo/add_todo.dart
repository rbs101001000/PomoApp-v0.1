import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedTasks = prefs.getStringList('tasks');
    if (savedTasks != null) {
      setState(() {
        _tasks.addAll(
          savedTasks
              .map((title) => Task(title: title, description: ''))
              .toList(),
        );
      });
    }
  }

  void _addTask(String title, String description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _tasks.add(Task(title: title, description: description));
      prefs.setStringList('tasks', _tasks.map((task) => task.title).toList());
    });
  }

  void _removeTask(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _tasks.removeAt(index);
      prefs.setStringList('tasks', _tasks.map((task) => task.title).toList());
    });
  }

  void _showAddTaskDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add Todo"),
          ),
          body: AlertDialog(
            backgroundColor: Colors.black26,
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
                child: const Text('Cancel',style: TextStyle(color: Colors.white),),
              ),
              ElevatedButton(
                onPressed: () {
                  _addTask(titleController.text, descriptionController.text);
                  Navigator.of(context).pop();
                },
                child: const Text('Add',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: Column(
        children: [
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
          ElevatedButton(
            onPressed: _showAddTaskDialog,
            child: const Text('Add Task',style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
