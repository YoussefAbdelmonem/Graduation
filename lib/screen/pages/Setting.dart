import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/screens/profileScreen/profileScreen.dart';

import '../../../core/components/constants.dart';

class SettingScreen extends StatelessWidget {
  List<Map> setting = [
    {'img': 'assets/images/up.png', 'title': 'Language'},
    {'img': 'assets/images/up.png', 'title': 'About'},
    {'img': 'assets/images/edit/notification.png', 'title': 'Notifications'}
  ];
  SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Setting',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.sp,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
        leading: Container(
            margin: const EdgeInsets.only(top: 7).r,
            child: IconButton(
                onPressed: () {
                  navigateTo(context, ProfileScreen());
                },
                icon: const Icon(
                  Icons.arrow_back,
                ))),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10,top: 20),
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, i) => Column(
              children: [
                Card(
                      child: ListTile(onTap: (){},
                        leading: IconButton(
                            onPressed: () {},
                            icon:Image.asset(setting[i]['img']),color: KColorPrimary,),
                        title:Text(setting[i]['title'],style: TextStyle(fontSize: 18.sp),) ,
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const ImageIcon(
                                AssetImage('assets/images/setting2.png'),color: KColorPrimary,)),
                      ),
                    ),
                SizedBox(height: 15.h,)
              ],
            )),
      ),
    );
  }
}
