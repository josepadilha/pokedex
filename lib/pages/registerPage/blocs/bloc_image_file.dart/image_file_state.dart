import 'dart:io';

abstract class ImageFileState {
  File? imageFile;

  ImageFileState({
    required this.imageFile,
  });
}

class ImageFileInitState extends ImageFileState {
  ImageFileInitState() : super(imageFile: null); // dúvida sobre o super.
}

class ImageFileSucessState extends ImageFileState {
  File? imageSucessFile;

  ImageFileSucessState({
    required this.imageSucessFile,
  }) : super(imageFile: imageSucessFile); // dúvida sobre o super.
}
