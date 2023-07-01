import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/core/components/local/shared_pref.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/getPosts/getCubit/getCubit.dart';
import 'package:meaw/petProfileList/petProfileListCubit/cubit.dart';
import 'package:meaw/screens/bottomNavScreen/translation/translate/cubit/cubit.dart';
import 'package:meaw/screens/bottomNavScreen/translation/translate/dio.dart';
import 'package:meaw/screens/loginScreen/cubit/cubit.dart';
import 'package:meaw/screens/servicesScreens/diseaseScreen/cubit/cubit.dart';
import 'package:meaw/screens/splashScreen/splashScreen.dart';
import 'package:meaw/screens/userReport/cubit/reportCubit.dart';

import 'package:meaw/screen/shelter/filterCubit/filterCunbit.dart';
import 'package:meaw/utilis/theme.dart';
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await Firebase.initializeApp(

   // options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  print('uid${uId}');
  // userType=CacheHelper.getData(key: 'userType');
  print('usertype${userType}');
 // print('idddd'+uId!);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=> CatCubit()
          // ..getCatData()
        ),
        BlocProvider(create:(BuildContext context)=>LoginCubit()..checkLogin()

        ),
        BlocProvider(create: (BuildContext context)=> PetProfileListCubit()
        ),
        BlocProvider(create: (BuildContext context)=> ArticleCubit()
        ),
        BlocProvider(create: (BuildContext context)=> GetCubit()..getUsersIDs()..getIDs()
        ),
        BlocProvider(create: (BuildContext context)=> FilterCubit()
        ),
        BlocProvider(create: (BuildContext context)=> TranslateCubit()
        ),
        BlocProvider(create: (BuildContext context)=> ReportCubit()
        ),
      ],
      child:ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context,screenUtil){
          return  MaterialApp(
          theme:theme(

          ),
          debugShowCheckedModeBanner: false,

          home: SplashScreen()
          // Scaffold(body: HomeScreen())
          // Ath()
          ,
          );
        },
      ),
    );
  }
}

