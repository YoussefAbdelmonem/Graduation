
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Chat.dart';
import 'Products.dart';
import 'Services.dart';
import 'Translate.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  List<Map> imgTime = [
    {'img': 'assets/images/chat/Frame (1).png', 'time': '09:00 AM'},
    {'img': 'assets/images/chat/Frame.png', 'time': '11:45 AM'},
    {'img': 'assets/images/chat/Frame (1).png', 'time': '12:30 AM'},
    {'img':'assets/images/chat/image 2.png','time':'02:00 PM'},
    // {'img':'assets/images/bottle.png','time':'03:00 PM'},
    // {'img':'assets/images/food.png','time':'06:00 PM'}
  ];
  List text=['Breakfast','Vet appointment','Walk','Lunch','Take medication','Dinner'];



  int selected_index = 2;
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Schedule',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26.sp,
            ),
          ),
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white),

          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 27, right: 26),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TableCalendar(
                    daysOfWeekStyle: DaysOfWeekStyle(
                      dowTextFormatter: (date, locale) =>
                      DateFormat.E(locale).format(date)[0],
                      weekdayStyle: TextStyle(fontSize: 16.sp),
                      weekendStyle: TextStyle(fontSize: 16.sp),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                              BorderSide(color: Colors.black, width: 1.3))),
                    ),
                    daysOfWeekHeight: 35,
                    locale: "en_US",
                    rowHeight: 35.h,
                    headerStyle: HeaderStyle(
                        headerMargin: const EdgeInsets.only(bottom: 22),
                        leftChevronVisible: false,
                        rightChevronMargin: const EdgeInsets.only(right: 200),
                        rightChevronVisible: false,
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                            color: KColorPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold)),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    onDaySelected: _onDaySelected,
                    calendarStyle: const CalendarStyle(
                        outsideDaysVisible: false,
                        selectedDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xffE08F62), Color(0xff9DAB86)]),
                            shape: BoxShape.circle),
                        todayDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xffE08F62), Color(0xff9DAB86)]),
                            shape: BoxShape.circle)),
                    focusedDay: today,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14)),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: KColorPrimary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4))),
                          padding: const EdgeInsets.all(10),
                          child: Center(
                              child: Text(
                                today.toString().split(" ")[0],
                                style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                              )),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: KColorPrimary,
                                ),
                                left: BorderSide(width: 1, color: KColorPrimary),
                              )),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                    padding: EdgeInsets.only(top: 75, left: 12),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        ...List.generate(
                                          imgTime.length,
                                              (index) => Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      imgTime[index]['img']),
                                                  SizedBox(
                                                    width: 18.w,
                                                  ),
                                                  Text(
                                                    imgTime[index]['time'],
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: KColorPrimary),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 55.h,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                      padding:
                                      EdgeInsets.only(top: 75, left: 18),
                                      color: const Color(0xffE08F62),
                                      child: Column(
                                        children: [
                                          ...List.generate(
                                            imgTime.length,
                                                (index) => Align(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    text[index],
                                                    style: TextStyle(
                                                        fontSize: 19.sp,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 53.h,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}

