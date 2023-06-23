/*
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
class FilesPage extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  FilesPage({
    Key? key,
    required this.files,
    required this.onOpenedFile,
  }):super(key:key);
  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:GridView.builder(
            padding:EdgeInsets.all(16),
            gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,mainAxisSpacing: 8,
        crossAxisSpacing: 8),
            itemCount: widget.files.length,
            itemBuilder: (context,index){
              final files=widget.files[index];
              return buildFile(files);
            })
      ),
    );
  }
  Widget buildFile(PlatformFile file){
    final kb=file.size/1024;
    final mb=kb/1024;
    final fileSize=
        mb>=1?'${mb.toStringAsFixed(2)}MB':'${mb.toStringAsFixed(2)}KB';
    final extension=file.extension??'none';
    final color=getColor(extension);
    return InkWell(
      onTap: ()=>widget.onOpenedFile(file),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),child: Text('$extension',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
            ))
          ],
        ),
      ),
    );
  }

}
*/
