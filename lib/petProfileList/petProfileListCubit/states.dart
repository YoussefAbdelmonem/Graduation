abstract class PetProfileListStates{}

//initial states for social layout loading ,initial ,success ,and error
class PetInitialProfileListState extends PetProfileListStates{}
class PetPickCatImageSuccessState extends PetProfileListStates{}
class PetPickProfileImageErrorState extends PetProfileListStates{}
class PetUploadCatImageLoadingState extends PetProfileListStates{}
class PetAddCatLoadingState extends PetProfileListStates{}
class PetAddCatSuccessState extends PetProfileListStates{}
class PetGetSuccessState extends PetProfileListStates{}
class PetAddCatErrorState extends PetProfileListStates{
  final String error;

  PetAddCatErrorState(this.error);
}
class PetUploadCatImageErrorState extends PetProfileListStates{}
class PetaddAgeSuccessState extends PetProfileListStates{}
class PetminusAgeSuccessState extends PetProfileListStates{}
class PetGenderAgeSuccessState extends PetProfileListStates{}