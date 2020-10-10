import 'package:flutter/material.dart';

class Answers extends StatefulWidget {
  final String question;
  final String Description;
  final String sender;
  final List<dynamic> tags;
  Answers({this.question,this.Description,this.sender,this.tags});
  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  List<String> Questions = ['Flutter', 'ios', 'android'];
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              AppBar(
                backgroundColor: Color(0xff9b5acf),
                elevation: 0.0,
                title: Text("Inhabitant"),
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          ListTile(
              dense: true,
              isThreeLine: true,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple.shade700,
//                    child: Text(questions.voteCount.toString()),
                    child: Icon(Icons.arrow_drop_up),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  GestureDetector(
                      child: Text(
                        widget.question,
                        style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Answers();
                          },
                        ));
                      })
                ],
              ),
              subtitle: Column(children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 14,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.purple.shade700,
//                    child: Text(questions.voteCount.toString()),
                        child: Icon(Icons.arrow_drop_down)),
                    SizedBox(
                      width: 15.0,
                    ),
                    Wrap(
                      children: widget.tags.map((t) => Padding(
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
                      )).toList(),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'asked by ${widget.sender}',
                      textAlign: TextAlign.right,
                    )),
                Divider(
                  color: Colors.black,
                ),
                Text(
                  widget.Description,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: const <Widget>[
                    Icon(
                      Icons.share,
                      color: Colors.purple,
                      size: 20.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.purple,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.purple,
                      size: 20.0,
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '0 Answers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '                   '
                              '                                              order by votes',
                          textAlign: TextAlign.right,
                        )),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Answer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Body',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),SizedBox(height: 10.0,),SizedBox(height: 10.0,),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: .0),
                    ),
                    hintText: 'Enter here',
                  ),
                )
              ])),SizedBox(height: 10.0,),
          Align(alignment: Alignment.center,
            child: RaisedButton(child: Text("Post your Answer"),
              onPressed:(){},
              color: Colors.purple,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
          )
        ]));

  }
}
