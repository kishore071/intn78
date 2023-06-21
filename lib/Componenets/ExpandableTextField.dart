import 'package:flutter/material.dart';
import 'package:intern78/Decorator/constants.dart';
class ExpandableTextField extends StatefulWidget {
  @override
  _ExpandableTextFieldState createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<ExpandableTextField> {
  bool isExpanded = false;
  String pdfName = '';
  List<TextEditingController> textControllers = [];
  List name=[];
  @override
  void initState() {
    super.initState();
    // Initialize text field controllers
    textControllers.add(TextEditingController());
    textControllers.add(TextEditingController());
  }

  @override
  void dispose() {
    // Dispose of text field controllers
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addTextField() {
    setState(() {
      textControllers.add(TextEditingController());
    });
  }

  void removeTextField(int index) {
    setState(() {
      textControllers.removeAt(index);
    });
  }

  void onFileSelected(String fileName) {
    setState(() {
      pdfName = fileName;
    });
  }

  void deletePDF() {
    setState(() {
      pdfName = '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey,
            child: Text(isExpanded ? 'Tap to Collapse' : 'Tap to Expand'),
          ),
        ),
        if (isExpanded) ...[
          for (var i = 0; i < textControllers.length; i++) ...[
            TextField(
              controller: textControllers[i],
              decoration: InputDecoration(
                labelText: 'Text Field ${i + 1}',
              ),
            ),
          ],
          SizedBox(height: 10),
          Column(
            children: [
              if(pdfName.length<=0)...[
                ElevatedButton(
                onPressed: () {
                 onFileSelected('example.pdf');
                },
                child: Text('Add PDF'),
              ),],
              SizedBox(width: 10),
              if (pdfName.isNotEmpty) ...[
                Row(
                  children: [
                    Text('PDF: $pdfName'),
                    Boxe,
                    ElevatedButton.icon(onPressed: ()=>deletePDF(),
                        icon:Icon(Icons.delete_sweep),
                        label: Text('Delete'))
                  ],
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}
