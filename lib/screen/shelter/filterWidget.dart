import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/getPosts/getCubit/getCubit.dart';
import 'package:meaw/getPosts/getCubit/model.dart';
import 'package:meaw/core/constant/colors.dart';
import 'package:meaw/screen/shelter/filterCubit/filterCunbit.dart';
import 'package:meaw/screen/shelter/filterCubit/filterCunbit.dart';
import 'package:meaw/screen/shelter/filterCubit/filterStates.dart';
import 'package:meaw/screen/shelter/resultPet.dart';
import 'package:meaw/screen/shelter/shelter_screen.dart';
import 'package:meaw/utilis/urilis.dart';
class BuildFilter extends StatefulWidget {
  BuildFilter({required this.postModelsList}) : super();
  List<PostModel> postModelsList;

  @override
  State<BuildFilter> createState() => _BuildFilterState();
}

class _BuildFilterState extends State<BuildFilter> {
  var controller=ScrollController();
  bool ischecked = false;
  List<PostModel> petModelResultfinal = [];
  List range(){
    List resultRange=[];
    for(var i=FilterCubit.get(context).values.start.toInt();i<=FilterCubit.get(context).values.end.toInt();i++){

      resultRange.add(i);
    }
    return resultRange;
  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<FilterCubit,FilterStates>(
      listener: (context,state){},
      builder: (context,state){
        return Container(
          // width: MediaQuery.of(context).size.width*0.8,
          // height: MediaQuery.of(context).size.height*0.7,
        //  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.1),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0,right: 10,top: 20,bottom: 10),
            child: ListView(
               shrinkWrap: true,
                 physics: BouncingScrollPhysics(),
                 controller:controller ,
                children: [
                  16.ph,
                  Row(
                    children: [
                      Text('Filters',style: TextStyle(
                          fontWeight: FontWeight.w500,
                        fontSize: 20
                      ),),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          navigateTo(context, ShelterScreen());
                        },
                          child: Icon(Icons.close,color: Colors.black,))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('filter pets with more specific types',style: TextStyle(
                    color: Colors.grey
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Category',style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17
                  ),),
                  Row(
                    children: [
                      Text('Cat',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17
                      ),),
                      Spacer(),
                      Checkbox(
                          activeColor: defaultColor,
                          value:FilterCubit.get(context).ischeckedCat ,
                          onChanged:(newbool)
                          {
                            // setState(() {
                            //   ischecked=newbool!;
                            // });
                            FilterCubit.get(context).onChangeCheckCat(newbool!);
                            if(FilterCubit.get(context).ischeckedCat==true) {
                              FilterCubit
                                  .get(context)
                                  .category = "cat";
                            }
                            else
                            {
                              FilterCubit.get(context).category='';
                            }
                          }
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Dog',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17
                      ),),
                      Spacer(),
                      Checkbox(
                          activeColor: defaultColor,
                          value:FilterCubit.get(context).ischeckedDog ,
                          onChanged:(newbool)
                          {
                            // setState(() {
                            //   ischecked=newbool!;
                            // });
                            FilterCubit.get(context).onChangeCheckDog(newbool!);
                            if(FilterCubit.get(context).ischeckedDog==true) {
                              FilterCubit
                                  .get(context)
                                  .category = "dog";
                            }
                            else {
                              FilterCubit
                                  .get(context)
                                  .category = '';
                            }
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 4,),
                  myDividerFilter(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Gender',style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17
                  ),),
                  Row(
                    children: [
                      Text('Male',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17
                      ),),
                      Spacer(),
                      Checkbox(
                          activeColor: defaultColor,
                          value:FilterCubit.get(context).ischeckedMale ,
                          onChanged:(newbool)
                          {
                            // setState(() {
                            //   ischecked=newbool!;
                            // });
                            FilterCubit.get(context).onChangeCheckMale(newbool!);
                            if(FilterCubit.get(context).ischeckedMale==true) {
                              FilterCubit
                                  .get(context)
                                  .gender = "Male";
                            }
                            else
                            {
                              FilterCubit.get(context).gender='';
                            }
                          }
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Female',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17
                      ),),
                      Spacer(),
                      Checkbox(
                          activeColor: defaultColor,
                          value:FilterCubit.get(context).ischeckedFemale ,
                          onChanged:(newbool)
                          {
                            // setState(() {
                            //   ischecked=newbool!;
                            // });
                            FilterCubit.get(context).onChangeCheckFemale(newbool!);
                            if(FilterCubit.get(context).ischeckedFemale==true) {
                              FilterCubit
                                  .get(context)
                                  .gender = "Female";
                            }
                            else {
                              FilterCubit
                                  .get(context)
                                  .gender = '';
                            }
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 4,),
                  myDividerFilter(),
                  SizedBox(height: 20,),
                  Text('Age',style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17
                  ),),
                  SizedBox(height: 15,),
                  RangeSlider(
                      values: FilterCubit.get(context).values,
                      divisions: 9,
                      min: 1,
                      max: 10,
                      labels: FilterCubit.get(context).labels,
                      activeColor: mainColor,
                      onChanged:(newvalues){
                    FilterCubit.get(context).onChangeSlider(newvalues);
                      }),
                  SizedBox(height: 15,),
                  myDividerFilter(),
                  SizedBox(height: 20,),
                  Text('Weight',style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17
                  ),),
                  Row(
                    children: [
                      Text('Small (3kg - 6kg)',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17
                      ),),
                      Spacer(),
                      Checkbox(
                          activeColor: defaultColor,
                          value:FilterCubit.get(context).ischeckedSmall ,
                          onChanged:(newbool)
                          {
                            // setState(() {
                            //   ischecked=newbool!;
                            // });
                            FilterCubit.get(context).onChangeCheckSmall(newbool!);
                           // if(FilterCubit.get(context).ischeckedSmall==true)
                              FilterCubit.get(context).weight="small";
                         //   else
                          //    FilterCubit.get(context).weight="";
                          }
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Medium (10kg - 20kg)',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17
                      ),),
                      Spacer(),
                      Checkbox(
                          activeColor: defaultColor,
                          value:FilterCubit.get(context).isCheckedMedium ,
                          onChanged:(newbool)
                          {
                            // setState(() {
                            //   ischecked=newbool!;
                            // });
                            FilterCubit.get(context).onChangeCheckMedium(newbool!);
                          //  if(FilterCubit.get(context).ischeckedMedium==true)
                              FilterCubit.get(context).weight="medium";
                           // else
                            //  FilterCubit.get(context).weight="";
                          }
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Large (30kg - 50kg)',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17
                      ),),
                      Spacer(),
                      Checkbox(
                          activeColor: defaultColor,
                          value:FilterCubit.get(context).ischeckedLarge ,
                          onChanged:(newbool)
                          {
                            // setState(() {
                            //   ischecked=newbool!;
                            // });
                            FilterCubit.get(context).onChangeCheckLarge(newbool!);
                           // if(FilterCubit.get(context).ischeckedLarge==true)
                              FilterCubit.get(context).weight="large";
                           // else
                            //  FilterCubit.get(context).weight="";
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                    child: Row(
                      children: [
                        TextButton(onPressed:(){
                          //FilterCubit.get(context).changeApply();
                          setState(() {
                            FilterCubit.get(context).values=RangeValues(1,10);
                            FilterCubit.get(context).labels=RangeLabels(
                                "${1.toString()} months",
                                "${10.toString()} months"
                            );
                            FilterCubit.get(context).weight='';
                            FilterCubit.get(context).gender='';
                            FilterCubit.get(context).category='';
                            FilterCubit.get(context).ischeckedLarge=false;
                            FilterCubit.get(context).isCheckedMedium=false;
                            FilterCubit.get(context).ischeckedSmall=false;
                            FilterCubit.get(context).ischeckedFemale=false;
                            FilterCubit.get(context).ischeckedMale=false;
                            FilterCubit.get(context).ischeckedDog=false;
                            FilterCubit.get(context).ischeckedCat=false;
                          });
                        }, child: Text('Reset',style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          color:defaultColor
                        ),)),
                        Spacer(),
                        Container(
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                            color: defaultColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child:TextButton(onPressed:(){
                            print('first');
                            List<String> resultgender = [];
                            List<String> resultage = [];
                            List<String> resultweight = [];
                            if(FilterCubit.get(context).gender != '' && FilterCubit.get(context).gender != null) {
                              List<PostModel> result = [];
                              for (var i = 0; i <
                                  widget.postModelsList.length; i++) {
                                if (widget.postModelsList[i].gender.toString()
                                    .toLowerCase()
                                    .trim()
                                    .contains(FilterCubit.get(context).gender.toLowerCase())) {
                                  print("gender1 ${widget.postModelsList[i].gender.toString()} gender2 ${FilterCubit.get(context).gender.toString()}");
                                  result.add(widget.postModelsList[i]);
                                  print("yesss${result[i].gender}");
                                  bool found=false;
                                  for(var i=0; i<petModelResultfinal.length;i++){
                                    // for(var s=0;s<result.length;s++)
                                    // {
                                      if(petModelResultfinal[i].id==result[i].id){
                                        found=true;
                                      }
                                    // }
                                    // found=false;
                                  }
                                  if(found==false){
                                    petModelResultfinal.add(
                                        result[i] );
                                  }
                                  print("yesss${petModelResultfinal.length}");
                                }
                              };
                              //if(result!=null&&searchController.text!=''){
                              // navigateTo(context, SearchScreen(articleModel: articleModelResult,));
                              // }
                             // print('my List' + resultgender.first);

                            }
                            if(range().length!=0) {
                              List<PostModel> result = [];
                              for (var i = 0; i <
                                  widget.postModelsList.length; i++) {
                                for(var j =0;j<range().length;j++) {
                                  if (widget.postModelsList[i].age.toString()
                                      .toLowerCase()
                                      .trim()
                                      .contains(range()[j].toString().toLowerCase())) {
                                    result.add(widget.postModelsList[i]);
                                    bool found=false;
                                    for(var i=0; i<petModelResultfinal.length;i++){
                                      // for(var s=0;s<result.length;s++)
                                      // {
                                        if(petModelResultfinal[i].id==result[i].id){
                                          found=true;
                                        }
                                      // }
                                      // found=false;
                                      print("agee"+result.length.toString());
                                    }
                                    if(found==false){
                                      petModelResultfinal.add(
                                          result[i] );
                                    }
                                  }
                                  print('range is'+range()[j].toString());
                                  //print('my List' + result[0].age.toString());
                                  print(petModelResultfinal.length.toString());
                                }
                              };
                              //if(result!=null&&searchController.text!=''){
                              // navigateTo(context, SearchScreen(articleModel: articleModelResult,));
                              // }


                            }
                            if(FilterCubit.get(context).weight != '' && FilterCubit.get(context).weight != null) {
                              List<PostModel> result = [];
                              for (var i = 0; i <
                                  widget.postModelsList.length; i++) {
                                if (widget.postModelsList[i].weight.toString()
                                    .toLowerCase()
                                    .trim()
                                    .contains(FilterCubit.get(context).weight.toLowerCase())) {
                                  result.add(widget.postModelsList[i]);
                                  bool found=false;
                                  for(var i=0; i<petModelResultfinal.length;i++){
                                    // for(var s=0;s<result.length;s++)
                                    // {
                                      if(petModelResultfinal[i].id==result[i].id){
                                        found=true;
                                      }
                                    }
                                  //   found=false;
                                  // }
                                  if(found==false){
                                    petModelResultfinal.add(
                                        result[i] );
                                  }
                                }
                              };
                            }
                            if(FilterCubit.get(context).category != '' && FilterCubit.get(context).category != null){
                              List<PostModel> result = [];
                              for (var i = 0; i <
                                  widget.postModelsList.length; i++) {
                                if (widget.postModelsList[i].category.toString()
                                    .toLowerCase()
                                    .trim()
                                    .contains(FilterCubit.get(context).category.toLowerCase())) {
                                  result.add(widget.postModelsList[i]);
                                  bool found=false;
                                  for(var i=0; i<petModelResultfinal.length;i++){
                                    // for(var s=0;s<result.length;s++)
                                    //   {
                                        if(petModelResultfinal[i].id==result[i].id){
                                          found=true;
                                        }
                                    //   }
                                    // found=false;
                                  }
                                  if(found==false){
                                    petModelResultfinal.add(
                                        result[i] );
                                  }
                                }
                              };}
                            //if(result!=null&&searchController.text!=''){
                            // navigateTo(context, SearchScreen(articleModel: articleModelResult,));
                            // }
                            //print('my List' + petModelResult.length.toString());
                            // for (var i = 0; i <
                            //     petModelResultgender.length; i++) {
                            //   petModelResult.add(petModelResultgender[i]);
                            // };

                            // for(var u=0;u<petModelResultfinal.length;u++)
                            // {
                            //   var count=0;
                            //   for(var n=0;n<petModelResultfinal.length;n++)
                            //     {
                            //       if(petModelResultfinal[u].id==petModelResultfinal[n].id)
                            //         {
                            //           count++;
                            //         }
                            //     }
                            //   if(count==1) {
                            //     petModelResultfinalUnique.add(
                            //         petModelResultfinal[u]);
                            //   }
                            // }
                            print("hhhhh"+petModelResultfinal.length.toString());
                            if(petModelResultfinal!=null){
                              navigateTo(context, ResultPetScreen(petModel: petModelResultfinal,));
                              print("number of pets2 is "+petModelResultfinal.length.toString());
                            }
                           // FilterCubit.get(context).changeApply();
                          }, child: Text('Apply',style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color:Colors.white
                          ),)) ,
                        )
                      ],
                    ),
                  )
                ]
            ),
          ),
        );
      },
    );
  }
}
