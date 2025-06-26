import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(MaterialApp(
    home: UploadPage(),
    debugShowCheckedModeBanner: false,
  ));
}
class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}
class _UploadPageState extends State<UploadPage> {
  File? _image;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _image == null
                    ? Column(
                  children: const [
                    Icon(Icons.cloud_upload_outlined, size: 60, color:
                    Colors.grey),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Drag& drop ', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'images or file\n', style:
                          TextStyle(color: Colors.teal)),
                          TextSpan(text: 'or '),
                          TextSpan(text: 'browse files', style:
                          TextStyle(color: Colors.teal)),
                        ],
                        style: TextStyle(fontSize: 16),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
                    : Image.file(_image!),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff12867A),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical:
                  15),
                ),
                child: const Text('Upload', style: TextStyle(fontSize: 16,color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
