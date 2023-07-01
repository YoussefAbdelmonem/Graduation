import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/petProfileList/petProfileListCubit/cubit.dart';

import '../../data/models/catModel.dart';
Widget petItem({
  required CatModel e
}){
  return Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      border: Border.all(
          color: defaultColor, width: 1),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Column(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage:
          NetworkImage('${e.catImage}'),
        ),
        Text(
          '${e.name}',
          style: const TextStyle(
              fontSize: 17,
              fontFamily: 'Jannah',
              color: Colors.black),
        ),
      ],
    ),
  );
}
Widget addItem(){
  return Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      border: Border.all(
          color: defaultColor, width: 1),
      borderRadius:
      BorderRadius.circular(4),
    ),
    child: Column(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            backgroundImage: AssetImage(
                'assets/images/Group 234.png'),
          ),
        ),
        Text(
          'Add Pet',
          style: const TextStyle(
              fontSize: 17,
              fontFamily: 'Jannah',
              color: Colors.black),
        ),
      ],
    ),
  );
}
Widget petAge({
  required BuildContext context
}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: (){
          PetProfileListCubit.get(context).addAge();
        },
        child: Container(
            height: 20,
            width: 20,
            child:SvgPicture.asset('assets/images/Upp.svg')),
      ),
      const SizedBox(height: 5,),
      GestureDetector(
        onTap: (){
          if(PetProfileListCubit.get(context).catYear == 0)
          {}
          else {
            PetProfileListCubit.get(context).minusAge();
          }
        },
        child: Container(
            height: 20,
            width: 20,
            child:SvgPicture.asset('assets/images/downn.svg')
        ),
      ),

    ],
  );
}
Widget petGender({
  required BuildContext context
}){
  return DropdownButton(
    dropdownColor: Colors.white,
    // hint: Text(' Gender',
    //   style: GoogleFonts.roboto(
    //       fontSize: 18,
    //       color: Colors.black,
    //       fontWeight: FontWeight.w400),
    // ),
    underline: const SizedBox(),
    value: PetProfileListCubit.get(context).catGender==null?'Male':PetProfileListCubit.get(context).catGender,
    icon: Container(
        width: 20,
        height: 20,
        child: ImageIcon(AssetImage('assets/images/gend.png'),)),
    elevation: 16,
    style: const TextStyle(
      color:Colors.grey,
      fontFamily: 'Jannah',
      fontSize: 20,
    ),
    isExpanded: true,
    items: PetProfileListCubit.get(context).list.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    onChanged: (value) {
     PetProfileListCubit.get(context).gender(value);
    },
  );
}
Widget divider(){
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 7,end: 3,),
    child: Container(
      color: defaultColor,
      height: 1,
      width: double.infinity,
    ),
  );
}