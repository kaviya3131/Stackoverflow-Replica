import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tags/input_tags.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:techathon/Widgets/simple_textstyle.dart';
import '../../constants.dart';
import '../../constants.dart';
import '../../constants.dart';
import '../../constants.dart';
import '../../constants.dart';



class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  List<String> _tags = [];
  double containerHeight = 310.0;
  List<Asset> images = List<Asset>();
  String _error;
  String title;
  String tagLine;
  String description;
  String uses;
  String webLink;
  List<String> imageUrl = [];
  bool showSpinner = false;

  List<PopupMenuEntry> _popupMenuBuilder(String tag) {
    return <PopupMenuEntry>[
      PopupMenuItem(
        child: Text(tag, style: TextStyle(color: Colors.blueGrey)),
        enabled: false,
      ),
      PopupMenuDivider(),
      PopupMenuItem(
        value: 1,
        child: Row(
          children: <Widget>[
            Icon(Icons.content_copy),
            Text("Copy text"),
          ],
        ),
      ),
    ];
  }

  void _getTags() {
    _tags.forEach((tag) => print(tag));
  }
  Widget buildGridView() {
    if (images != null)
      return GridView.count(
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          );
        }),
      );
    else
      return Container(color: Colors.white);
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 9,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _error = 'No Error Dectected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
//        leading: Icon(Icons.chevron_left),
          backgroundColor: kPrimaryColor,
          title: Text(
            'InHabitant',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Viga'),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'What\'s bothering ' ,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'CarterOne'),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0))),
                  child: SingleChildScrollView(
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title', style: kFormTitleTextStyle),
                          TextFormField(
                            onChanged: (value) {
                              title = value;
                            },
                            style: simpleTextStyle(),
                            // controller: usernameEditingController,
                            validator: (val) {
                              return val.isEmpty || val.length < 3
                                  ? "Enter Username 3+ characters"
                                  : null;
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 20),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(top: 15, bottom: 10),
                                ),
                                hintText: 'A short line',
                                hintStyle: TextStyle(color: Colors.black38),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black))),
                          ),
                          SizedBox(
                            height: 100.0,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                'Body',
                                style: kFormTitleTextStyle,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                'max (250 words)',
                                style: TextStyle(
                                    fontSize: 10.0, color: Color(0xFF7A8191)),
                              ),
                            ],
                          ),
                          TextFormField(
                            onChanged: (value) {
                              description = value;
                            },
                            style: simpleTextStyle(),
                            // controller: idEditingController,
                            validator: (val) {
                              return val.isEmpty || val.length < 3
                                  ? "Enter UserID 3+ characters"
                                  : null;
                            },
                            keyboardType: TextInputType.multiline,
                            minLines:
                            1, //Normal textInputField will be displayed
                            maxLines: 20,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 20),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 10),
                              ),
                              hintText: 'Describe your Problem',
                              hintStyle: TextStyle(color: Colors.black38),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff6DD8D2))),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                          Text('Tags', style: kFormTitleTextStyle),
                          InputTags(
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            tags: _tags,
                            suggestionsList: [
                              "Type 1 Diabetes",
                              "Type 2 Diabetes",
                              "Gestational Diabetes",
                              "Hemorrhoid",
                              "Lupus",
                              "Shingles",
                              "Herpes",
                              "Pneumonia",
                              "HPV",
                              "Fibromyalgia",
                              "Scabies",
                              "Bronchitis",
                              "Strep Throat",
                              "Shingles",
                              "Kidney Stones",
                              "Mouth Ulcer"
                            ],
                            popupMenuBuilder: _popupMenuBuilder,
                            popupMenuOnSelected: (int id, String tag) {
                              switch (id) {
                                case 1:
                                  Clipboard.setData(ClipboardData(text: tag));
                                  break;
                                case 2:
                                  setState(() {
                                    _tags.remove(tag);
                                  });
                              }
                            },
                            onDelete: (tag) => print(tag),
                            onInsert: (tag) => print(tag),
                          ),

                          Container(
                            height:
                            (images.length > 0) ? containerHeight : 10.0,
                            child: Expanded(
                              child: buildGridView(),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: loadAssets,
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Text(
                                'Upload Photos',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            onTap:loadAssets,
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Center(
                                  child: Text(
                                    'Add Product',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
