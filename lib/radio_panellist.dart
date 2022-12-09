import 'package:flutter/material.dart';
import 'package:todo_assignment/editing_form.dart';

class CustomPanel extends StatefulWidget {

  const CustomPanel({Key? key}) : super(key: key);

  @override
  State<CustomPanel> createState() => _CustomPanelState();
}

class _CustomPanelState extends State<CustomPanel> {

  var receive;

  bool _expanded = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onLongPress: () async{
                  var todoReciever = await
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditingForm(),
                      ),
                  );
                  setState(() {
                    receive.add(todoReciever);
                  });
                },
                child: ExpansionPanelList(
                  animationDuration: const Duration(milliseconds: 500),
                  children: [
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            leading:
                              isChecked ? const Icon(Icons.check_circle_outline,
                                  color: Colors.green)
                                        : const Icon(Icons.check_circle_outline),
                            title: Text(receive["title"],),
                            // trailing: Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: const <Widget> [
                            //     Padding(
                            //       padding: EdgeInsets.symmetric(horizontal: 5),
                            //       child: Icon(Icons.edit),
                            //     ),
                            //     Icon((Icons.delete))
                            //   ],
                            // ),
                          );
                        },
                        body: Padding(
                          padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 30
                          ),
                          child: ListTile(
                            title: Text(receive["body"],
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                        isExpanded: _expanded,
                        canTapOnHeader: true,
                        hasIcon: true
                    )],
                  expansionCallback: (panelIndex, isExpanded) {
                    _expanded = !_expanded;
                    setState(() {
                      
                    });
                  },
                  dividerColor: Colors.grey,
                ),
              )
            )
        )
      ],
    );

  }
}

