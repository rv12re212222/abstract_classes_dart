import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer' as devtools show log;
extension Log on Object{

  void log()=> devtools.log(toString());

}


abstract class CanRun{
  void run(){
    "Running...".log();
  }
}

abstract class CanWalk{

  void walk(){
    "1walking...".log();
  }

}

class Cat with CanRun,CanWalk{

}



void testIt(){
  final cat = Cat();

  cat..run()..walk();

}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class BreadCrumb {
  bool isActive;
  final String name;
  final String uuid;

  BreadCrumb({required this.isActive, required this.name})
      : uuid = const Uuid().v4();

  void activate() {
    isActive = true;
  }

  @override
  bool operator ==(covariant BreadCrumb other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  String get title => name + (isActive ? ">" : '');
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Flutter App",
        ),
        centerTitle: true,
      ),
    );
  }
}

class BreadCrumbProvider extends ChangeNotifier{
  final List<BreadCrumb> _items = [];

  UnmodifiableListView<BreadCrumb> get item => UnmodifiableListView(_items);
}
