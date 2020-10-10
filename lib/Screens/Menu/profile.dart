import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techathon/Services/currentQuestions.dart';

class CardDetail {
  String title;
  String subtitle;

  CardDetail({this.title, this.subtitle});
}

String _id;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  getUserInfogetChats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _id = prefs.getString('id');
    //print(Constants.myName);

    setState(() {
      _id = (prefs.getString('id') ?? '');
      print(_id);
    });
  }

  @override
  void initState() {
    setState(() {
      getUserInfogetChats();
    });
    super.initState();
  }

  final _firestore = FirebaseFirestore.instance;
  Widget _buildProfileImage(w, h) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/user.png'), fit: BoxFit.fitHeight),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.purple,
          width: 5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<CardDetail> cards = [
      CardDetail(title: 'What is flutter?', subtitle: '1 hr ago'),
      CardDetail(title: 'how to deploy a project?', subtitle: '2hrs ago'),
    ];

    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(children: [
              Align(
                alignment: Alignment.topLeft,
                child: _buildProfileImage(120.0, 120.0),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  Text('Karthi',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left),
                  Text(
                    'Developer',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.purple,
                        size: 30.0,
                      ),
                      Text(
                        'Chennai',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
          Wrap(
            children: [
              Chip(
                backgroundColor: Colors.purple,
                label: Text(
                  'Flask',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Chip(
                backgroundColor: Colors.purple,
                label: Text(
                  'Django',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Chip(
                backgroundColor: Colors.purple,
                label: Text(
                  'Flutter',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Chip(
                backgroundColor: Colors.purple,
                label: Text(
                  'Android',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Chip(
                backgroundColor: Colors.purple,
                label: Text(
                  'IOS',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Chip(
                backgroundColor: Colors.purple,
                label: Text(
                  'Age:21',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Chip(
                backgroundColor: Colors.purple,
                label: Text(
                  'Gender: Female',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Posted Questions',
              style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection(_id).snapshots(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    List<CurrentQuestions> questionList = [];
                    try {
                      if (snapshot.data.docs.length != 0) {
                        final questions = snapshot.data.docs.reversed;
                        for (var question in questions) {
                          final title = question.data()['question'].toString();

                          CurrentQuestions info = CurrentQuestions(
                              question: title,
                          );
                          questionList.add(info);
                        }
                        return  ListView.builder(
                          itemCount: questionList.length,
                          itemBuilder: (context, index) => CardListTile(
                            title: questionList[index].question,
                            subtitle: cards[index].subtitle,
                          ),
                        );
                      }
                      else{
                        return Container(
                          color: Colors.white,
                        );
                      }
                    } catch (e) {
                      return Container(
                        color: Colors.white,
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}

class CardListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  CardListTile({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      color: Colors.purple,
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                width: 1.0,
                color: Colors.white24,
              ),
            ),
          ),
          child: Icon(Icons.history, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.linear_scale,
              color: Colors.yellow,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
