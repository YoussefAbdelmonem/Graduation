import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/components/constants.dart';
import 'package:meaw/translate/cubit/states.dart';
import 'package:meaw/translate/dio.dart';
import 'package:meaw/translate/translateModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
class TranslateCubit extends Cubit<TranslateStates>
{
  TranslateCubit(): super(InitialState());
  static TranslateCubit get(context) => BlocProvider.of(context);
  TranslateModel? translateModel;

  void translate({
     String? translation,
    required String filePath,
    required String fileName,
    BuildContext? context
  })
  {
    emit(TranslateLoadingState());

    DioHelper.postFile(
        url: translateEnd,
        filePath: filePath,
        fileName: fileName
    ).then((value)
        {
          print("your label is"+value.data.toString());
          print("your path is"+filePath.toString());
          translateModel = TranslateModel.fromJson(value.data);
          emit(TranslateSuccessState(translateModel!));
        }).catchError((error)
        {
          print("errorr"+error.toString());
          emit(TranslateErrorState(error.toString()));
        });

    // postData(
    //   url: translateEnd,
    //   data:
    //   {
    //     'Translation': translation,
    //   },
    // ).then((value)
    // {
    //   print(value.data);
    //   translateModel = TranslateModel.fromJson(value.data);
    //   //emit(LoginSuccessState(loginModel!));
    // }).catchError((error)
    // {
    //   print(error.toString());
    //  // emit(LoginErrorState(error.toString()));
    // });
  }
//   final record = Record();
//   Future <void> recordTranslate()
//   async{
//     emit((RecordTranslateState()));
//     Directory tempDir = await getApplicationDocumentsDirectory();
//     String path = tempDir.path;
// // Check and request permission
//     if (await record.hasPermission()) {
//       // Start recording
//       await record.start(
//         path:path+'/myFile.wav' ,
//         encoder: AudioEncoder.wav, // by default
//         bitRate: 128000, // by default//كم بيت ف الثانية
//       );
//     }
//     emit((RecordTranslateSuccesstate()));
//   }
//   String path = tempDir.path;
//   Future<void>stopTranslate()
//   async{
//     await record.stop();
//     Directory tempDir = await getApplicationDocumentsDirectory();
//
//     AudioPlayer player=AudioPlayer();
//     player.play(DeviceFileSource(path+'/myFile.wav'));
//     File f=File(path+'/myFile.wav');
//     // _writeFileToStorage();
//     _createFile(f.path);
//     print("file path"+f.path.toString());
//     TranslateCubit.get(context).translate(
//       fileName:"myFile" ,filePath: f.path.toString(),
//     );
//   }
}