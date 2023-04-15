abstract class CatStates{}

//initial states for social layout loading ,initial ,success ,and error
class CatInitialState extends CatStates{}


//=========================    sign up    ===========


class CatSignUpLoadingState extends CatStates{}
class CatSignUpSuccessState extends CatStates{}
class CatSignUpErrorState extends CatStates{
  final String error;

  CatSignUpErrorState(this.error);
}

class CatCreateUserSuccessState extends CatStates{
  final String uid;

  CatCreateUserSuccessState(this.uid);
}
class CatCreateUserErrorState extends CatStates{
  final String error;

  CatCreateUserErrorState(this.error);
}
class CatSignUpChangeVisibilityPasswordState extends CatStates{}


// =============================        sign in     =====================
class CatSignInLoadingState extends CatStates{}
class CatSignInSuccessState extends CatStates {
  final String uId;

  CatSignInSuccessState(this.uId);
}
class CatSignInErrorState extends CatStates {
  final String error;

  CatSignInErrorState(this.error);
}
class CatSignInChangeVisibilityPasswordState extends CatStates {}
class CatGetUserSuccessState extends CatStates {}
class CatGetUserErrorState extends CatStates {}

// =============================        pick profile Image     =====================

class CatPickProfileImageSuccessState extends CatStates{}
class CatPickProfileImageErrorState extends CatStates {}


// =============================        pick cover Image     =====================

class CatPickCoverImageSuccessState extends CatStates{}
class CatPickCoverImageErrorState extends CatStates {}



// =============================        upload profile Images     =====================
class CatUpdateImagesLoadingState extends CatStates{}
class CatUploadProfileImageSuccessState extends CatStates{}
class CatUploadProfileImageErrorState extends CatStates{}

// =============================        forget Password     =====================

class CatForgetPasswordLoadingState extends CatStates{}
class CatForgetPasswordSuccessState extends CatStates{}
class CatForgetPasswordErrorState extends CatStates{}



class CatUpdateUserLoadingState extends CatStates{}
class CatUpdateUserErrorState extends CatStates{}

//==================   sign out ==================
class CatSignOutSuccessfully extends CatStates{}
class CatSignOutError extends CatStates{
  final String error;

  CatSignOutError(this.error);

}

//==================   pick Cat Image ==================

class CatPickCatImageSuccessState extends CatStates{}
class CatPickCatImageErrorState extends CatStates{}

class CatAddCatLoadingState extends CatStates{}
class CatAddCatSuccessState extends CatStates{}
class CatAddCatErrorState extends CatStates{
  final String error;

  CatAddCatErrorState(this.error);
}
class CatUploadCatImageLoadingState extends CatStates{}
class CatUploadCatImageErrorState extends CatStates{}

class CatLoginFaceLoadingState extends CatStates{}
class CatLoginFaceSuccessState extends CatStates{
  final String uId;

  CatLoginFaceSuccessState(this.uId);

}
class CatLoginFaceErrorState extends CatStates{
}
class CatLoginGoogleSuccessState extends CatStates{
  final String uGoogleId;
  CatLoginGoogleSuccessState(this.uGoogleId);
}
class CatLoginCheck1ChangedState extends CatStates{}
class CatLoginCheck2ChangedState extends CatStates{}
class CatLoginCheck3ChangedState extends CatStates{}
class CatLoginRememberedState extends CatStates{}
class ChangeGradeDropdownState extends CatStates{}
class CatGetSuccessState extends CatStates{}
class CatUpdateErrorState extends CatStates{}
class CatUpdateSuccessState extends CatStates{}
class CatUpdateLoadingState extends CatStates{}
class CatUploadCatImageEditLoadingState extends CatStates{}
class CatUploadCatImageEditErrorState extends CatStates{}
class CatPickedCatImageEditLoadingState extends CatStates{}
class CatPickedCatImageEditSuccessState extends CatStates{}
class CatPickedCatImageEditErrorState extends CatStates{}


