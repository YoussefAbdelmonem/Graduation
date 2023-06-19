import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/screens/profileScreen/profileScreen.dart';
import 'package:meaw/userReport/cubit/reportCubit.dart';
import 'package:meaw/userReport/cubit/reportStates.dart';
import 'package:meaw/userReport/repotModel.dart';
import 'package:meaw/yousef/utilis/urilis.dart';
class YourReports extends StatefulWidget {
  const YourReports({Key? key}) : super(key: key);

  @override
  State<YourReports> createState() => _YourReportsState();
}

class _YourReportsState extends State<YourReports> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportCubit, ReportStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                   child: Row(
                      children: [
                        Utils.backWidget(context),
                        Spacer(),
                        Text(
                          'Your Reports',
                          style: GoogleFonts.roboto(
                              fontSize: 26.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),

                      ],
                    ),),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //   child: appBaar(
                    //       context: context,
                    //       label: 'Your reports',
                    //       screen: ProfileScreen(),
                    //       width: 80.0),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream:
                              ReportCubit.get(context).getReports(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<ReportModel> reportsModel = [];
                                  for (var doc in snapshot.data!.docs) {
                                    var data =
                                    doc.data() as Map<String, dynamic>;
                                    reportsModel.add(ReportModel(
                                        type : data['type'],
                                        phone : data['phone'],
                                        city : data['city'],
                                        addressDetails : data['addressDetails'],
                                        email : data['email'],
                                    )
                                    );
                                  }

                                  return  Padding(
                                    padding: const EdgeInsets.only(top: 30.0,left: 15,right: 15),
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        itemBuilder:(context,index)=>buildPost(reportsModel,index),
                                        separatorBuilder:(context,index)=>SizedBox(
                                          height: 12,
                                        ) ,
                                        itemCount: reportsModel.length
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: defaultColor,
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

          );
        }
    );
  }
  Widget buildPost(List<ReportModel> list, int index)=>Container(
    padding: EdgeInsets.only(left: 15,right: 15,top: 25),
    width: double.infinity,
    height: 160,
    decoration: BoxDecoration(
        border:Border.all(color: Color.fromRGBO(163,86,56,1)),
        borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Type : ${list[index].type}',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 20
        ),),
        SizedBox(height: 5,),
        Text('City : ${list[index].city}',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 20
        ),),
        Text('Address Details : ${list[index].addressDetails}',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 20
        ),),
        Text('Phone : ${list[index].phone}',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 20
        ),),

      ],
    ),
  );
  }

