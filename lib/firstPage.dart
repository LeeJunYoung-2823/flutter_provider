import 'package:flutter/material.dart';
import 'package:flutter_provider/counter.dart';
import 'package:flutter_provider/testclass.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    final testClass = Provider.of<TestClass>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('firstPage'),
        ),
        body: Center(
            child: Container(
                child: Text(
          '${counter.count}\n'
          '${counter.test}\n'
          '${testClass.num}',
        ))));
  }
}
