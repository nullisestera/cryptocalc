import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Uploader extends StatefulWidget {
  final File file;
  Uploader({Key key, this.file}) : super(key: key);

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://cryptocalc-881a2.appspot.com');

  StorageUploadTask _uploadTask;

  void _startUpload() {
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;
            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;
            return Column(
              children: [
                if (_uploadTask.isComplete) Text('Completo'),
                if (_uploadTask.isPaused)
                  FlatButton(
                      onPressed: _uploadTask.resume,
                      child: Icon(Icons.play_arrow)),
                if (_uploadTask.isInProgress)
                  FlatButton(
                      onPressed: _uploadTask.pause, child: Icon(Icons.pause)),
                LinearProgressIndicator(value: progressPercent),
                Text('${(progressPercent * 100).toStringAsFixed(2)} %')
              ],
            );
          });
    } else {
      return FlatButton.icon(
          icon: Icon(Icons.cloud_upload),
          label: Text('Subir'),
          onPressed: _startUpload);
    }
  }
}