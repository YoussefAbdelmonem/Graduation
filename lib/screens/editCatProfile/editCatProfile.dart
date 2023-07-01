import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/cubit/animalStates.dart';
import 'package:meaw/petProfileList/list.dart';
import 'package:meaw/petProfileList/petProfileListCubit/petComponent.dart';
import 'package:meaw/screens/profileScreen/updateProfile/updateProfile.dart';

import '../../data/models/catModel.dart';

class EditCatScreen extends StatefulWidget {
  EditCatScreen(
      {required this.index,
      required this.name,
      required this.year,
      required this.gender,
      required this.catModel})
      : super();
  int index;
  List<CatModel> catModel;
  String name;
  String year;
  String gender;

  @override
  State<EditCatScreen> createState() => _EditCatScreenState();
}

class _EditCatScreenState extends State<EditCatScreen> {
  var catName = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int catYear = 0;
  String? catGender;
  List<String> list = <String>[
    'Male',
    'Female',
  ];
  @override
  var catImage;

  void initState() {
    // TODO: implement initState
    super.initState();
    // catName.text=widget.name;
  }

  Widget build(BuildContext context) {
    // FocusScope.of(context).unfocus();
    catName.text = widget.name;
    catGender = widget.gender;
    catYear = int.parse(widget.year);
    return BlocConsumer<CatCubit, CatStates>(
      listener: (context, state) {
        if (state is CatUpdateSuccessState) {
          showToast(message: 'Cat updated', state: ToastStates.success);
          navigateAndFinish(context, ListScreen());
        }
      },
      builder: (context, state) {
        var cubit = CatCubit.get(context);
        //catImage = CatCubit.get(context).catImage;
        catImage = widget.catModel[widget.index].catImage;
        var CatImage = cubit.catImageEdit;
        print('age is' + catYear.toString());
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, bottom: 24.0, top: 40),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    appBaar(
                        context: context,
                        screen: ListScreen(),
                        label: 'Edit Profile',
                        width: 65.0),
                    SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: CatImage == null
                              ? NetworkImage('${catImage}')
                              : FileImage(CatImage) as ImageProvider,
                          // FileImage(catImage) as ImageProvider,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: () {
                                    cubit.getCatEditImage();
                                  },
                                  icon: const Image(
                                    image:
                                        AssetImage('assets/images/Group-4.png'),
                                    height: 15,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (CatImage != null)
                      const SizedBox(
                        height: 20,
                      ),
                    if (CatImage != null)
                      ConditionalBuilder(
                        condition: state is! CatUploadCatImageEditLoadingState,
                        builder: (BuildContext context) => defaultButton(
                          text: 'Update profile Image',
                          onPressed: () async {
                            await CatCubit.get(context).uploadCatEditImage(
                                catName: catName.text,
                                year: catYear.toString(),
                                gender:
                                    cubit.catModel!.gender.toString() );
                          },
                        ),
                        fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(
                            color: defaultColor,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Text('Cat\'s Name',
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    defaultTextFormField(
                        controller: catName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name is Empty';
                          }
                          return null;
                        },
                        inputType: TextInputType.name,
                        context: context),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(
                                  'Cat\'s Age',
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(
                                  '$catYear',
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    catYear += 1;
                                  });
                                },
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    child: SvgPicture.asset(
                                        'assets/images/Upp.svg')),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (catYear == 0) {
                                  } else {
                                    setState(() {
                                      catYear -= 1;
                                    });
                                  }
                                },
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    child: SvgPicture.asset(
                                        'assets/images/downn.svg')
                                    // ImageIcon(AssetImage('assets/images/down.png'))
                                    ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    //  const SizedBox(height: 10,),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 7, end: 3),
                      child: Container(
                        color: defaultColor,
                        height: 1,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Text('Gender',
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 12.0,
                      ),
                      child: DropdownButton(
                        dropdownColor: Colors.white,
                        // hint: Text(' Gender',
                        //   style: GoogleFonts.roboto(
                        //       fontSize: 18,
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.w400),
                        // ),
                        underline: const SizedBox(),
                        value: catGender,
                        icon: Container(
                            width: 20,
                            height: 20,
                            child: const ImageIcon(
                              AssetImage('assets/images/gend.png'),
                            )),
                        elevation: 16,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Jannah',
                          fontSize: 20,
                        ),
                        isExpanded: true,
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            catGender = value as String?; //error
                          });
                        },
                      ),
                    ),
                   divider(),
                    const SizedBox(
                      height: 50,
                    ),
                    ConditionalBuilder(
                      condition: state is! CatUpdateLoadingState,
                      builder: (BuildContext context) => defaultButton(
                          text: 'Save',
                          onPressed: () async {
                            await cubit.updateCat(
                                name: catName.text,
                                gender: catGender,
                                year: catYear.toString(),
                                id: widget.catModel[widget.index].id
                                    .toString());
                          }),
                      fallback: (BuildContext context) => const Center(
                        child: CircularProgressIndicator(
                          color: defaultColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
