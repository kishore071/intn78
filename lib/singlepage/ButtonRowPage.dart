import 'package:flutter/material.dart';
class ButtonRowPage extends StatefulWidget {
  const ButtonRowPage({super.key});

  @override
  _ButtonRowPageState createState() => _ButtonRowPageState();
}

class _ButtonRowPageState extends State<ButtonRowPage> {
  List<Widget> rows = [];
  late TextEditingController textview=TextEditingController();
  late String value='';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 78,5),
      child: Column(
          children:<Widget> [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 78,5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rows.add(createRow());
                    });
                  },
                  child: const Text('Add Row'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: rows,
            ),
          ],
      ),
    );
  }
  Widget createRow() {
    return Column(
      children:<Widget> [
        TextFormField(
            controller: textview,
            validator:(textview)=>textview!.isEmpty?'Enter Details Properly' :null,
            onChanged: (textview){
              value=textview;
              //print(value);
            },
          ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              rows.removeLast();
            });
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
