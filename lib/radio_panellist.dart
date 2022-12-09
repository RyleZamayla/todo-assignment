import 'package:flutter/material.dart';
import 'package:todo_assignment/editing_form.dart';


class CustomPanel extends StatefulWidget {
  final Map<String, dynamic> todos;
  const CustomPanel({Key? key, required this.todos}) : super(key: key);

  @override
  State<CustomPanel> createState() => _CustomPanelState();
}

class _CustomPanelState extends State<CustomPanel> {

  bool _expanded = false;
  bool _showMoreOptions = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onLongPress: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditingForm())
                  );
                },
                child: ExpansionPanelList(
                  animationDuration: const Duration(milliseconds: 500),
                  children: [
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            leading: const Icon(Icons.check_circle_outline),
                            title: Text(widget.todos["title"],),
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
                            title: Text(widget.todos["body"],
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

