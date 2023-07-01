import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/screen/shelter/filterCubit/filterStates.dart';
class FilterCubit extends Cubit<FilterStates>
{
  FilterCubit(): super(FilterInitialState());
  static FilterCubit get(context) => BlocProvider.of(context);
  bool? ischeckedFemale = false;
  void onChangeCheckFemale(bool newbool){
    ischeckedFemale = newbool;
    emit(checkChangeFemaleSuccessState());
  }
  bool? ischeckedMale = false;
  void onChangeCheckMale(bool newbool){
    ischeckedMale = newbool;
    emit(checkChangeMaleSuccessState());
  }
var gender;

  bool? ischeckedSmall = false;
  void onChangeCheckSmall(bool newbool){
    ischeckedSmall = newbool;
    emit(checkChangeSmallSuccessState());
  }
  bool? isCheckedMedium = false;
  void onChangeCheckMedium(bool newbool){
    isCheckedMedium = newbool;
    emit(checkChangeMediumSuccessState());
  }
  bool? ischeckedLarge = false;
  void onChangeCheckLarge(bool newbool){
    ischeckedLarge = newbool;
    emit(checkChangeLargeSuccessState());
  }
  var weight;
  RangeValues values =  RangeValues(1,10);
  onChangeSlider(var newvalues)
  {
    values=newvalues;
    labels=RangeLabels("${values.start.toString()} months","${ values.end.toString()} months");
    emit(OnChangeSliderSuccessState());
  }
  RangeLabels labels = RangeLabels(
      "${1.toString()} months",
      "${10.toString()} months"
  );
  // var change = false;
  // changeApply(){
  //   change=true;
  //   emit(ChangeApplySuccessState());
  // }
  // changeReset() {
  //   change = false;
  //   emit(ChangeResetSuccessState());
  // }
  bool? ischeckedDog = false;
  void onChangeCheckDog(bool newbool){
    ischeckedFemale = newbool;
    emit(checkChangeDogSuccessState());
  }
  bool? ischeckedCat = false;
  void onChangeCheckCat(bool newbool){
    ischeckedCat = newbool;
    emit(checkChangeCatSuccessState());
  }
  var category;
}