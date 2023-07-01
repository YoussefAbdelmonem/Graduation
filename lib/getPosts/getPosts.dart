import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/cubit/animalCubit.dart';
import 'package:meaw/getPosts/editPost.dart';
import 'package:meaw/getPosts/getCubit/getCubit.dart';
import 'package:meaw/getPosts/getCubit/getStates.dart';
import 'package:meaw/getPosts/getCubit/model.dart';
import 'package:meaw/screens/homeScreen/HomeScreen.dart';
import 'package:meaw/screens/profileScreen/profileScreen.dart';
class GetPosts extends StatefulWidget {
  const GetPosts({Key? key}) : super(key: key);

  @override
  State<GetPosts> createState() => _GetPostsState();
}

class _GetPostsState extends State<GetPosts> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<GetCubit, GetStates>(
        listener: (context, state) {},
        builder: (context, state) {
    return Scaffold(
      appBar:  AppBar(
        leading: InkWell(
            onTap: (){
              if (reverse==true) {
                navigateTo(context, (HomeScreen()));
              }
              audio=0;
              reverse=false;
            },
            child:reverse==true?
            Icon(Icons.arrow_back,size: 30,color: defaultColor,)
                :Icon(Icons.arrow_back,size: 26,color: Colors.transparent,)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
            child: GestureDetector(
              onTap: ()async{
                await CatCubit().getDataaaaa();
                navigateTo(context, const ProfileScreen());

                //navigateTo(context, const ProfileScreen());
              },
              child:Container(
                height: 80,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:CatCubit.get(context).userData==null?NetworkImage('https://i.pinimg.com/564x/a1/d8/62/a1d862711ba51f2a19c6c0c4a891eb42.jpg'): NetworkImage('${CatCubit.get(context).userData?.profileImage}')
                    )
                ),
                // child:CatCubit.get(context).userData==null?
                // CircleAvatar(backgroundImage:AssetImage('assets/images/profile.jpg',),
                //   radius: 50,
                // ):
                // CircleAvatar(
                //     radius: 50,
                //     backgroundImage:NetworkImage( '${CatCubit.get(context).userData?.profileImage}')),
              ),
              // CircleAvatar(
              //   radius: 25,
              //   backgroundImage: NetworkImage('${CatCubit.get(context).userData?.profileImage}'),
              // ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: appBaar(
                    context: context,
                    label: 'Your Posts',
                    screen: ProfileScreen(),
                    width: 80.0),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream:
                        GetCubit.get(context).getPosts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<PostModel> postsModel = [];
                            for (var doc in snapshot.data!.docs) {
                              var data =
                              doc.data() as Map<String, dynamic>;
                              postsModel.add(PostModel(
                                  name : data['name'],
                                  age : data['age'],
                                  gender : data['gender'],
                              image : data['image'],
                              category : data['category'],
                              weight : data['weight'],
                              price : data['price'],
                              id : data['id'],
                                shelterid:data['shelterid'] ,
                                health:data['health'] ,
                                behavior: data['behavior']
                              )
                              );
                              print("yessss"+data['name']);
                            }

                            return  Padding(
                              padding: const EdgeInsets.only(top: 30.0,left: 15,right: 15),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder:(context,index)=>buildPost(postsModel,index),
                                  separatorBuilder:(context,index)=>const SizedBox(
                                    height: 12,
                                  ) ,
                                  itemCount: postsModel.length
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
  Widget buildPost(List<PostModel> list, int index)=>Container(
    padding: EdgeInsets.only(left: 15,right: 15),
    width: double.infinity,
    height: 170,
    decoration: BoxDecoration(
        border:Border.all(color: Color.fromRGBO(163,86,56,1)),
        borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name : ${list[index].name}',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 20
        ),),
        SizedBox(height: 5,),
        Text('Gender : ${list[index].gender}',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 20
        ),),
        Text('Category : ${list[index].category}',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 20
        ),),
        Text('weight : ${list[index].weight}',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 20
        ),),
        Text('Price : ${list[index].price}',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 20
        ),),
        Text('Age : ${list[index].age}',style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 20
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 70,
              height: 20,
              decoration: BoxDecoration(
                color: defaultColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: MaterialButton(
                onPressed: (){
                  // GetCubit.get(context).getMyData("X4kTXDpLdmd8Q4kwA4bg");//change to variable???????????
                  var model =GetCubit.get(context).postData;
                  print("my problem"+list[index].id.toString());
                  navigateTo(context, EditPost(model:list[index]));
                },
                child: Text(
                  'Edit',
                  style:GoogleFonts.roboto(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
