/*
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../Output/FilesPage.dart';

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
      body: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        child: ElevatedButton(
          child: const Text('Pick File'),
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles(
                allowMultiple: true,
                type:FileType.custom,
            allowedExtensions: ['pdf','mp4']);
            if (result == null) return;
            final file = result.files.first;
            openFiles(result.files);
            */
/*print('Name: ${file.name}');
            print('Bytes: ${file.bytes}');
            print('size: ${file.size}');
            print('Extension: ${file.extension}');
            print('path: ${file.path}');*//*

            final newfile = await saveFilePermanently(file);
            */
/*print('From Path: $file.path!}');
            print('To Path: ${newfile.path}');*//*

          },
        ),
      ),
    );
  }
  void opnFiles(List<PlatformFile> files)=>
      Navigator.of(context).push(
          MaterialPageRoute(builder: context)=>FilesPage(
      files:files,
    onOpenedFile:openFile;
  ));

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage..path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
*/
