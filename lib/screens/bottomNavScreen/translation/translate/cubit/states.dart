
import 'package:meaw/screens/bottomNavScreen/translation/translate/translateModel.dart';

abstract class TranslateStates{}

//initial states for social layout loading ,initial ,success ,and error
class InitialState extends TranslateStates{}
class TranslateLoadingState extends TranslateStates{}
class TranslateSuccessState extends TranslateStates{
  final TranslateModel translateModel;

  TranslateSuccessState(this.translateModel);
}
class TranslateErrorState extends TranslateStates{
  final String error;

  TranslateErrorState(this.error);
}
// class InitialTranslateState extends TranslateStates{}
// class RecordTranslateLoadingState extends TranslateStates{}
// class RecordTranslateState extends TranslateStates{}
// class RecordTranslateSuccesstate extends TranslateStates{}
// class StopTranslateLoadingState extends TranslateStates{}
// class StopTranslateSuccessState extends TranslateStates{}
class animateTranslateSuccessState extends TranslateStates{}
class animateSmallenTranslateSuccessState extends TranslateStates{}
