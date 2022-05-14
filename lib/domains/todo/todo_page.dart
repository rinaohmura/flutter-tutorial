import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_world/providers.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TodoPage> createState() => TodoPageState();
}

class TodoPageState extends ConsumerState<TodoPage> {
  final todoListNotifier = TodoListNotifier(); //インスタンスか！
  final newTodoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    newTodoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final watcher = ref.watch(todoListNotifierProvider);
    return Center(
      child: ListView.builder(
        itemCount: watcher.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoItem(
            title: watcher[index],
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
                        todoListNotifier.add(newTodoController.text);
                        print(todoListNotifierProvider.notifier);
                        // _todoList.add(newTodoController.text);
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
