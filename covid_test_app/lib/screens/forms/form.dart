import 'dart:ffi';
import 'package:covid_test_app/shared/loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';


var question_i= 0;

List<String> questionList = [
  "Do you have any of the following symptoms: severe difficulty breathing, chest pain, confusion, extreme drowsiness or loss of consciousness?",
  "Do you  have shortness of breath at rest or difficulty breathing when lying down?",
  "Do you have any of the following symptoms: fever, cough, sore throat, shortness of breath, runny nose or diarrhea?",
  "Have you been in contact in the last 14 days with someone that is confirmed to have COVID-19?",
  "Have you been in a large group in the last 14 days where someone has been confirmed to have COVID-19, such as at a large meeting or event?",
  "Have you travelled to a foreign country in the past 14 days?",
  "Have you had close contact with someone who has been tested for COVID-19 and doesn’t know the results of the test yet?",
];

displayBackBtn(){
  if(question_i==0){

  }
}

class FormScreen extends StatefulWidget {
  final Function toggleView;
  FormScreen({this.toggleView});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class FormScreenTopPart extends StatefulWidget {
  final Function toggleView;
  FormScreenTopPart({this.toggleView});

  @override
  _FormScreenTopPart createState() => _FormScreenTopPart();
}

class _FormScreenTopPart extends State<FormScreenTopPart> {
  var progressint = (question_i+1) / questionList.length;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)
          ),
          child:Container(
            height:330.0,
            color: Colors.orange,
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 30.0),
                      Icon(
                        Icons.navigate_before,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      SizedBox(width: 10.0),
                      Text('Cancel',style: TextStyle(color: Colors.white,fontSize: 14.0)),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 35.0),
                    Text('Question ${question_i+1}/${questionList.length}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.0))
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 35.0),
                        Container(
                          width: 200,
                          child: LinearProgressIndicator(
                            value: progressint,
                            backgroundColor: Colors.white,
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF193A4D)),
                          )
                        )
                    ],
                ),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width:35.0),
                    SizedBox(
                      child: Text('${questionList[question_i]}',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
                      width: 300,
                      height: 150
                    )
                  ],
                )
              ],
            )
        ),)],
    );
  }
}

var FormButtons = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            child: Text(
                'YES',
                style: TextStyle(
                color: Color(0xFF022539),
                fontWeight: FontWeight.bold,
                fontSize: 20
            )),
            minWidth: 300,
            color: Colors.white,
            highlightElevation: 16.0,
            onPressed: () {},
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            child: Text(
                'NO',
                style: TextStyle(
                    color: Color(0xFF022539),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                )),
            minWidth: 300,
            color: Colors.white,
            highlightElevation: 16.0,
            onPressed: () {},
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            child: Text(
                'UNSURE',
                style: TextStyle(
                    color: Color(0xFF022539),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                )),
            minWidth: 300,
            color: Colors.white,
            highlightElevation: 16.0,
            onPressed: () {},
          ),
        ],
      ),
    ),
  ],
);

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  bool showbackbtn = false;
  bool shownextbtn = true;
  bool shownfinbtn = false;


  bool showBackBtn(){
    if (question_i != 0){
      showbackbtn = true;
    } else {
      showbackbtn = false;
    }

    return showbackbtn;
  }

  bool showNextBtn(){
    if (question_i+1 != questionList.length){
      shownextbtn = true;
    } else {
      shownextbtn = false;
    }

    return shownextbtn;
  }

  bool showFinBtn(){
    if (question_i+1 == questionList.length){
      shownfinbtn = true;
    } else {
      shownfinbtn = false;
    }

    return shownfinbtn;
  }
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Container (
          child: Column(
            children: <Widget>[
              FormScreenTopPart(),
              SizedBox(height: 80.0),
              FormButtons,
              SizedBox(height: 40.0),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 45.0),
                      //check if at question #1
                      Opacity(
                        opacity: showBackBtn() ? 1 : 0,
                        child: MaterialButton(
                            child: Text(
                                'Back',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                )),
                            minWidth: 80,
                            color: Color(0xFF022539),
                            highlightElevation: 16.0,
                            onPressed: () {
                              if(question_i!=0){
                                question_i -= 1;
                                Navigator.pop(context);
                              }
                            },
                            shape: StadiumBorder(),
                        )
                      ),
                      SizedBox(width: 140.0),
                      Visibility(
                        visible: showNextBtn(),
                        child: MaterialButton(
                          child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14
                              )),
                          minWidth: 80,
                          color: Color(0xFF022539),
                          highlightElevation: 16.0,
                          onPressed: () {
                            question_i += 1;
                            print(question_i);
                            Navigator
                                .push(
                              context,
                              new MaterialPageRoute(builder: (context) => new FormScreen()),
                            );
                          },
                          shape: StadiumBorder(),
                        ),
                      ),
                      Visibility(
                        visible: showFinBtn(),
                        child: MaterialButton(
                          child: Text(
                              'FINISH',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              )),
                          minWidth: 80,
                          color: Colors.orange,
                          highlightElevation: 16.0,
                          onPressed: () {
                            //insert submit function
                          },
                          shape: StadiumBorder(),
                        ),
                      )
                    ],
                  )
              )
            ],
          )
      ),
    );
  }
}