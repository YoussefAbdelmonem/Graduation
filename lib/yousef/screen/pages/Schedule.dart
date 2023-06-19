import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/screens/profileScreen/profileScreen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../components/constants.dart';


class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {


  int selected_index=2;
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
          padding:  EdgeInsets.only(left: 27.r, right: 26.r),
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
                        Container(decoration: const BoxDecoration(border: Border(right: BorderSide(width: 1,color: KColorPrimary,),left: BorderSide(width: 1,color: KColorPrimary),)),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(padding: EdgeInsets.only(top: 75,left: 12),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        ...List.generate(
                                            1,
                                            (index) => Column(
                                              children: [
                                                Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/food.png',width: 60.w),
                                                        SizedBox(
                                                          width: 18.w,
                                                        ),
                                                         Text('09:00 AM',style: TextStyle(fontSize: 18.sp,color: KColorPrimary),),
                                                      ],
                                                    ),SizedBox(height: 56.h,)
                                              ],
                                            ),)
                                      ],
                                    )),
                              ),
                              Flexible(
                                child: Align(alignment: Alignment.topLeft,
                                  child: Container(padding: EdgeInsets.only(top: 75,left: 18),
                                      color: const Color(0xffE08F62), child: Column(children: [  ...List.generate(
                                    1,
                                        (index) => Align(alignment: Alignment.topLeft,
                                          child: Column(
                                      children: [
                                           Text('Breakfast',style: TextStyle(fontSize: 19.sp,color: Colors.white),),SizedBox(height: 56.h,)
                                      ],
                                    ),
                                        ),)],)),
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
