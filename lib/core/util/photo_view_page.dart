import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


class SinglePhotoViewPage extends StatelessWidget {
  final String image;

  const SinglePhotoViewPage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: PhotoViewGallery.builder(
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: MemoryImage(File(image).readAsBytesSync()),
            initialScale: PhotoViewComputedScale.contained,
          );
        },
        itemCount: 1,
      ),
    );
  }
}
