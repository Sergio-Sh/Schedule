import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String login;
  late List<String> groups;
  String? selectedGroup;

  _HomePageState() {
    ScheduleData scheduleData = ScheduleData();
    groups = scheduleData.getGroupsNames();
  }

  Widget buildBackBtn() {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
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

  Widget buildScheduleBtn() {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
          color: Colors.black),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/schedule',
              arguments: {'selectedGroup': selectedGroup});
        },
        child: Text(
          'To Schedule',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    setState(() {
      login = arguments['login'];
    });

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: buildBackBtn(),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
               
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome\n' + login,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 100
                      ),
                      SizedBox(
                        width: 200,
                        child: DropdownButtonFormField<String>(
                          value: selectedGroup,
                          style:
                              TextStyle(fontSize: 14, color: Colors.black),
                          decoration: InputDecoration(
                              labelText: 'Select group...',
                              contentPadding: EdgeInsets.all(5)),
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
                          items: groups
                              .map((group) => DropdownMenuItem(
                                    value: group,
                                    child: Text(group),
                                  ))
                              .toList(),
                          onChanged: (String? newGroup) {
                            setState(() {
                              selectedGroup = newGroup;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 200,
                      ),
                      selectedGroup == null
                          ? SizedBox.shrink()
                          : buildScheduleBtn(),
                      SizedBox(
                        height: 400,
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
