import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo",
          style: TextStyle(color: Color.fromARGB(255, 30, 178, 219)),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint("Button Pressed");

          // Move to addTodo Page
          Navigator.pushNamed(context, "/add", arguments: {"no": 5});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}