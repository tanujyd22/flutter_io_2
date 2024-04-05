import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_1/todo.dart';
import 'package:flutter_1/boxes.dart';
class addScreen extends StatefulWidget {
  const addScreen({super.key});

  @override
  State<addScreen> createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    
    final box = Boxes.getBox();
    
    _focusNode.requestFocus();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add ToDo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: (String s){
                setState((){});
              },
              decoration: InputDecoration(
                errorText:_controller.text.contains("/") ? "Remove the /" : "",
              )
            ),
            Visibility( 
              visible: !_controller.text.contains("/"),
              child:IconButton(
              icon: const Icon(Icons.save), 
              onPressed: (){
                debugPrint(_controller.text);
                if(_controller.text.contains("/")){
                  debugPrint("Hey you have a forward slash in your input");
                }else{
                  Todo t = new Todo()
                    ..text = _controller.text;

                  box.add(t);
                }
                // Navigator.pop(context);
              }
            ),
            ),
            Text("You already have ${data["no"]} tasks"),
          ],
        )
      ),
    );
  }
}