import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data.dart';

class schedulePage extends StatefulWidget {
  @override
  _schedulePageState createState() => _schedulePageState();
}

class _schedulePageState extends State<schedulePage> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    String selectedGroup = arguments['selectedGroup'];
    ScheduleData scheduleData = ScheduleData();
    GroupSchedule groupSchedule =
        scheduleData.getScheduleForGroup(selectedGroup);

    int i = 0;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 120,
            width: double.infinity,
           
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: returnBtn(),
                    ),
                  ],
                ),
                topRow(),
              ],
            ),
          ),
          Container(
            height: 700,
            width: double.infinity,
           
            child: Flexible(
                child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                    itemBuilder: (BuildContext context, int index) {
                      DaySchedule daySchedule =
                          groupSchedule.getScheduleForDay(index);
                      List<Subject> subjects = daySchedule.getSubjects();
                      String printDay(e) {
                        if (i == e) {
                          i = i + 1;
                          return daySchedule.getDayName();
                        }
                        return '';
                      }

                      ;
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.grey),
                        child: Column(
                          children: subjects.map((subject) {
                            int subjectOrder = subject.getOrder();
                            return Row(
                              children: [
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Text(
                                      printDay(index),
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  width: 120,
                                ),
                                SizedBox(
                                  child: Text(
                                    scheduleData
                                        .getTimeForSubject(subjectOrder),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 55,
                                ),
                                Text(
                                  '\t\t ${subject.getName()}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          color: Colors.black,
                          height: 50,
                        ),
                    itemCount: 5)),
          ),
        ],
      ),
    ));
  }

  Widget topRow() {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    String selectedGroup = arguments['selectedGroup'];

    return Row(
      children: [
        Row(
          children: <Widget>[
            SizedBox(width: 8.0),
            Text(
              'Your schedule',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Spacer(),
        Text(
          selectedGroup,
          style: TextStyle(
              color: Colors.black45,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget returnBtn() {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.transparent),
        //padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ));
  }
}
