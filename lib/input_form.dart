import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

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
                child: Lottie.asset("assets/93038-notifications.json", height: 350),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text("This is a simple TODO list incorporating API practices",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 18
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
                    // controller: raceController,
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
                    // controller: raceController,
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
                  onPressed: () {

                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.indigoAccent;
                        }
                        return null;
                      },
                    ),
                  ),
                  child: const Text("Submit",
                    style:
                    TextStyle(fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
