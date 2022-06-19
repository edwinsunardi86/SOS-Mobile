import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String? nama;
  final String? jabatan;
  final String? imageUrl;
  const ImageDialog({Key? key, this.nama, this.jabatan, this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            width: 300,
            height: 300,
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl!,
                  width: 300,
                ),
              ],
            )));
  }
}
