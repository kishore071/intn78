
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../Decorator/constants.dart';

class FilesPivckers extends StatefulWidget {
  const FilesPivckers({super.key});

  @override
  State<FilesPivckers> createState() => _FilesPivckersState();
}

class _FilesPivckersState extends State<FilesPivckers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(32),
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text('Pick File'),
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
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

                },
              ),),
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.pushNamed(context, '/adddetails');
              });
            }, child: field('Switch'))
          ],
        ),
      ),
    );
  }
  // void openFiles(List<PlatformFile> files)=>
  //     Navigator.of(context).push(
  //         MaterialPageRoute(builder: context)=>FilesPage(
  //     files:files,
  //   onOpenedFile:openFile;
  // ));

}

