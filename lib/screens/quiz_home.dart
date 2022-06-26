
import 'package:edu_flex/Dashboard2.dart';
import 'package:edu_flex/screens/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/question_list.dart';
import 'HomeScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color(0xFF117eeb);
  PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor =  Color(0xFF117eeb);
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed:(){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Dasboard2()));

        }, icon: new Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      backgroundColor: mainColor,
      body: Padding(padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page){
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text("Question ${index + 1}/${questions.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize:28.0,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(questions[index].question,
                  style: const TextStyle(color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                for(int i = 0; i<questions[index].answer.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 18.0),
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: isPressed ?questions[index].answer.entries.toList()[i].value
                          ?isTrue
                          :isWrong
                          :secondColor,
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      onPressed: isPressed
                          ? (){}
                          : (){
                        setState(() {
                          isPressed = true;
                        });
                        if(questions[index]
                            .answer
                            .entries
                            .toList()[i]
                            .value){
                          score+=10;
                          print(score);
                        }
                      },
                      child: Text(
                        questions[index].answer.keys.toList()[i],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: isPressed
                          ? index +1 == questions.length
                          ? () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>ResultScreen(score)));
                      }
                          :() {
                        _controller.nextPage(
                            duration: Duration(microseconds: 500),
                            curve: Curves.linear);
                        setState(() {
                          isPressed = false;
                        });
                      }
                          : null,
                      style: OutlinedButton.styleFrom(
                        shape:StadiumBorder(),
                        side: BorderSide(color: Colors.orange, width: 1.0),
                      ),
                      child:  Text(
                        index +1 == questions.length
                            ? "See result"
                            : "Next Question",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


