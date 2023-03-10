import 'dart:io';

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicker extends StatelessWidget {
  final Function onImageSelected;
  final List<XFile> imageFiles;
  const ImagePicker(
      {super.key, required this.onImageSelected, required this.imageFiles});

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: elevatedButton(
                onPressed: () {
                  onImageSelected();
                },
                label: "Take some pictures",
                theme: theme),
          ),
          SizedBox(
            height: 100,
            child: imageFiles.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageFiles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.file(
                            File(imageFiles[index].path),
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text("No image selected yet"),
                  ),
          )
        ],
      ),
    );
  }
}
