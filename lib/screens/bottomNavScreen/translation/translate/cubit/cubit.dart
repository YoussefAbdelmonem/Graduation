import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/screens/bottomNavScreen/translation/translate/cubit/states.dart';
import 'package:meaw/screens/bottomNavScreen/translation/translate/dio.dart';
import 'package:meaw/screens/bottomNavScreen/translation/translate/translateModel.dart';

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


  }

  double boxHeight = 250;
  double boxWidth = 250;
animate(
   // double boxHeight,double boxWidth
    ){
  if (boxHeight == 300) {
    boxHeight = 250;
    boxWidth = 250;
  } else {
    boxHeight = 300;
    boxWidth = 300;
  }
  emit(animateTranslateSuccessState());
}
animateSmallen(
   // double boxHeight,double boxWidth
    ){
  boxHeight=100;
  boxWidth=100;
  emit(animateSmallenTranslateSuccessState());
}
}