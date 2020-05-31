import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  final _picker = ImagePicker();
  File _pickedImage;

  void _pickImage() async {
    final pickedImageFile = await _picker.getImage(
      source: ImageSource.camera,
    );

    setState(() {
      _pickedImage = File(pickedImageFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.black12,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    );
  }
}
