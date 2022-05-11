import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  final List<String> _todoList = <String>[];
  final newTodoController = TextEditingController();
  int selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
    newTodoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoItem(
              title: _todoList[index],
              number: index + 1,
            );
          },
        ),
      
      
    );
  }

  Future<dynamic> addModal(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        elevation: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: 800,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: '入力してください',
                    ),
                    controller: newTodoController,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _todoList.add(newTodoController.text);
                        });
                      },
                      child: const Text('追加')),
                ],
              ),
            ),
          );
        });
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.title,
    required this.number,
  }) : super(key: key);

  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.edit),
        title: Text(title),
        subtitle: Text(number.toString()),
      ),
    );
  }
}
