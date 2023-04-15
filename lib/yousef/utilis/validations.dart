class Validation {
  String? emailValidation(value) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);
    if (value!.isEmpty) {
      return ('البريد الالكتروني مطلوب');
    } else if (!regExp.hasMatch(value)) {
      return ('من فضلك ادخل بريد الكتروني صحيح');
    } else
      return null;
  }

  String? passwordValidation(value) {
    if (value!.isEmpty || value.length < 8) {
      return ('كلمة المرور يجب ان تكون اكبر من 8 حروف');
    } else
      return null;
  }

  String? confirmPasswordValidation(value, String password) {
    if (value!.isEmpty || value.length < 8) {
      return ('كلمة المرور يجب ان تكون اكبر من 8 حروف');
    } else if (password != value) {
      return ('كلمة المرور غير متطابقة');
    } else
      return null;
  }

  String? defaultValidation(value) {
    if (value!.isEmpty) {
      return ('لا يجب ان يكون هذا الحقل فارغ');
    } else
      return null;
  }
}
