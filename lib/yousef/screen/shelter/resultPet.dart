import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/getPosts/getCubit/model.dart';
import 'package:meaw/yousef/constant/colors.dart';
import 'package:meaw/yousef/screen/pages/OrderSummary.dart';
import 'package:meaw/yousef/screen/pages/PetDetails.dart';
import 'package:meaw/yousef/screen/shelter/shelter_screen.dart';
import 'package:meaw/yousef/widgets/text_widget.dart';
class ResultPetScreen extends StatefulWidget {
  ResultPetScreen({required this .petModel}) : super();
  List<PostModel> petModel;
  @override
  State<ResultPetScreen> createState() => _ResultPetScreenState();
}

class _ResultPetScreenState extends State<ResultPetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 50.h,
          ),
          appBaar(
              context: context,
              screen: ShelterScreen(),
              label:'Pets' ,
              width: 135.h
          ),
          SizedBox(
            height: 30.h,
          ),
          // ListView.separated(
          //     shrinkWrap: true,
          //     physics: BouncingScrollPhysics(),
          //     itemBuilder: (context,index)=> buildContainer(index,widget.petModel),
          //     separatorBuilder: (context,index)=>SizedBox(
          //       height: 15,
          //     ),
          //     itemCount: widget.petModel.length
          // )
          GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: widget.petModel.length,
              itemBuilder: (context, index) {
                return buildContainer(index,widget.petModel) ;
              })
        ],
      ),
    );
  }
  Widget buildContainer(int index,List<PostModel> petModel){
    return Card(
      child: InkWell(
        onTap: (){
          navigateTo(context,PetDetails(petModel: petModel[index],));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  "${petModel[index].image}",
                  height: 110,
                  width: 160,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    right: 8,
                    top: 2,
                    child: Image.asset(
                      "assets/images/heart.png",scale: 2,
                    ),),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.0.w),
              child: Row(
                children: [
                  TextWidget(
                    title: "${petModel[index].name}",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  SizedBox(
                    width: 100.w,
                  ),
                  TextWidget(
                    title: "${petModel[index].gender}",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Colors.pink,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding:  EdgeInsets.all(3.0.w),
              child: Row(
                children: [
                  TextWidget(
                    title: "${petModel[index].price} \$",
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                  SizedBox(width: 88.w),
                  TextWidget(
                    title: "${petModel[index].age}Months",
                    color: blackColor,
                    fontSize: 14.sp,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
          ],
        ),
      ),
    );
  }
}