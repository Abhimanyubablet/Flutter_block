import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/image_picker/image_picker_bloc.dart';
import '../../bloc/image_picker/image_picker_event.dart';
import '../../bloc/image_picker/image_picker_states.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: BlocBuilder<ImagePickerBloc , ImagePickerState>(
            builder: (context, state){
              return state.file == null ? InkWell(
                onTap: (){
                  context.read<ImagePickerBloc>().add(CameraCapture());
                },
                child: const CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.camera),

                ),
              ) : Image.file(File(state.file!.path.toString()),height: 200,width: 200,);
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
      ),
    );
  }
}