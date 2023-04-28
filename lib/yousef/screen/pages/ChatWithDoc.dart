import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/yousef/screen/pages/services/ChatBuble_1.dart';
import 'package:meaw/yousef/screen/pages/services/ChatBuble_2.dart';
import 'package:meaw/yousef/screen/pages/services/constants.dart';



class ChatWithDoc extends StatelessWidget {
  const ChatWithDoc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Dr- Mohamed',
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
            preferredSize: Size.zero,
            child: SizedBox(
                width: 248.w,
                child: const Text(
                  'last seen recently',
                  style: TextStyle(color: Colors.black),
                ))),
        backgroundColor: Colors.transparent,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        actions: [
          const Icon(Icons.phone),
          SizedBox(
            width: 33.w,
          ),
          const Icon(Icons.more_vert),
          SizedBox(
            width: 16.w,
          )
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            height: 520.h,
            margin: const EdgeInsets.only(left: 16, top: 45),
            child: ListView(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/img_5.png'),
                        const Text(
                          '14:00',
                          style: TextStyle(color: KChatTime),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    ChatBuble(
                      text:
                          'Lorem Ipsum is simply dummy text of\n the printing and types',
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(),
                        flex: 4,
                      ),
                      Column(
                        children: [
                          ChatBuble_2(
                            text: 'five centuries, but',
                            top: 50,
                            vertical: 14,
                            width: 220.w,
                          ),
                          ChatBuble_2(
                            text: 'text of the printing and',
                            top: 5,
                            vertical: 9,
                            right: 0.1,
                            width: 200.w,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/images/img_6.png'),
                          const Text(
                            '14:12',
                            style: TextStyle(color: KChatTime),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/images/img_5.png'),
                          const Text(
                            '14:20',
                            style: TextStyle(color: KChatTime),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      ChatBuble(text: 'five centuries, but')
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    ChatBuble_2(
                        text: 'text of the printing and',
                        top: 50,
                        vertical: 14),
                    Column(
                      children: [
                        Image.asset('assets/images/img_6.png'),
                        const Text(
                          '14:23',
                          style: TextStyle(color: KChatTime),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/images/img_5.png'),
                          const Text(
                            '14:20',
                            style: TextStyle(color: KChatTime),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        children: [
                          SizedBox(
                              width: 250.w,
                              child: ChatBuble(
                                text: 'Ok I have understood',
                                top: 80,
                                width: 50.w,
                              )),
                          ChatBuble(
                              top: 5,
                              text:
                                  'Lorem Ipsum is simply dummy text of\n the printing and types')
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(
                  width: 305.w,
                  height: 45.h,
                  child: TextFormField(
                    showCursor: false,
                    //cursorColor: Colors.black,
                    decoration: InputDecoration(
                      prefixIconColor: Colors.black,
                      prefixIcon: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: Color(0xff8E837D),
                        size: 35,
                      ),
                      suffix: Container(
                          margin: const EdgeInsets.only(top: 22),
                          child: Image.asset('assets/images/paper_clip.png')),
                      suffixIcon: const Icon(
                        Icons.camera_alt,
                        color: Color(0xff8E837D),
                      ),
                      hintText: 'type your message',
                      hintStyle: const TextStyle(color: Color(0xff787676)),
                      filled: true,
                      fillColor: const Color(0xffF1F0F0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffF1F0F0)),
                          borderRadius: BorderRadius.circular(4)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffF1F0F0)),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                ),
                const CircleAvatar(
                  backgroundColor: KColorPrimary,
                  radius: 15,
                  child: Icon(
                    Icons.keyboard_voice_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
