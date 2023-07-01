import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meaw/core/components/chat_bubble.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/data/models/message_model.dart';
import 'package:meaw/utilis/urilis.dart';



class ChatPage extends StatelessWidget {
  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  static String id = 'chat';

  ChatPage({Key? key}) : super(key: key);
  CollectionReference message =
  FirebaseFirestore.instance.collection(KCollection);

  @override
  Widget build(BuildContext context) {
    var userData = CatCubit
        .get(context)
        .userData;

    var email = userData?.email;
    print('///////////////////////////////////');
    print(email);
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy(KCreatedAt, descending: true).snapshots(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            //print(snapShot.data!.docs[0]['message']);
            List<Message> listOfMessages = [];
            for (int i = 0; i < snapShot.data!.docs.length; i++) {
              listOfMessages.add(Message.JesonData(snapShot.data!.docs[i]));
            }
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: Container(
                    margin: const EdgeInsets.only(top: 7),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                        ))),
                iconTheme: const IconThemeData(color: Colors.black),
                title: Text(
                  'Dr- Mohamed',
                  style: TextStyle(color: Colors.black, fontSize: 24.sp),
                ),
                bottom: PreferredSize(
                    preferredSize: Size.zero,
                    child: SizedBox(
                      width: 213.w,
                      child: Text(
                        'last seen recently',
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                    )),
                backgroundColor: Colors.transparent,
                systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.white),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/images/call.svg")),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/images/dots.svg")),
                ],
                elevation: 0,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child: ListView.builder(
                          reverse: true,
                          controller: scrollController,
                          itemCount: listOfMessages.length,
                          itemBuilder: (context, i) {
                            return listOfMessages[i].id == email
                                ? Row(
                              children: [
                                Column(
                                  children: [
                                    // Image.asset(
                                    //     'assets/images/chat/human.png'),
                                    CircleAvatar(

                                      radius: 25.w,
                                      backgroundImage: NetworkImage(
                                          '${userData?.profileImage}'
                                      ),
                                    ),

                                    Text(
                                      DateFormat.Hm().format(DateTime
                                          .fromMillisecondsSinceEpoch(
                                          listOfMessages[i]
                                              .date
                                              .seconds *
                                              1000)),
                                      style: TextStyle(
                                          color: Color(0xffA7A7A7)),
                                    )
                                  ],
                                ),
                                ChatBubble(listOfMessages[i]),
                              ],
                            )
                                : Row(
                              children: [
                                Expanded(child: Container()),
                                ChatBubbleForFriend(listOfMessages[i]),
                                Column(
                                  children: [
                                    Image.asset(
                                        'assets/images/instructor5.png',width: 40.w),
                                    Text(
                                      DateFormat.Hm().format(DateTime
                                          .fromMillisecondsSinceEpoch(
                                          listOfMessages[i]
                                              .date
                                              .seconds *
                                              1000)),
                                      style: TextStyle(
                                          color: Color(0xffA7A7A7)),
                                    )
                                  ],
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 15),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: TextField(
                              showCursor: false,
                              controller: controller,
                              onSubmitted: (data) {
                                message.add({
                                  KMessageField: data,
                                  KCreatedAt: DateTime.now(),
                                  KId: email
                                });
                                controller.clear();
                                scrollController.animateTo(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              decoration: InputDecoration(
                                prefixIconColor: Colors.black,
                                // prefixIcon: SvgPicture.asset(
                                //     "assets/images/emoji.svg",
                                //
                                //
                                // ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      color: const Color(0xff8E837D),
                                      onPressed: () {},
                                      icon: const ImageIcon(AssetImage(
                                          'assets/images/chat/paper_clip.png')),
                                    ),
                                    IconButton(
                                      color: const Color(0xff8E837D),
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          "assets/images/camera.svg"),
                                    ),
                                  ],
                                ),
                                hintText: 'type your message',
                                hintStyle: TextStyle(
                                    fontSize: 12.sp, color: Color(0xff787676)),
                                filled: true,
                                fillColor: const Color(0xffF1F0F0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffF1F0F0)),
                                    borderRadius: BorderRadius.circular(4)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffF1F0F0)),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset("assets/images/microphone.svg"),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        });
  }
}
