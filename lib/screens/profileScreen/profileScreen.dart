import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/core/components/local/shared_pref.dart';
import 'package:meaw/core/widgets/text_widget.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/cubit/animalStates.dart';
import 'package:meaw/getPosts/getPosts.dart';
import 'package:meaw/petProfileList/list.dart';
import 'package:meaw/screen/favorites/favorites_screen.dart';
import 'package:meaw/screens/homeScreen/HomeScreen.dart';
import 'package:meaw/screens/loginScreen/loginScreen.dart';
import 'package:meaw/screens/profileScreen/updateProfile/updateProfile.dart';
import 'package:meaw/screens/userReport/Report.dart';
import 'package:meaw/screens/yourReports.dart';
import 'package:meaw/screen/add_product/add_product_screen.dart';
import 'package:meaw/screen/notifications/notifications_screen.dart';
import 'package:meaw/screen/shelter/shelter_screen.dart';

import '../../screen/pages/Schedule.dart';
import '../../screen/pages/help.dart';
import '../../utilis/urilis.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatCubit, CatStates>(
      listener: (context, state) {
        if (state is CatSignOutSuccessfully) {
          CacheHelper.removeData(key: 'uId');
          navigateAndFinish(context, LoginScreen());
        }
      },
      builder: (context, state) {
        var userData = CatCubit.get(context).userData;
        var profileImage = CatCubit.get(context).profileImage;
        var cubit = CatCubit.get(context);
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;
        return BlocConsumer<CatCubit, CatStates>(
          listener: (context, state) {
            if(state is CatGetUserSuccessState)
            {
              showToast(
                  message: 'User Updated',
                  state: ToastStates.success
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,right:24.0,top: 24.0 ),
                        child: Column(
                          children: [
                            // const SizedBox(height: 60,),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    navigateTo(context, HomeScreen());
                                  },
                                  child: Image(
                                      image: AssetImage('assets/images/arrowleft.png')),
                                ),
                                Spacer(),
                                Text(
                                  'My Profile',
                                  style: GoogleFonts.roboto(
                                      fontSize: 26.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),

                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 65,
                                      backgroundImage: profileImage == null
                                          ? NetworkImage(
                                              '${userData!.profileImage}')
                                          : FileImage(profileImage)
                                              as ImageProvider,
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        left: MediaQuery.of(context).size.width *
                                            0.22,
                                        child: CircleAvatar(
                                          radius: 23,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 23,
                                            child: IconButton(
                                              onPressed: () {
                                                cubit.getProfileImage();
                                              },
                                              icon: const Image(
                                                image: AssetImage(
                                                    'assets/images/Group-4.png'),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(

                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${userData!.name}',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 24.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.4,
                                        child: TextWidget(
                                          title: '${userData.email}',
                                          color: Colors.grey,
                                          maxLines: 1,
                                          fontSize: 20.sp,
                                        ),
                                      )
                                      // TextButton(
                                      //     child:Text('LogOut') ,
                                      //     onPressed: (){
                                      //       CatCubit.get(context).signOut();
                                      //     }
                                      // ),
                                      ,SizedBox(
                                        height: 10,
                                      ),

                                      Container(
                                        width: 120,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: defaultColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            navigateTo(context,UpdateProfile());
                                          },
                                          child: Text(
                                            'Edit Profile',
                                            style: GoogleFonts.roboto(
                                                fontSize: 17,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: .6 * height,
                          child:
                           userType==3?
                         SingleChildScrollView(
                          child: Column(
                              children: [
                                listTile(
                                  function:(){
                                    navigateTo(context,ListScreen());
                                  },
                                    image: 'assets/images/house.png',
                                    icon: 'assets/images/Vector.png',
                                    label: 'Pet Profile'),
                                listTile(
                                  function: (){
                                    navigateTo(context, FavoritesScreen());
                                  },
                                    image: 'assets/images/love.png',
                                    icon: 'assets/images/Vector.png',
                                    label: 'Favourites'),
                                listTile(
                                  function:(){
                                    navigateTo(context, NotificationScreen());
                                  },
                                    image: 'assets/images/notification.png',
                                    icon: 'assets/images/Vector.png',
                                    label: 'Notifications'),
                                listTile(
                                    image: 'assets/images/schedule.png',
                                    function: (){

                                      Utils.openScreen(context, Schedule());

                                    },
                                    icon: 'assets/images/Vector.png',
                                    label: 'Schedule'),
                                listTile(
                                    image: 'assets/images/report.png',
                                    function: (){
                                      Utils.openScreen(context, ReportScreen());
                                    },
                                    icon: 'assets/images/Vector.png',
                                    label: 'Report'),

                                listTile(
                                  function: (){
                                    navigateTo(context,ShelterScreen());
                                  },
                                    image: 'assets/images/hospital.png',
                                    icon: 'assets/images/Vector.png',
                                    label: 'Shelter'),
                                listTile(
                                    image: 'assets/images/setting2.png',
                                    icon: 'assets/images/Vector.png',
                                    function: (){

                                     // Utils.openScreen(context, SettingScreen());

                                    },
                                    label: 'Setting'),
                                listTile(
                                    image: 'assets/images/messagequestion.png',
                                    function: (){

                                      Utils.openScreen(context, HelpScreen());

                                    },
                                    icon: 'assets/images/Vector.png',
                                    label: 'Help')
                              ],
                            ),
                        )
                          :Column(
                            children: [
                              listTile(
                                  function:(){
                                    navigateTo(context,AddProduct());
                                  },
                                  image: 'assets/images/🦆 emoji _heavy plus sign_.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Add post'),
                              listTile(
                                  function:(){
                                    navigateTo(context,GetPosts());
                                  },
                                  image: 'assets/images/house.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Your posts'),
                              listTile(
                                function: (){
                                  navigateTo(context, YourReports());
                                },
                                  image: 'assets/images/report.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Reports'),
                              listTile(
                                function: (){
                                 // navigateTo(context, SettingScreen());
                                },
                                  image: 'assets/images/setting2.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Setting'),
                              listTile(
                                function: (){
                                  navigateTo(context, HelpScreen());
                                },
                                  image: 'assets/images/messagequestion.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Help')
                            ],
                          )

                      ),
                      myDividerLong(),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0,),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/images/logout.png'),
                              height: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            TextButton(
                                onPressed: () {
                                  if(CacheHelper.getData(key: 'uId') != null){
                                    CacheHelper.removeData(key: 'uId');
                                  }
                                  if(CacheHelper.getData(key: 'userType') != null){
                                    CacheHelper.removeData(key: 'userType');
                                  }
                                  uId=null;
                                  userType=null;
                                  if(CacheHelper.getData(key: 'email') != null){
                                    CacheHelper.removeData(key: 'email');
                                  }
                                  if(CacheHelper.getData(key: 'password') != null){
                                    CacheHelper.removeData(key: 'password');
                                  }
                                  CatCubit.get(context).signOut();
                                },
                                child: Text(
                                  'Log Out',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      color: defaultColor,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
