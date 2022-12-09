import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class EditingForm extends StatefulWidget {
  final dynamic todos;
  EditingForm({required this.todos,Key? key}) : super(key: key);

  @override
  State<EditingForm> createState() => _EditingFormState();
}

class _EditingFormState extends State<EditingForm> {

  List todosPlaceHolder = <dynamic> [];

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  bool? checker;
  var formKey = GlobalKey<FormState>();

  bool? confirmDelete = false;

  @override

  void initState() {
    super.initState();
    titleController.text = widget.todos['title'];
    bodyController.text = widget.todos['body'];
    // transferTodo();
  }

  // simpleLoop(){
  //   for (var index in todos){
  //     return index;
  //   }
  // }

  // transferTodo(){
  //   for (int i = 0; i<=widget.todos.length; i++){
  //     setState(() {
  //       todosPlaceHolder.add(widget.todos[i]);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text("Edit your Todos task here"),
        ),
      ),
        body: Center(
          child: Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(25),
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Lottie.asset("assets/105012-edit-document.json", height: 250),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Completed Status: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                      Switch(
                          value: checker ?? false,
                          activeColor: Colors.green,
                          onChanged: (bool? value){
                            setState(() {
                              checker = value;
                            });
                          }
                          )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: titleController,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                          fontSize: 15
                      ),
                      decoration: const InputDecoration(
                          labelText: "Enter a Task:",

                          icon: Icon(Icons.checklist_outlined)
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: bodyController,
                      keyboardType: TextInputType.name,
                      maxLines: 5,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      decoration: const InputDecoration(
                          labelText: "Enter your Description:",
                          icon: Icon(Icons.note_alt_outlined)
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      primary: Colors.green, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      setState(() {

                      });
                    },
                    child: const Text("Update Task",
                      style:
                      TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () async {
                      await openDialog(widget.todos);
                      Navigator.pop(
                        context,
                        todosPlaceHolder
                      );
                    },
                    child: const Text("Delete",
                      style:
                      TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  deleteTodo(var todo) async {
    await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$todo'));
  }

  Future openDialog(todo) => showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text("Confirm task 'DELETE' submission?"),
          content: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text("Yes, I would like to confirm that this task should be deleted.",
              style: TextStyle(
                  fontSize: 18
              ),
            ),
            value: confirmDelete,
            onChanged: (confirmDelete) => setState (() => this.confirmDelete = confirmDelete!,),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  deleteTodo(todo);
                  Navigator.of(context).pop();
                },
                child: const Text('Delete Task',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),))
          ],
        )
      )
    );
}
