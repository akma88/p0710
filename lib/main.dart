import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Inherited Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inherited Widget'), centerTitle: true),
      body: ListView(
        children: [
          MyInheritedWidget(myState: this, child: const AppRootWidget()),
        ],
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  const AppRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheritedWidget.of(context)!.myState;

    return Card(
      elevation: 4,
      child: Column(
        children: [
          Text(
            '(Root Widget)',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            '${rootWidgetState.counterValue}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 50),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Counter(), Counter()],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheritedWidget.of(context)!.myState;

    return Card(
      margin: const EdgeInsets.all(4).copyWith(bottom: 32),
      color: Colors.yellowAccent,
      child: Column(
        children: [
          const Text('(Child Widget)'),
          Text(
            '${rootWidgetState.counterValue}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ButtonBar(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                color: Colors.red,
                onPressed: rootWidgetState._decrementCounter,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                color: Colors.green,
                onPressed: rootWidgetState._incrementCounter,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final MyHomePageState myState;

  const MyInheritedWidget({
    super.key,
    required Widget child,
    required this.myState,
  }) : super(child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    // The state object is shared, so always notify dependents.
    return true;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}
