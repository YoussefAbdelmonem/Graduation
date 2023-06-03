
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/local/shared_pref.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/yousef/utilis/urilis.dart';


void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    // save the last route or note
        (route) => false); // remove all last route

Widget defaultTextFormField({
  required TextEditingController controller,
  required String? Function(String? value) validator,
  required TextInputType inputType,
   String? label,
   String? hint,
  String?initval,
   IconData? prefix,
  IconData? suffix,
  Function()? onSuffixPressed,
  Function()? onTap,
  Function(String s)? onSubmit,
  bool isPassword = false,
  TextCapitalization textCapitalization = TextCapitalization.none,
  required BuildContext context,
}) =>
    Center(
      child: TextFormField(

        controller: controller,
        keyboardType: inputType,
        obscureText: isPassword,
        onTap: onTap,
        onFieldSubmitted: onSubmit,
        textCapitalization: textCapitalization,

        style: TextStyle(color: Colors.grey),

        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blue),
          hintStyle: TextStyle(color: Colors.blue),

          hintText: hint,
          helperStyle:  GoogleFonts.roboto(
              fontSize: 12,
              color:Color.fromRGBO(231, 229, 229, 1),
              fontWeight: FontWeight.w400
          ),

          suffixIcon: IconButton(icon: Icon(suffix), onPressed: onSuffixPressed,color: Color.fromRGBO(231, 229, 229, 1),),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: const BorderSide(color: defaultColor),
          // ),
          border: UnderlineInputBorder(
            borderSide: const BorderSide(color: defaultColor,width: 2,),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: defaultColor,width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: defaultColor),
          ),
        ),
        autofocus: false,
        enabled: true,
        validator: validator,
        initialValue:initval,
      ),
    );
Widget defaultTextFormFieldForSearch({
  required TextEditingController controller,
  required String? Function(String? value) validator,
  required TextInputType inputType,
  String? label,
  String? hint,
  String?initval,
  IconData? prefix,
  Widget? suffix,
  Function()? onSuffixPressed,
  Function()? onTap,
  Function(String s)? onSubmit,
  bool isPassword = false,
  TextCapitalization textCapitalization = TextCapitalization.none,
  required BuildContext context,
}) =>
    Center(
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: isPassword,
        onTap: onTap,
        onFieldSubmitted: onSubmit,
        textCapitalization: textCapitalization,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          helperStyle:  GoogleFonts.roboto(
              fontSize: 12,
              color:Color.fromRGBO(231, 229, 229, 1),
              fontWeight: FontWeight.w400
          ),
          prefixIcon: Icon(
            prefix,color:Colors.grey,
          ),
          suffixIcon: suffix
          // IconButton(icon: Icon(suffix), onPressed: onSuffixPressed,color: Color.fromRGBO(231, 229, 229, 1),)
          ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: defaultColor),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: defaultColor),
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: defaultColor),
          ),
        ),
        autofocus: false,
        enabled: true,
        validator: validator,
        initialValue:initval,
      ),
    );

Widget defaultButton({
  double width = double.infinity, // give it default width but can edit later
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 5.0,
  required String text,
  required Function()? onPressed,
}) =>
    Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: defaultColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style:GoogleFonts.roboto(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
Widget defaultTextButton(
    {required Function() function, required String text}) =>
    TextButton(
      onPressed: function,
      child: Text(text,
        style: GoogleFonts.roboto(
            fontSize: 20,
            color: defaultColor,
            fontWeight: FontWeight.w500
        ),
      ),
    );

Widget defaultTextButtonUnderlined(
    {required Function() function, required String text}) =>
    TextButton(
      onPressed: function,
      child: Text(text,
        style: GoogleFonts.roboto(
            fontSize: 18,
            color: defaultColor,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          decorationThickness: 2
        ),
      ),
    );
Widget defaultTextButtonBlack(
    {required Function() function, required String text}) =>
    TextButton(
      onPressed: function,
      child: Text(text,
        style: GoogleFonts.roboto(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w400
        ),
      ),
    );


void showToast({required String message, required ToastStates state}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: choseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { success, error, warning }

// get hte color of the toast depend on the state
// success, error and warning
Color choseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child: Container(
    color: Colors.grey,
    height: 1,
    width: double.infinity,
  ),
);
Widget myDividerFilter() => Padding(
  padding: const EdgeInsetsDirectional.only(end: 10),
  child: Container(
    color: defaultColor,
    height: 2,
    width: double.infinity,
  ),
);
Widget myDividerLong() => Container(
  color: Colors.grey[300],
  height: 1,
  width: double.infinity,
);
Widget buildButton({
  required String text,
  required Function() onButtonTap,
  required Color color,
  double width = double.infinity,
  double? topRight =0,
  double? topLeft=0,
  double? bottomRight=0,
  double? bottomLeft=0,
}){
  return GestureDetector(
    onTap: onButtonTap,
    child: Container(
      height: 60,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft!),
          topRight: Radius.circular(topRight!),
          bottomRight: Radius.circular(bottomRight!),
          bottomLeft: Radius.circular(bottomLeft!),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.blueGrey,
            offset: Offset(2.0,4.0),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Center(
        child: Text(text,
          style: const TextStyle(
            fontFamily: 'Jannah',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );

}
Widget listTile({
  required String image,
  required String label,
  required String icon,
  Function? function
}){
  return ListTile(
    onTap: (){
      function!();
    },
    leading: Image(image: AssetImage(image),height: 25),
    title: Text(label),
    trailing: Image(image: AssetImage(icon),),
  );
}
DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  value: item,
  child: Text(
    item,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
);
Widget appBaar({
  required BuildContext context,
   required Widget screen,
  required String label,
  required double width
}){
  return Row(
    children: [
      InkWell(
        onTap: () {
          navigateAndFinish(context, screen);
         // Utils.backWidget(context);
        },
        child: Image(
            image: AssetImage('assets/images/arrowleft.png')),
      ),
      SizedBox(
        width: width,
      ),
      Text(
        label,
        style: GoogleFonts.roboto(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget articleAppBaar({
  required BuildContext context,
  // required Widget screen,
  required String label,
  required double width
}){
  return Row(
    children: [
      Utils.backWidget(context),
      SizedBox(
        width: width,
      ),
      Text(
        label,
        style: GoogleFonts.roboto(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}