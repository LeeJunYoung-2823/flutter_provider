import 'package:flutter/material.dart';
import 'package:flutter_provider/counter.dart';
import 'package:flutter_provider/firstPage.dart';
import 'package:flutter_provider/testclass.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => TestClass()),
      ],
      // Consumer는 사용할 위젯을 감싸서 사용 (여기선 굳이 consumer 사용 안해도 잘됨)
      // Provider.of<Counter>(context) 이런 형태로 가져오는게 더 편함
      child: Consumer<Counter>(builder: (context, counter, child) {
        // Counter를 소비
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// watch : 해당 위젯이 상태값의 변경을 감지한다.
    /// read : 상태값을 읽으나 변경을 감시하지 않는다.
    /// select : 특정 상태값만을 감시한다.
    //final counter = Provider.of<Counter>(context); // watch
    //final counter = Provider.of<Counter>(context, listen: false); // read

    final counterRead = context.read<Counter>();
    final counterWatch = context.watch<Counter>();
    final test =
        context.select<Counter, int>((provider) => provider.test).toString();
    final testClassRead = context.read<TestClass>();
    final testClassWatch = context.watch<TestClass>();

    return Scaffold(
      appBar: AppBar(title: Text('test'), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterWatch.count}\n'
              '$test\n'
              '${testClassWatch.num}',
              //style: Theme.of(context).textTheme.display1,
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
                child: Text('이동'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterRead.increment();
          counterRead.test += 2;
          testClassRead.num += 3;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
