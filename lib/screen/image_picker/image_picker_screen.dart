
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/screen/image_picker/cubit/image_picker_cubit.dart';

import '../../core/constant/colors.dart';
import '../../utilis/urilis.dart';
import '../../core/widgets/button_widget.dart';
import '../../core/widgets/text_field.dart';
import '../../core/widgets/text_widget.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerCubit(),
      child: BlocConsumer<ImagePickerCubit, ImagePickerState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ImagePickerCubit cubit = BlocProvider.of(context);
          return SafeArea(
            child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Utils.backWidget(context),
                            SizedBox(
                              width: 60.w,
                            ),
                            TextWidget(
                              title: "الحساب الشخصي",
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: blackColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        /// the image picker
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  maxRadius: 45.w,
                                  minRadius: 30.w,
                                  backgroundColor: mainColor,
                                  child: cubit.profileImage != null
                                      ? Image.file(
                                    cubit.profileImage!,
                                    height: 80.h,
                                    width: 70.w,
                                    fit: BoxFit.contain,
                                    alignment: AlignmentDirectional.center,


                                  )
                                      : Image.asset(
                                    "assets/images/instructor5.png",
                                    fit: BoxFit.contain,
                                    height: 105.h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 1.h,
                                      top: 60.w,
                                      left: 18.w,
                                      right: 58.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      cubit.getProfileImage();
                                    },
                                    child:
                                    Image.asset("assets/images/camera.png"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        /// the Name from the profile
                        SizedBox(
                          height: 30.h,
                        ),
                        TextWidget(
                            title: "الاسم بالكامل",
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: greyText),
                        SizedBox(
                          height: 15.h,
                        ),
                        Card(
                          elevation: 0.3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFieldWidget(
                            onChanged: (String value) {},
                            hintText: "Youssef Abdelmonem",
                            type: TextInputType.text,
                          ),
                        ),

                        /// the email from the profile
                        SizedBox(
                          height: 15.h,
                        ),
                        TextWidget(
                            title: "البريد الإلكتروني",
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: greyText),
                        SizedBox(
                          height: 15.h,
                        ),
                        Card(
                          elevation: 0.3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFieldWidget(
                            onChanged: (String value) {},
                            hintText: "example20@gmail.com",
                            type: TextInputType.text,
                          ),
                        ),

                        /// the mobile phone from the profile
                        SizedBox(
                          height: 15.h,
                        ),
                        TextWidget(
                            title: "رقم الجوال",
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: greyText),
                        SizedBox(
                          height: 15.h,
                        ),
                        Card(
                          elevation: 0.3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFieldWidget(
                            onChanged: (String value) {},
                            hintText: "+966 565 9999 00",
                            type: TextInputType.phone,
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),

                        /// TODO CONDITIONAL BUILDER
                        ButtonWidget(
                          onTap: ()
                          {
                            cubit.updateProfileImage();
                          },
                          title: "حفظ",
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
