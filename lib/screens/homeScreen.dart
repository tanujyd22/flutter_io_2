import 'package:flutter/material.dart';
import 'package:flutter_1/boxes.dart';
import 'package:flutter_1/todo.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
        child: ValueListenableBuilder<Box<Todo>>(
                    valueListenable: Boxes.getBox().listenable(),
                    builder: (context, box, _) {
                      final contents = box.values.toList().cast<Todo>();

                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: contents.length,
                              itemBuilder: (BuildContext context, int index) {
                                final content = contents[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(content.text),
                                    onTap: () {
                                      Boxes.getBox().deleteAt(index);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ]
                      );
                    },
                  ),

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