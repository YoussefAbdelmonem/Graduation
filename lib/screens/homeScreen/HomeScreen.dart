
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/components/local/shared_pref.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/cubit/animalStates.dart';
import 'package:meaw/petProfileList/list.dart';
import 'package:meaw/screens/bottomNavScreen/chat/chatScreen.dart';
import 'package:meaw/screens/bottomNavScreen/products/productScreen.dart';
import 'package:meaw/screens/bottomNavScreen/services/servicesScreen.dart';
import 'package:meaw/screens/bottomNavScreen/translation/translationScreen.dart';
import 'package:meaw/screens/profileScreen/profileScreen.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/article.dart';
import 'package:meaw/yousef/screen/products/products_screen.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreen = 0;

   List<Widget> itemsScreens = [
     const TranslationScreen(),
      ServicesScreen( ),
      ProductsScreen(),
     const ChatScreen(),
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
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                // leading: InkWell(
                //   onTap: (){
                //    // navigateTo(context, Article());
                //   },
                //     child: Image(image:AssetImage( 'assets/images/hambergermenu.png'))),
                backgroundColor: Colors.white,
                elevation: 0.0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
                    child: GestureDetector(
                      onTap: ()async{
                        await CatCubit().getDataaaaa();
                        navigateTo(context, const ProfileScreen());

                        //navigateTo(context, const ProfileScreen());
                      },
                      child:Container(
                        height: 80,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(80),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                           image:CatCubit.get(context).userData==null?NetworkImage('https://i.pinimg.com/564x/a1/d8/62/a1d862711ba51f2a19c6c0c4a891eb42.jpg'): NetworkImage('${CatCubit.get(context).userData?.profileImage}')
                          )
                        ),
                        // child:CatCubit.get(context).userData==null?
                        // CircleAvatar(backgroundImage:AssetImage('assets/images/profile.jpg',),
                        //   radius: 50,
                        // ):
                        // CircleAvatar(
                        //     radius: 50,
                        //     backgroundImage:NetworkImage( '${CatCubit.get(context).userData?.profileImage}')),
                      ),
                      // CircleAvatar(
                      //   radius: 25,
                      //   backgroundImage: NetworkImage('${CatCubit.get(context).userData?.profileImage}'),
                      // ),
                    ),
                  ),
                ],
              ),
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
                    label: 'Services',
                    // CatCubit.get(context).userData!.userType==2? 'Services':'Add',
                  ),
                  //t3deeeeeeel
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/products.png')),
                    label: 'Products',
                    // CatCubit.get(context).userData!.userType==2? 'Products':'Posts',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/chat.png')),
                    label: 'Chat',
                  ),
                ],
                onTap: (index){
                  setState(() {
                    currentScreen = index;
                    print(CacheHelper.getData(key: 'email'));
                  });
                },
                currentIndex: currentScreen,
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.grey,
                selectedItemColor: defaultColor,
              ),
              body: itemsScreens[currentScreen],
            );
          },
        );
      },
    );
  }
}
