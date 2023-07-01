// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:uuid/uuid.dart';
//
// import '../../core/constant/colors.dart';
// import 'map_screen/cubit/map_cubit.dart';
// import 'map_screen/map_screen.dart';
//
// class Search extends StatefulWidget {
//    Search({Key? key, required this.isTimeAndDistanceVisible}) : super(key: key);
// bool isTimeAndDistanceVisible;
//   @override
//   State<Search> createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
//   FloatingSearchBarController controller = FloatingSearchBarController();
//
//   @override
//   Widget build(BuildContext context) {
//     final isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//
//     return  FloatingSearchBar(
//         // key: globalKey,
//         controller: controller,
//
//         elevation: 0,
//         hintStyle: TextStyle(fontSize: 18.sp),
//     queryStyle: TextStyle(fontSize: 18.sp),
//
//     hint: 'Search for nearest hospital..',
//     title: Row(
//     children: [
//     const Icon(Icons.search,color: greyText),
//     SizedBox(
//     width: 6.w,
//     ),
//     Text("Search for nearest hospital..",style: TextStyle(fontSize: 18.sp),)
//     ],
//     ),
//     border: const BorderSide(style: BorderStyle.none),
//     margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
//     padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
//     height: 52,
//     iconColor: Colors.cyan,
//     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//     transitionDuration: const Duration(milliseconds: 600),
//     transitionCurve: Curves.easeInOut,
//     physics: const BouncingScrollPhysics(),
//     axisAlignment: isPortrait ? 0.0 : -1.0,
//     openAxisAlignment: 0.0,
//     width: isPortrait ? 600 : 500,
//     debounceDelay: const Duration(milliseconds: 500),
//     progress: false,//TODO
//     onQueryChanged: (query) {
//       final sessionToken = Uuid().v4();
//       BlocProvider.of<MapsCubit>(context)
//           .emitPlaceSuggestions(query, sessionToken);
//     },
//     onFocusChanged: (_) {
//     // hide distance and time row
//     setState(() {
//     widget.isTimeAndDistanceVisible = true;
//     });
//     },
//     transition: CircularFloatingSearchBarTransition(),
//     actions: [
//     FloatingSearchBarAction(
//     showIfOpened: false,
//     child: CircularButton(
//     icon: const Icon(Icons.place, color: mainColor),
//     onPressed: () {}),
//     ),
//     ],
//     builder: (context, transition) {
//     return ClipRRect(
//     borderRadius: BorderRadius.circular(8),
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     mainAxisSize: MainAxisSize.min,
//     children: [
//     //buildSuggestionsBloc(),
//     // buildSelectedPlaceLocationBloc(),
//     // buildDiretionsBloc(),
//     ],
//     ),
//     );
//     },
//     );
//   }
// }
