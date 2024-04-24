import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadWithTitle extends StatefulWidget {
  final String title;
  final String description;

  const FileUploadWithTitle({
    required this.title,
    required this.description,
  });

  @override
  _FileUploadWithTitleState createState() => _FileUploadWithTitleState();
}

class _FileUploadWithTitleState extends State<FileUploadWithTitle> {
  late String _fileName = '';
  late String? _filePath = '';

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      _fileName = result.files.single.name!;
      _filePath = result.files.single.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(
          widget.description,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            if (_filePath != null) // Show uploaded image if available
              Image.file(
                File(_filePath!),
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFC9C9C9),
              ),
              height: 100,
              width: double.infinity,
              child: _fileName.isNotEmpty
                  ? Text(
                _fileName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              )
                  : Icon(
                Icons.attach_file,
                size: 48, // Set the size to 48
              ),
            ),
          ],
        ),
      ],
    );
  }
}
