
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/components/constants.dart';
import 'package:meaw/components/local/shared_pref.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/cubit/animalStates.dart';
import 'package:meaw/getPosts/getPosts.dart';
import 'package:meaw/petProfileList/list.dart';
import 'package:meaw/screens/bottomNavScreen/chat/chatScreen.dart';
import 'package:meaw/screens/bottomNavScreen/products/productScreen.dart';
import 'package:meaw/screens/bottomNavScreen/services/servicesScreen.dart';
import 'package:meaw/screens/bottomNavScreen/translation/translationScreen.dart';
import 'package:meaw/screens/profileScreen/profileScreen.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/article.dart';
import 'package:meaw/screens/yourReports.dart';
import 'package:meaw/yousef/screen/add_product/add_product_screen.dart';
import 'package:meaw/yousef/screen/pages/Chat.dart';
import 'package:meaw/yousef/screen/products/products_screen.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreen = 0;

   List<Widget> itemsScreens = [
      TranslationScreen(),
      ServicesScreen( ),
      ProductsScreen(),
     Chat(),
   ];
  List<Widget> items2Screens = [
    TranslationScreen(),
    AddProduct( ),
    GetPosts(),
    YourReports(),
  ];
  @override
  Widget build(BuildContext context) {
    //print('photo ${CatCubit.get(context).userData?.profileImage}');
    return Builder(
      builder: (context){
        if(CatCubit.get(context).userData == null)
          {
            CatCubit.get(context).getMyData();
          }
        return BlocConsumer<CatCubit,CatStates>(
          listener: (context,state){},
          builder: (context,state){
            return
              //userType==null?
              Scaffold(
              backgroundColor: Colors.white,

              bottomNavigationBar: BottomNavigationBar(
                elevation: 8.0,
                items:  [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.mic_none),
                    label: 'Translate',
                  ),
                  //t3deeeeeeel
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/services.png')),
                    label:
                    //'Services',
                     userType==3? 'Services':'Add',
                  ),
                  //t3deeeeeeel
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/products.png')),
                    label:
                    //'Products',
                    userType==3? 'Products':'Posts',
                  ),

                  BottomNavigationBarItem(
                    icon:userType==3? ImageIcon(AssetImage('assets/images/chat.png')):Image.asset("assets/images/download.png",width: 25.w),
                    label:userType==3? 'Chat':'Reports',
                  ),

                ],
                onTap: (index){
                  setState(() {
                    currentScreen = index;
                    print('index');
                    print(index);
                  });
                },
                currentIndex: currentScreen,
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.grey,
                selectedItemColor: defaultColor,
              ),
              body:
              //itemsScreens[currentScreen],
              userType==3?itemsScreens[currentScreen]:items2Screens[currentScreen],
            )
            // :
            // Center(
            //   child: CircularProgressIndicator(
            //     color: defaultColor,
            //   ),
            // )
            ;
          },
        );
      },
    );
  }
}
