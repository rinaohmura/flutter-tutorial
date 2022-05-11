import 'package:flutter/material.dart';
import 'package:hello_world/domains/doto/doto_page.dart';
import 'package:hello_world/domains/todo/todo_page.dart';

class BottomNavigationAndAppBar extends StatefulWidget {
  const BottomNavigationAndAppBar({Key? key}) : super(key: key);

  @override
  State<BottomNavigationAndAppBar> createState() =>
      _BottomNavigationAndAppBarState();
}

class _BottomNavigationAndAppBarState extends State<BottomNavigationAndAppBar> {
  int selectedIndex = 0;
  final _pages = [
    const TodoPage(),
    const DotoPage(),
    const DotoPage(),
  ];

  void _onTapItem(int index) {
    setState(() {
      selectedIndex = index; //インデックスの更新
    });
  }

  @override
  Widget build(BuildContext context) {
    final todo = TodoPageState();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: _pages[selectedIndex],
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                todo.addModal(context);
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          _onTapItem(value),
          // print(selectedIndex),
        },
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Doto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'DotDoto',
          ),
        ],
      ),
    );
  }
}
