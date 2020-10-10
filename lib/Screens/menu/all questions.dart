import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:techathon/Screens/Signup/signup_screen.dart';
import 'AnswerPage.dart';

class AllQuestion extends StatefulWidget {
  @override
  _AllQuestionState createState() => _AllQuestionState();
}

class _AllQuestionState extends State<AllQuestion> {
  List <String> Questions = ['flutter','android','ios'];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.295,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffd399c1),
                        Color(0xff9b5acf),
                        Color(0xff611cdf),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text("Inhabitant"),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: 20,
                right: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  "Hi, Welcome to Inhabitant Questions App",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 22,
                  ),
                ),
              )
            ],
          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
////            child: Text(
////              "All Questions",
////              style: TextStyle(
////                color: Colors.black,
////                fontWeight: FontWeight.bold,
////                fontSize: 24,
////              ),
////            ),
//          ),
          Expanded(
            child: ListView.builder(
//              itemCount: questionData.questions.length,
            itemCount: 10,
              itemBuilder: (context, i) {
//                Questions questions = questionData.questions[i];
//                String tags = questions.tags;
//                tags = tags.substring(1, tags.length - 1);
//                var tagList = tags.split(",");

                return ListTile(
                  dense: true,
                  isThreeLine: true,
                  title:Row(children: [
                    CircleAvatar(
                      radius: 15,
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff9b5acf),
//                    child: Text(questions.voteCount.toString()),
                      child: Icon(Icons.arrow_drop_up),
                    ),
                    SizedBox(width:25.0 ,),
                    GestureDetector(child: Text('Dart : How to run a project?',
                      style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),
                    ),onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Answers();
                          },
                        ));}
                    )
                      ],),
//                  trailing:  Text('sent by',
//                    style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),),
                      subtitle: Column
                      (children: [
                      Row(children: [
                      CircleAvatar(
                      radius: 14,
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff9b5acf),
//                    child: Text(questions.voteCount.toString()),
                      child:Text('21',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
                      ),  SizedBox(width:15.0 ,),
                      Wrap(
                      children: Questions
                      .map((
                    t) => Padding(
                              padding: EdgeInsets.all(7),
                              child: Chip(
                                backgroundColor: Color(0xff9b5acf),
                                //  shape: RoundedRectangleBorder(),
                                label: Text(
                                  t,
                                  style: TextStyle(
                                    color: Colors.white,

                                  ),
                                ),
                              ),
                            )

                            )
                                .toList(),
                          ),
                        ],),


                      Align(alignment: Alignment.topRight,child: Text('asked by username',textAlign: TextAlign.right,)),

                    ],),
                  );

              },

            ),
          ),

//
        ],

      ),

    );
  }
}

