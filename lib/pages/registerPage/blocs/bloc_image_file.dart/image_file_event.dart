import 'dart:io';

abstract class ImageFileEvent {}

class PickedImageFileEvent extends ImageFileEvent {}

class GetImageFileEvent extends ImageFileEvent {
  File? getImage;

  GetImageFileEvent({
    required this.getImage,
  });
}
