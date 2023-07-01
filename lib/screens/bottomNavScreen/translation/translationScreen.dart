import 'dart:async';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/core/components/constants.dart';
import 'package:meaw/screens/bottomNavScreen/translation/translate/cubit/cubit.dart';
import 'package:meaw/screens/bottomNavScreen/translation/translate/cubit/states.dart';
import 'package:meaw/screens/bottomNavScreen/translation/translate/translateModel.dart';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

// import '../../../core/components/components.dart';
import '../../../cubit/animalCubit.dart';
import '../../homeScreen/HomeScreen.dart';
import '../../profileScreen/profileScreen.dart';

class TranslationScreen extends StatefulWidget {
  TranslationScreen({Key? key}) : super(key: key);

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final record = Record();

  late final RecorderController recorderController;

  void _initialiseController() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
  }

  void expandBox(){

    TranslateCubit.get(context).animate(
    );
  }
  void opposeBox(){

    TranslateCubit.get(context).animateSmallen(
        //boxHeight, boxWidth
    );
  }
var num =1;
  int change(){
    setState(() {
      num+=1;
    });
    return num;
  }
  Timer? timer;
   @override
   void initState() {
    super.initState();

     timer = Timer.periodic(Duration(seconds: 2), (Timer t) => expandBox());
   }



  @override
  Widget build(BuildContext context) {
    TranslateModel? transModel=TranslateCubit.get(context).translateModel;
    return
      BlocConsumer<TranslateCubit,TranslateStates>(
        listener: (context,state){},
        builder: (context,state){
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
            body:
              Center(
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            if(audio==0)
                            Image.asset('assets/images/meow.png',height: 400,),
                            if(audio==0)
                             SizedBox(height: 50,),
                            if(audio==0
                                &&userType==3
                            )
                            TextButton(
                              onPressed: ()async{
                                setState(() {
                                  audio=1;
                                });
                                Directory tempDir = await getApplicationDocumentsDirectory();
                                String path = tempDir.path;
// Check and request permission
                                if (await record.hasPermission()) {
                                  // Start recording
                                  await record.start(
                                    path:path+'/myFile.wav' ,
                                    encoder: AudioEncoder.wav, // by default
                                    bitRate: 128000,
                                  );
                                }
                              },
                              child: const Text('Tap to translate',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Jannah',
                                  color: defaultColor
                                ),
                              )
                            ),
                          //2
                            if(audio==1)
                          const Image(image: AssetImage("assets/images/catanimatedot.png")),
                            if(audio==1)
                            Container(

                            //  color: Colors.blue,
                              child: Center(
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: 300,
                                      width: 300,
                                      child: GestureDetector(
                                        onTap:expandBox ,
                                        child:UnconstrainedBox(
                                          child: AnimatedContainer(
                                            height: TranslateCubit.get(context).boxHeight,
                                            width: TranslateCubit.get(context).boxWidth,
                                            duration: const Duration(seconds: 1,),
                                            child: const Image(image:AssetImage('assets/images/Rectangle 150.png',) ,),
                                           // child:Image(image: AssetImage("assets/images/Rectangle 150.png"),) ,
                                          ),
                                        )
                                      ),
                                    ),
                                    const Positioned(
                                      left: 60,
                                        top: 15,
                                        child: Image(image: AssetImage("assets/images/catanimate.png"))),
                                  ],
                                ),
                              ),
                            ),
                            if(audio==1)
                            TextButton(
                                onPressed: ()async{
                                  audio=2;
                                  reverse=true;
                                  await record.stop();
                            Directory tempDir = await getApplicationDocumentsDirectory();
                                String path = tempDir.path;
                                File f=File(path+'/myFile.wav');
                               _createFile(f.path);
                                TranslateCubit.get(context).translate(
                                    fileName:"myFile" ,filePath: f.path.toString(),
                                );

                                },
                                child: const Text('Tap to Stop',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Jannah',
                                      color: defaultColor
                                  ),
                                )
                            ),
                            //3
                            if(audio==2)
                            const Image(image: AssetImage('assets/images/Group 64.png')),
                            if(audio==2)
                              SizedBox(height: 30,),
                            if(audio==2)
                             Padding(
                               padding: const EdgeInsets.only(right: 15.0,),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: const [
                                   CircleAvatar(
                                     child: Image(image: AssetImage('assets/images/Ellipse 35.png')),
                                   ),
                                 ],
                               ),
                             ),
                            if(audio==2)
                              ConditionalBuilder(
                                condition: state is! TranslateLoadingState&&TranslateCubit.get(context).translateModel?.translation!=null,
                                builder: (BuildContext context) => Padding(
                                  padding: const EdgeInsets.only(left: 60.0),
                                  child: Container(
                                    width: 180,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color:const Color.fromRGBO(244,231,189, 1),
                                      borderRadius: BorderRadius.circular(4)
                                    ),
                                    child: Center(child: Text(' ${TranslateCubit.get(context).translateModel?.translation.toString()}')),
                                  ),
                                ),
                                fallback: (BuildContext context) => const Center(
                                  child: CircularProgressIndicator(
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            // TranslateCubit.get(context).translateModel!=null?
//             Center(
//               child: Row(
//                 children: [
//                   Container(
//                       child: TextButton(
//                         onPressed: ()async{
//                           // Directory e=await getApplicationDocumentsDirectory();
//                           // var dirType = DownloadDirectoryTypes.dcim;
//                           // Directory? downloadsDirectory = await DownloadsPath.downloadsDirectory(dirType:"test");
//                           // String?path = (await DownloadsPath.downloadsDirectory(dirType:"test"))?.path;
//                           //  print('path='+path!);
//                           // Directory tempDir = await getTemporaryDirectory();
//                           // String path = tempDir.path;
//                           // path = "${path}/test_audio.aac";
//                           // void _startRecording() async {
//                           //   await recorderController.record(path: path);
//                           //   // update state here to, for eample, change the button's state
//                           // }
//                          // Directory tempDir = await getTemporaryDirectory();
//                           Directory tempDir = await getApplicationDocumentsDirectory();
//                           String path = tempDir.path;
// // Check and request permission
//                           if (await record.hasPermission()) {
//                             // Start recording
//                             await record.start(
//                               path:path+'/myFile.wav' ,
//                               encoder: AudioEncoder.wav, // by default
//                               bitRate: 128000, // by default//كم بيت ف الثانية
//                             );
//                           }
//
// // Get the state of the recorder
//                           bool isRecording = await record.isRecording();
//                         },
//                         child: Text('Record'),
//                       )
//                   ),
//                   Container(
//                       child: TextButton(
//                         onPressed: ()async{
// //Stop recording
//                           await record.stop();
//                         },
//                         child: Text('Stop'),
//                       )
//                   ),
//                   Container(
//                       child: TextButton(
//                         onPressed: ()async
//                         {
// //Stop recording
//                          // Directory tempDir = await getTemporaryDirectory();
//                           Directory tempDir = await getApplicationDocumentsDirectory();
//                           String path = tempDir.path;
//                           AudioPlayer player=AudioPlayer();
//                           player.play(DeviceFileSource(path+'/myFile.wav'));
//                           File f=File(path+'/myFile.wav');
//                           // _writeFileToStorage();
//                          _createFile(f.path);
//                           print("file path"+f.path.toString());
//                           TranslateCubit.get(context).translate(
//                               fileName:"myFile" ,filePath: f.path.toString(),
//                           );
//                         },
//                         child: Text('Play'),
//                       )
//                   ),
//                 ],
//               ),
//             )
                  //:
           // CircularProgressIndicator(),
          )
          ;
        },
      );
    //   Center(
    //   child: SingleChildScrollView(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Image.asset('assets/images/meow.png'),
    //         const SizedBox(height: 50,),
    //         TextButton(
    //           onPressed: (){},
    //           child: const Text('Tap to translate',
    //             style: TextStyle(
    //               fontSize: 25,
    //               fontFamily: 'Jannah',
    //               color: defaultColor
    //             ),
    //           )
    //         ),
    //       ],
    //     ),
    //   ),
    // );

  }
  String _fileName = 'Recording_';
  String _fileExtension = '.aac';
  String _directoryPath = '/storage/emulated/0/SoundRecorder';
  void _createFile(String path) async {
   // var _completeFileName = "my.wav";
    File(_directoryPath + '/' + path)
        .create(recursive: true)
        .then((File file) async {
      //write to file
      Uint8List bytes = await file.readAsBytes();
      file.writeAsBytes(bytes);
      print("complete path"+file.path);
    });
  }

  void _createDirectory() async {
    bool isDirectoryCreated = await Directory(_directoryPath).exists();
    if (!isDirectoryCreated) {
      Directory(_directoryPath).create()
      // The created directory is returned as a Future.
          .then((Directory directory) {
        print(directory.path);
      });
    }
  }

  void _writeFileToStorage() async {
    _createDirectory();
    //_createFile();
  }
}
