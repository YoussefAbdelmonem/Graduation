
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/screen/pages/services/ChatCall.dart';
import 'package:meaw/yousef/screen/pages/services/chatDoctors.dart';
import 'package:meaw/yousef/screen/pages/services/constants.dart';

import 'Products.dart';
import 'Services.dart';
import 'Translate.dart';


class Chat extends StatefulWidget {


  Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
int selected_index=3;
_onTap(int index) {
  final List<Widget> _children = [
    Translate(),
    Services(),
    Products(),
    Chat(),
  ];
  Navigator.of(context)
      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
    return _children[selected_index];
  }));
}

  List<ChatDoctors> listOfDoctors = [
    ChatDoctors(

        img: 'assets/images/img_1.png',
        trailing: '12:00',
        subtext: 'What is the problem?',
        text: 'Dr. Mohammed'),
    ChatDoctors(
        img: 'assets/images/img_2.png',
        trailing: '12:00',
        subtext: 'The cat needs care',
        text: 'Dr. Salwa'),
    ChatDoctors(
        img: 'assets/images/img_3.png',
        trailing: '06:00',
        subtext: 'The cat is in good condition',
        text: 'Dr. Nader'),
    ChatDoctors(
        img: 'assets/images/img_4.png',
        trailing: '11:00',
        subtext: 'Thanks for your help',
        text: 'Dr. Ali'),
  /*  ChatDoctors(
        img: 'assets/images/img_1.png',
        trailing: '11:30',
        subtext: 'The cat is in bad condition ',
        text: 'Dr. Mohammed'),
    ChatDoctors(
        img: 'assets/images/img_3.png',
        trailing: '10:20',
        subtext: 'Thanks a lot ',
        text: 'Dr. Nader'),*/
    ChatDoctors(
        img: 'assets/images/img_2.png',
        trailing: '10:00',
        subtext: 'Ok',
        text: 'Dr. Salwa'),
  ];

  List listOfCalls = [
    {
      'img': 'assets/images/img_1.png',
      'text': 'Dr. Mohammed',
      'icon': Stack(children: [
        Container(
            margin: const EdgeInsets.only(top: 3, right: 5),
            child: Image.asset('assets/images/greenPhone.png')),
        Container(
          margin: const EdgeInsets.only(left: 8),
          child: Image.asset('assets/images/greenArrow.png'),
        ),
      ]),
      'subText': 'incoming . Monday'
    },
    {
      'img': 'assets/images/img_2.png',
      'text': 'Dr. Salwa',
      'icon': Stack(children: [
        Container(
            margin: const EdgeInsets.only(top: 3, right: 5),
            child: Image.asset('assets/images/redPhone.png')),
        Container(
          margin: const EdgeInsets.only(left: 8, top: 6),
          child: Image.asset('assets/images/wrong.png'),
        ),
      ]),
      'subText': 'Missed . saturday'
    },
    {
      'img': 'assets/images/img_3.png',
      'text': 'Dr. Nader',
      'icon': Stack(children: [
        Container(
            margin: const EdgeInsets.only(top: 3, right: 5),
            child: Image.asset('assets/images/greenPhone.png')),
        Container(
          margin: const EdgeInsets.only(left: 8, top: 4),
          child: Image.asset('assets/images/greenOutLog.png'),
        ),
      ]),
      'subText': 'Outgoing . Friday'
    },
    {
      'img': 'assets/images/img_4.png',
      'text': 'Dr. Ali',
      'icon': Stack(children: [
        Container(
            margin: const EdgeInsets.only(top: 3, right: 5),
            child: Image.asset('assets/images/greenPhone.png')),
        Container(
          margin: const EdgeInsets.only(left: 8),
          child: Image.asset('assets/images/greenArrow.png'),
        ),
      ]),
      'subText': 'incoming . Monday'
    },
    /*{
      'img': 'assets/images/img_1.png',
      'text': 'Dr. Mohammed',
      'icon': Stack(children: [
        Container(
            margin: const EdgeInsets.only(top: 3, right: 5),
            child: Image.asset('assets/images/greenPhone.png')),
        Container(
          margin: const EdgeInsets.only(left: 8),
          child: Image.asset('assets/images/greenArrow.png'),
        ),
      ]),
      'subText': 'incoming . Monday'
    },*/
   /* {
      'img': 'assets/images/img_3.png',
      'text': 'Dr. Nader',
      'icon': Stack(children: [
        Container(
            margin: const EdgeInsets.only(top: 3, right: 5),
            child: Image.asset('assets/images/greenPhone.png')),
        Container(
          margin: const EdgeInsets.only(left: 8, top: 4),
          child: Image.asset('assets/images/greenOutLog.png'),
        ),
      ]),
      'subText': 'Outgoing . Sunday'
    },*/
    {
      'img': 'assets/images/img_2.png',
      'text': 'Dr. Salwa',
      'icon': Stack(children: [
        Container(
            margin: const EdgeInsets.only(top: 3, right: 5),
            child: Image.asset('assets/images/redPhone.png')),
        Container(
          margin: const EdgeInsets.only(left: 8, top: 6),
          child: Image.asset('assets/images/wrong.png'),
        ),
      ]),
      'subText': 'Missed . saturday'
    }
  ];

  ///Tabs

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor:KColorPrimary),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80.h),
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: TabBar(
                  labelPadding: const EdgeInsets.all(5),
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Text(
                      'Doctor',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Text(
                      'Community',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Text(
                      'Calls',
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ]),
            ),
          ),
          backgroundColor: KColorPrimary,
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 16, top: 15),
                child: const Icon(
                  Icons.search_outlined,
                  size: 22,
                ))
          ],
        ),

        ///TabBarView
        body: TabBarView(
          children: [
            Container(
                color: Colors.white,
                child: ListView.separated(
                  itemBuilder: (context, i) {
                    return ChatDoctors(
                      img: listOfDoctors[i].img,
                      text: listOfDoctors[i].text,
                      subtext: listOfDoctors[i].subtext,
                      trailing: listOfDoctors[i].trailing,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return  Divider(
                      height: 40.h,
                      thickness: 0.5,
                      color: KColorPrimary,
                    );
                  },
                  itemCount: listOfCalls.length,
                )),
            Container(
              alignment: Alignment.topLeft,
              color: Colors.white,
              child: Row(
                children: [
                  (Container(
                      margin: const EdgeInsets.all(20),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 12),
                            child: Image.asset('assets/images/img_3.png'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: Image.asset('assets/images/img_5.png'),
                          )
                        ],
                      ))),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: 179.w,
                          child:  Text(
                            'Cat care',
                            style: TextStyle(fontSize: 22.sp),
                          )),
                       SizedBox(
                        height: 10.h,
                      ),
                      const Text('How do I solve the problem?')
                    ],
                  )
                ],
              ),
            ),
            Container(
                color: Colors.white,
                child: ListView.separated(
                  itemBuilder: (context, i) {
                    return ChatBodyDoctor(
                        icon: listOfCalls[i]['icon'],
                        img: listOfCalls[i]['img'],
                        subtext: listOfCalls[i]['subText'],
                        text: listOfCalls[i]['text']);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return  Divider(
                      height: 40.h,
                      thickness: 0.5,
                      color: KColorPrimary,
                    );
                  },
                  itemCount: listOfCalls.length,
                ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(showUnselectedLabels: true,onTap: (index){setState(() {
          selected_index=index;_onTap(selected_index);
        });},currentIndex:selected_index,backgroundColor: Colors.white,unselectedItemColor: Colors.black,selectedItemColor: KColorPrimary,items: const [
          BottomNavigationBarItem(label: 'Translate',
              icon:ImageIcon(AssetImage('assets/images/translation_icon.png')) ),
          BottomNavigationBarItem(label: 'Services ',
            icon: ImageIcon(AssetImage('assets/images/servives_icon.png')),
          ),
          BottomNavigationBarItem(label: 'Products',
            icon:  ImageIcon(AssetImage('assets/images/products_icon.png')),
          ),
          BottomNavigationBarItem(label: 'Chat',
            icon:  ImageIcon(AssetImage('assets/images/chat_icon.png')),
          )
        ]),

      ),
    );
  }
}

