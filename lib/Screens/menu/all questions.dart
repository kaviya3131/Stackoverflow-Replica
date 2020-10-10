import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techathon/Services/question_info.dart';

import '../../constants.dart';
import '../../constants.dart';
import '../../constants.dart';
import 'AnswerPage.dart';

class AllQuestion extends StatefulWidget {
  @override
  _AllQuestionState createState() => _AllQuestionState();
}

class _AllQuestionState extends State<AllQuestion> {
  final _firestore = FirebaseFirestore.instance;
//  List<String> Questions = ['flutter', 'android', 'ios'];

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

          Expanded(
            child: Container(
              color: Colors.white,
              child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('questions').snapshots(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    List<QuestionInfo> questionList = [];
                    try {
                      if (snapshot.data.docs.length != 0) {
                        final questions = snapshot.data.docs.reversed;
                        for (var question in questions) {
                          final title = question.data()['question'].toString();
                          final votes = question.data()['votes'].toString();
                          final description = question.data()['description'].toString();
                          final tags = question.data()['tags'];
                          final answer = question.data()['answer'].toString();
                          final sender = question.data()['sender'].toString();
                          QuestionInfo info = QuestionInfo(
                            question: title,
                            votes: votes,
                            tags: tags,
                            answer: answer,
                              sender: sender
                          );

                          questionList.add(info);
                        }

                        return ListView.builder(
                          itemCount: questionList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              dense: true,
                              isThreeLine: true,
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(0xff9b5acf),
//                    child: Text(questions.voteCount.toString()),
                                    child: Icon(Icons.arrow_drop_up),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  GestureDetector(
                                      child: Text(
                                          questionList[index].question,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return Answers(question: questionList[index].question,Description: questionList[index].description,sender: questionList[index].sender,tags: questionList[index].tags,);
                                          },
                                        ));
                                      })
                                ],
                              ),
//                  trailing:  Text('sent by',
//                    style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 14,
                                        foregroundColor: Colors.white,
                                        backgroundColor: Color(0xff9b5acf),
//                    child: Text(questions.voteCount.toString()),
                                        child: Text(
                                          questionList[index].votes,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Wrap(
                                        children: questionList[index].tags.map((t) => Padding(
                                              padding: EdgeInsets.all(7),
                                              child: Chip(
                                                backgroundColor:
                                                    Color(0xff9b5acf),
//  shape: RoundedRectangleBorder(),
                                                label: Text(
                                                  t,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )).toList(),
                                      ),
                                    ],
                                  ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        'asked by ${questionList[index].sender}',
                                        textAlign: TextAlign.right,
                                      )),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      else {
                        return Container(
                          child: Center(
                            child: Text(
                              'No questions added yet.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: kPrimaryColor),
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      return Container(
                        child: Center(
                          child: Text(
                            'No questions added',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: kPrimaryColor),
                          ),
                        ),
                      );
                    }
                  }),
            ),
          ),

//
        ],
      ),
    );
  }
}
//child:
