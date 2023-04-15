// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meaw/components/colors.dart';
// import 'package:meaw/components/components.dart';
// import 'package:meaw/cubit/animalCubit.dart';
// import 'package:meaw/cubit/animalStates.dart';
// import 'package:meaw/style/icon_broken.dart';
// class AddCatScreen extends StatefulWidget {
//   const AddCatScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddCatScreen> createState() => _AddCatScreenState();
// }
//
// class _AddCatScreenState extends State<AddCatScreen> {
//   var catName = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//   int catYear = 0;
//   String? catGender;
//   List<String> list = <String>['Male', 'Female', ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CatCubit,CatStates>(
//       listener: (context,state){
//         if(state is CatAddCatSuccessState)
//         {
//           showToast(
//               message: 'Cat added',
//               state: ToastStates.success
//           );
//           catName.clear();
//           catYear = 0 ;
//         }
//       },
//       builder: (context,state){
//         var cubit = CatCubit.get(context);
//         var catImage = CatCubit.get(context).catImage;
//
//         return Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             title: const Text('Add Cat',
//               style: TextStyle(
//                 fontSize: 25,
//                 color: Colors.black,
//                 fontFamily: 'Jannah',
//               ),
//             ),
//             backgroundColor: Colors.white,
//             leading: IconButton(
//               onPressed: (){Navigator.pop(context);},
//               icon: const Icon(IconBroken.Arrow___Left_2,color: defaultColor,),
//             ),
//           ),
//           body: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Form(
//                 key: formKey,
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Stack(
//                         children: [
//                           CircleAvatar(
//                             radius: 80,
//                             backgroundImage: catImage == null ? const NetworkImage('https://i.pinimg.com/564x/1a/df/38/1adf38fdc4ee9f2895be7f340e772767.jpg'):FileImage(catImage) as ImageProvider,
//                           ),
//                           Positioned(
//                             right: 0,
//                             bottom: 0,
//                             child: CircleAvatar(
//                               radius: 22,
//                               backgroundColor: Colors.white,
//                               child: CircleAvatar(
//                                 radius: 20,
//                                 backgroundColor: Colors.white,
//                                 child: IconButton(
//                                   onPressed: (){
//                                     cubit.getCatImage();
//                                   },
//                                   icon: const Icon(IconBroken.Camera),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20,),
//                       defaultTextFormField(
//                           controller: catName,
//                           validator: (value){
//                             if(value!.isEmpty)
//                             {
//                               return 'Cat Name is Empty!';
//                             }
//                             return null;
//                           },
//                           inputType: TextInputType.name,
//                           label: 'Cat Name',
//                           prefix: IconBroken.Profile,
//                           context: context
//                       ),
//                       const SizedBox(height: 10,),
//                       Container(
//                         width: double.infinity,
//                         height: 75,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(width: 1,color: defaultColor),
//                         ),
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text('Cat\'s Age',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         color: defaultColor,
//                                         fontFamily: 'Jannah'
//                                     ),
//                                   ),
//                                   Text('$catYear',
//                                     style: const TextStyle(
//                                         fontSize: 20,
//                                         color: defaultColor,
//                                         fontFamily: 'Jannah'
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const Spacer(),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: (){
//                                       setState(() {
//                                         catYear += 1;
//                                       });
//                                     },
//                                     child: Container(
//                                       width: 30,
//                                       height: 30,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(width: 1,color: defaultColor),
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: const Icon(IconBroken.Arrow___Up_2),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 5,),
//                                   GestureDetector(
//                                     onTap: (){
//                                       if(catYear == 0)
//                                       {}
//                                       else {
//                                         setState(() {
//                                           catYear -= 1;
//                                         });
//                                       }
//                                     },
//                                     child: Container(
//                                       width: 30,
//                                       height: 30,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(width: 1,color: defaultColor),
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: const Center(child: Icon(IconBroken.Arrow___Down_2)),
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 10,),
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(width: 1,color: defaultColor)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                           child: DropdownButton(
//                             dropdownColor: Colors.white,
//                             hint: const Text('Choose Gender',
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color: defaultColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Jannah'
//                               ),
//                             ),
//                             underline: const SizedBox(),
//                             value: catGender,
//                             icon: const Icon(IconBroken.Arrow___Down_2,color: defaultColor,),
//                             elevation: 16,
//                             style: const TextStyle(
//                               color: defaultColor,
//                               fontFamily: 'Jannah',
//                               fontSize: 20,
//                             ),
//                             isExpanded: true,
//                             items: list.map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                             onChanged: (value) {
//                               setState(() {
//                                 catGender = value.toString();
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20,),
//                       ConditionalBuilder(
//                           condition: state is! CatAddCatLoadingState,
//                           builder: (BuildContext context)=> defaultButton(
//                               text: 'Save',
//                               onPressed: (){
//                                 if(formKey.currentState!.validate() && catImage != null){
//                                   cubit.uploadCatImage(
//                                       catName: catName.text,
//                                       year: catYear.toString(),
//                                       gender: catGender.toString()
//                                   );
//                                 }
//                                 if(catImage == null) {
//                                   showToast(
//                                       message: 'Choose Cat Image First',
//                                       state: ToastStates.error
//                                   );
//                                 }
//                               }
//                           ),
//                           fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator(color: defaultColor,),)
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> mList=[
      Image.asset('assets/images/facebook.png'),
      // Image.asset('assets/images/heart.png'),
      // Image.asset('assets/images/facebook.png'),
      // Image.asset('assets/images/heart.png'),
      Text("Hiiiii")
    ];
    return Scaffold(
      body: GridView.builder(

        gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: mList.length,
          itemBuilder: (context,index){
          // if(index%2==0){
          //
          // }else{
          //
          // }
          //   if(index==(mList.length-1)){
          //
          //     return Container(
          //       child: Text("Hi Amira"),
          //     );
          //
          //   }
            return Container(
              child: mList[index],
            );
          })
      // GridView(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       mainAxisSpacing: 2,
      //       crossAxisSpacing: 2,
      //       crossAxisCount: 2
      //     ),
      //   children: [
      //
      //     Image.asset('assets/images/facebook.png'),
      //     Image.asset('assets/images/heart.png'),
      //     Image.asset('assets/images/facebook.png'),
      //     Image.asset('assets/images/heart.png'),
      //
      //   ],
      // ),
    );
  }
}
