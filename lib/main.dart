import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer' as devtools show log;
extension Log on Object{

  void log()=> devtools.log(toString());

}


enum Type {
  cat,
  dog
}
abstract class CanRun{
  final Type type;
  CanRun(this.type);
  @mustCallSuper
  void run(){
    "this is super".log();
  }
}

class Cat extends CanRun{
  Cat() : super(Type.cat);

  @override
  void run(){
    super.run();
    "this is the Cat".log();
  }
}

class Dog extends CanRun{

  Dog() : super(Type.dog);

  @override
  void run(){
    super.run();
    "this is the Dog".log();

  }

}


void testIt(){
  final cat = Cat();
  final dog = Dog();

  cat.type.log();
  dog.type.log();
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
