import 'package:cryptocalc/styles/colors.dart';
import 'package:flutter/material.dart';
import '../drawer/drawerCalc.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../uploader/uploader.dart';

class Calc extends StatefulWidget {
  Calc({Key key}) : super(key: key);

  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {

  File _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        // ratioX: 1.0,
        // ratioY: 1.0,
        // maxWidth: 512,
        // maxHeight: 512,
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It');

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
      
      return Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.photo_camera),
                    onPressed: () => _pickImage(ImageSource.camera)),
                IconButton(
                    icon: Icon(Icons.photo_library),
                    onPressed: () => _pickImage(ImageSource.gallery)),
              ],
            ),
          ),
          backgroundColor: ClearBaseColor,
          appBar: AppBar(
            title: Center(
              child: Text('CryptoCalc v2.0'),
            ),
          ),
          body: ListView(
          children: <Widget>[
            if (_imageFile != null) ...[
              Image.file(_imageFile),
              Row(
                children: <Widget>[
                  FlatButton(onPressed: _cropImage, child: Icon(Icons.crop)),
                  FlatButton(onPressed: _clear, child: Icon(Icons.refresh))
                ],
              ),
              Uploader(file: _imageFile),
              ]
            ],
          ),
          drawer: Container(
            width: 250,
            child: DrawerCalc()
          )
        );
    }
}

