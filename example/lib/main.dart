import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_photo_editor/flutter_photo_editor.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterPhotoEditorPlugin = FlutterPhotoEditor();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _flutterPhotoEditorPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  test();
                },
                child: Text("Add photo"),
              ),
            ),

            if(imagePath != null)
              Image.file(File(imagePath!), width: 300, height: 500,)
          ],
        ),
      ),
    );
  }

  String? imagePath;

  void test() async {
    print("start");

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    String? path = image?.path;
    // onImageEdit(path);
    if(path != null) {
      editImage(path);
    }
  }

  void editImage(String path) async {

    print("path: $path");

    var b = await FlutterPhotoEditor().editImage(path);

    setState(() {
      imagePath = path;

    });
    print("end : $b");
  }


}
