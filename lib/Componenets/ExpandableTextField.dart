import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intern78/Decorator/constants.dart';
class ExpandableTextField extends StatefulWidget {
  const ExpandableTextField({super.key});

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

  void onFileSelected() {
    setState(() async {
      final result = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type:FileType.custom,
          allowedExtensions: ['pdf','mp4']);
      if (result == null) return;
      final file = result.files.first;
      openFile(result.files as PlatformFile);
      print('Name: ${file.name}');
      print('Bytes: ${file.bytes}');
      print('size: ${file.size}');
      print('Extension: ${file.extension}');
      print('path: ${file.path}');

      final newfile = await saveFilePermanently(file);
      print('From Path: $file.path!}');
      print('To Path: ${newfile.path}');

    });}

  void deletePDF() {
    setState(() {
      pdfName = '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
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
            const SizedBox(height: 10),
            Column(
              children: [
                if(pdfName.isEmpty)...[
                  ElevatedButton(
                  onPressed: () async{
                   onFileSelected();
                  },
                  child: const Text('Add PDF'),
                ),],
                const SizedBox(width: 10),
                if (pdfName.isNotEmpty) ...[
                  Row(
                    children: [
                      Text('PDF: $pdfName'),
                      Boxe,
                      ElevatedButton.icon(onPressed: ()=>deletePDF(),
                          icon:const Icon(Icons.delete_sweep),
                          label: const Text('Delete'))
                    ],
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}
