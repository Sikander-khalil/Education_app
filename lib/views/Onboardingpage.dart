import 'package:edu_flex/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../dash.dart';
import '../models/onboard_data.dart';
import '../onbaordapp_styles.dart';
import '../onboardsize_configs.dart';


class Onboardingpage extends StatefulWidget {
  const Onboardingpage({Key key}) : super(key: key);

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  int currentpage= 0;
  PageController _pageController= PageController(initialPage: 0);
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(

        color: currentpage == index? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),

    );

  }
  @override
  Widget build(BuildContext context) {
    //initialize Size config
    OnboardSizeConfig().init(context);
    double sizeH= OnboardSizeConfig.blockSizeH;
    double sizeV= OnboardSizeConfig.blockSizeV;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(

              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value){
                  setState(() {
                    currentpage= value;
                  });
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height:  sizeV * 5),
                      Text(onboardingContents[index].title,
                        style: kTitle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height:  sizeV * 5),
                      Container(height: sizeV * 50,
                      child: Image.asset(onboardingContents[index].image,
                      fit: BoxFit.contain,
                      ),

                      ),
                      SizedBox(height:  sizeV * 5),
RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
    style: kBodyText1,
    children: [
  TextSpan(text: 'We can'),
  TextSpan(text: ' Help you'),
  TextSpan(text: ' To be a better'),
  TextSpan(text: '\n education'),



]
    ),
),
                      SizedBox(height:  sizeV * 5),
                      
                    ],

                  ),
                ),
            ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                children: [
                  currentpage == onboardingContents.length -1? 
                      MyTextButton(
                        buttonName: 'Get Stated',
                        onPressed: (){

                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => CheckApp()));
                        },
                        bgColor: kPrimaryColor,

                      ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OnBoardNavBtn(

                        name: 'Skip',
                        onPressed: (){},

                      ),
                      Row(children: List.generate(onboardingContents.length, (index) => dotIndicator(index)),

                      ),
                      OnBoardNavBtn(

                        name: 'Next',
                        onPressed: (){
                          _pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);

                        },

                      ),
                    ],

                  ),
                ],

                ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key key,  this.buttonName,  this.onPressed,  this.bgColor
  }) : super(key: key);
final String buttonName;
final VoidCallback onPressed;
final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: OnboardSizeConfig.blockSizeH * 15.5,
        width: OnboardSizeConfig.blockSizeH * 100,

        child: TextButton(onPressed: onPressed, child: Text(buttonName,style: kBodyText1,),
         style: TextButton.styleFrom(
           backgroundColor: bgColor
         ),


        ),
      ),
    );
  }
}

class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({
    Key key,  this.name,  this.onPressed
  }) : super(key: key);
final String name;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
        borderRadius: BorderRadius.circular(6),
        splashColor: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(name,style: kBodyText1,),
        ));
  }
}
