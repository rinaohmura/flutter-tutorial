import 'package:flutter/material.dart';

class DotoPage extends StatefulWidget {
  const DotoPage({Key? key}) : super(key: key);

  @override
  State<DotoPage> createState() => _DotoPageState();
}

class _DotoPageState extends State<DotoPage> {
  final newTodoController = TextEditingController();
  int selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
    newTodoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('doto'),
    );
  }
}
