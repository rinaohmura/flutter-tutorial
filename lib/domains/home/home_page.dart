import 'package:flutter/material.dart';
import 'package:hello_world/domains/todo/todo_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: const Color.fromRGBO(22, 175, 175, 1),
      elevation: 0,
      fixedSize: Size(
        _size.width * 0.9,
        44,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );
    final ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
      onPrimary: const Color.fromRGBO(22, 175, 175, 1),
      primary: Colors.white,
      elevation: 0,
      fixedSize: Size(
        _size.width * 0.9,
        44,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      side:
          const BorderSide(width: 1.0, color: Color.fromRGBO(22, 175, 175, 1)),
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/images/logo.png'),
              width: 300,
            ),
            const Image(
              image: AssetImage('assets/images/charactor.png'),
              width: 200,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('新規登録(無料)'),
              style: raisedButtonStyle,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('ログイン'),
              style: raisedButtonStyle2,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TodoPage(),
                ),
              ),
              child: const Text('スキップ'),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
