import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/components/local/shared_pref.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/cubit/animalStates.dart';
import 'package:meaw/favorites/favorites_screen.dart';
import 'package:meaw/petProfileList/list.dart';
import 'package:meaw/screens/homeScreen/HomeScreen.dart';
import 'package:meaw/screens/loginScreen/loginScreen.dart';
import 'package:meaw/screens/profileScreen/updateProfile/updateProfile.dart';
import 'package:meaw/style/icon_broken.dart';
import 'package:meaw/yousef/data/maps/repo/maps_repo.dart';
import 'package:meaw/yousef/data/maps/web_services/maps_web_servies.dart';
import 'package:meaw/yousef/screen/map/map_screen/cubit/map_cubit.dart';
import 'package:meaw/yousef/screen/map/map_screen/map_screen.dart';
import 'package:meaw/yousef/screen/notifications/notifications_screen.dart';
import 'package:meaw/yousef/screen/shelter/shelter_screen.dart';
import 'package:meaw/yousef/utilis/urilis.dart';

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
              // appBar: AppBar(
              //   centerTitle: true,
              //   title:  Text('My Profile',
              //     style: GoogleFonts.roboto(
              //         fontSize: 26,
              //         color:Colors.black,
              //         fontWeight: FontWeight.w500
              //     ),
              //   ),
              //   backgroundColor: Colors.white,
              //   leading: IconButton(
              //     onPressed: (){Navigator.pop(context);},
              //     icon: const Icon(IconBroken.Arrow___Left_2,color: defaultColor,),
              //   ),
              //   actions: [
              //     defaultTextButton(
              //       function: (){navigateTo(context, const AddCatScreen());},
              //       text: 'Add Cat'
              //     ),
              //   ],
              // ),
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
                                      image: AssetImage(
                                          'assets/images/arrowleft.png')),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  'My Profile',
                                  style: GoogleFonts.roboto(
                                      fontSize: 26,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
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
                                            0.25,
                                        child: CircleAvatar(
                                          radius: 21,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 21,
                                            child: IconButton(
                                              onPressed: () {
                                                cubit.getProfileImage();
                                              },
                                              icon: Image(
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
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      Text(
                                        '${userData!.email}',
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      // TextButton(
                                      //     child:Text('LogOut') ,
                                      //     onPressed: (){
                                      //       CatCubit.get(context).signOut();
                                      //     }
                                      // ),
                                      SizedBox(
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
                        child: SingleChildScrollView(
                          child:userData.userType==2||userData.userType==3?
                          Column(
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
                                  image: 'assets/images/heart.png',
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
                                  icon: 'assets/images/Vector.png',
                                  label: 'Schedule'),
                              listTile(
                                  image: 'assets/images/report.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Report'),
                              listTile(
                                  image: 'assets/images/global.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Language'),
                              listTile(
                                function: (){
                                  Utils.openScreen(context, BlocProvider(
                                      create: (BuildContext context)=>MapsCubit(MapsRepository(PlacesWebservices())),
                                      child: const MapScreen()));

                                },
                                  image: 'assets/images/location.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Location'),
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
                                  label: 'Setting'),
                              listTile(
                                  image: 'assets/images/messagequestion.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Help')
                            ],
                          ):
                          Column(
                            children: [
                              listTile(
                                  function:(){
                                 //   navigateTo(context,ListScreen());
                                  },
                                  image: 'assets/images/🦆 emoji _heavy plus sign_.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Add post'),
                              listTile(
                                  function:(){
                                   // navigateTo(context,ListScreen());
                                  },
                                  image: 'assets/images/house.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Your posts'),
                              listTile(
                                  image: 'assets/images/global.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Language'),
                              listTile(
                                  image: 'assets/images/setting2.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Setting'),
                              listTile(
                                  image: 'assets/images/messagequestion.png',
                                  icon: 'assets/images/Vector.png',
                                  label: 'Help')
                            ],
                          )
                        ),
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
