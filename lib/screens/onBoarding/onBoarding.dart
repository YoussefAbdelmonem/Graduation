
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaw/components/colors.dart';
import 'package:meaw/components/components.dart';
import 'package:meaw/components/local/shared_pref.dart';
import 'package:meaw/screens/loginScreen/loginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onBoard1.png',
      title: 'Excited to know your cat\'s mood?',
      body: 'You can find out by using the \n translation feature and recording \n your cat\'s meowing ',
    ),
    BoardingModel(
        image: 'assets/images/onBoard2.png',
        title: 'Let\'s take care of your pet!',
        body: 'We offer you a set of instructions and \n tips taking care of your pet and all \n the personal care timings'
    ),
    BoardingModel(
        image: 'assets/images/onBoard3.png',
        title: 'Oooooh your pet is tired!',
        body: 'Do not worry, you can contact a \n specialized veterinarian through us \n and book an appointment to check on \n your pet'
    ),
    BoardingModel(
        image: 'assets/images/onBoard4.png',
        title: 'Did you find a poor pet on the street?',
        body: 'Bring it to us now, make a report, it will\n be taken care of in our shelter and you\n can also buy from these shelters'
    ),
  ];

  var boardController = PageController();

  var _isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(
          context,
           LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (BuildContext context, int index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      _isLast = true;
                    });
                  } else {
                    setState(() {
                      _isLast = false;
                    });
                  }
                },
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            if(_isLast)
              defaultButton(
                text: 'Get Started',
                onPressed: (){submit();}
              ),
            if(_isLast == false)
              Row(
              children: [
                defaultTextButton(
                  function: (){},
                  text: 'skip',
                ),
                const Spacer(),
                Expanded(
                  child: defaultButton(
                    text:'Next',
                    onPressed: () {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      SmoothPageIndicator(
        controller: boardController,
        count: boarding.length,
        effect:  WormEffect(
            dotColor: Color.fromRGBO(215, 199, 158, 1),
            activeDotColor: defaultColor,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 5
        ),
      ),
      SizedBox(
        height:50,
      ),
      Text(
              model.title,
              style:  GoogleFonts.roboto(
                  fontSize: 18,
                  color:Color.fromRGBO(67, 65, 65, 1),
                  fontWeight: FontWeight.w500
              ),
            ),
      const SizedBox(
        height: 10,
      ),
      Text(
        model.body,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            fontSize: 17,
            color:Color.fromRGBO(67, 65, 65, 1),
            fontWeight: FontWeight.w400,
          height: 1.6
        ),
      ),
      const SizedBox(
        height: 30,
      ),
    ],
  );
}
