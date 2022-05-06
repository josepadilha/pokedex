import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_image_file.dart/image_file_event.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_image_file.dart/image_file_state.dart';
import 'package:pokedex/services/repository.dart';

class ImageFileBloc extends Bloc<ImageFileEvent, ImageFileState> {
  final _pokeRepository = ImageFileRepository();

  ImageFileBloc() : super(ImageFileInitState()) {
    on<PickedImageFileEvent>((event, emit) => _pickedImage(event, emit));
  }

  _pickedImage(PickedImageFileEvent event, Emitter<ImageFileState> emit) async {
    File? imageFile = await _pokeRepository.selectFile();
    emit(ImageFileSucessState(imageSucessFile: imageFile));
  }
}
