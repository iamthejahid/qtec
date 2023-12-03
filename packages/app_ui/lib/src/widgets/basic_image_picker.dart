import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BasicPhotoUploadDialog {
  static Future<File?> showImageSourceDialog(BuildContext context) async {
    return await showDialog<File>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a picture'),
                onTap: () async {
                  Navigator.of(context)
                      .pop(await _getImage(ImageSource.camera));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.photo_library),
              //   title: Text('Choose from gallery'),
              //   onTap: () async {
              //     Navigator.of(context)
              //         .pop(await _getImage(ImageSource.gallery));
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }

  static Future<File?> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
