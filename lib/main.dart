import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
 late Animation<double> animation;
 late AnimationController controller;
  @override
 void initState(){
  super.initState();
  controller = AnimationController(duration: const Duration(seconds: 5), vsync: this);
  animation = Tween<double>(begin: 50, end: 200).animate(controller)
  ..addListener(() { 
    setState(() {
      //No actions
    });
  });
  controller.forward();
 }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),  
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Container(
           height:animation.value,
           width:animation.value,
           color: Color.fromARGB(255, 69, 174, 216),
           child: Icon(Icons.add),
        ),
      )
    );
  }

  void dispose(){
  controller.dispose();
  super.dispose();
}
}
