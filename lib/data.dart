enum Day { sunday, monday, tuesday, wednesday, thursday, friday, saturday }

class Subject {
  Subject(this._subjectRaw);

  final Map _subjectRaw;

  String getName() {
    return _subjectRaw['name'];
  }

  int getOrder() {
    return _subjectRaw['order'];
  }

  String? getLink() {
    return _subjectRaw['link'];
  }
}

class DaySchedule {
  DaySchedule(this._dayScheduleRaw);

  final Map _dayScheduleRaw;

  String getDayIndex() {
    return _dayScheduleRaw['day'];
  }

  String getDayName() {
    String name = Day.values[_dayScheduleRaw['day']].name;
    return name[0].toUpperCase() + name.substring(1);
  }

  List<Subject> getSubjects() {
    List<Subject> subjects =
        (_dayScheduleRaw['subjects'] as List).map((s) => Subject(s)).toList();
    subjects.sort((s1, s2) => s1.getOrder() - s2.getOrder());
    return subjects;
  }
}

class GroupSchedule {
  GroupSchedule(this._groupScheduleRaw);

  final List _groupScheduleRaw;

  DaySchedule getScheduleForDay(int dayIndex) {
    return DaySchedule(_groupScheduleRaw[dayIndex]);
  }
}

class ScheduleData {
  ScheduleData();

  List<String> getGroupsNames() {
    return _dataRaw.keys.toList() as List<String>;
  }

  GroupSchedule getScheduleForGroup(String groupName) {
    return GroupSchedule(_dataRaw[groupName]!);
  }

  String getTimeForSubject(int subjectOrder) {
    List<int> time = _orderToTime[subjectOrder]!;
    return '${time[0]}:${time[1]}';
  }

  final Map<int, List<int>> _orderToTime = {
    1: [8, 30],
    2: [10, 20],
    3: [12, 10],
    4: [14, 15],
    5: [17, 10],
    6: [18, 40],
    7: [20, 20],
  };

  final Map<String, List> _dataRaw = {
    "CE-41": [
      {
        'day': 1,
        'subjects': [
          {'name': 'Software Engineering', 'order': 4, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 6, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 2,
        'subjects': [
          {'name': 'Operating Systems', 'order': 1, 'link': 'fakeLink'},
          {'name': 'Algorithms', 'order': 3, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 3,
        'subjects': [
          {'name': 'Software Engineering', 'order': 4, 'link': 'fakeLink'},
          {'name': 'Testing', 'order': 5, 'link': 'fakeLink'},
          {'name': 'Databases', 'order': 6, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 4,
        'subjects': [
          {'name': 'Databases', 'order': 4, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 6, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 5,
        'subjects': [
          {'name': 'Operating Systems', 'order': 1, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 3, 'link': 'fakeLink'},
          {'name': 'Testing', 'order': 5, 'link': 'fakeLink'},
        ]
      },
    ],
    "CE-42": [
      {
        'day': 1,
        'subjects': [
          {'name': 'Software Engineering', 'order': 4, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 2,
        'subjects': [
          {'name': 'Operating Systems', 'order': 1, 'link': 'fakeLink'},
          {'name': 'Algorithms', 'order': 3, 'link': 'fakeLink'},
          {'name': 'Databases', 'order': 4, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 3,
        'subjects': [
          {'name': 'Testing', 'order': 5, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 3, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 6, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 4,
        'subjects': [
          {'name': 'Software Engineering', 'order': 4, 'link': 'fakeLink'},
          {'name': 'Databases', 'order': 6, 'link': 'fakeLink'},
          {'name': 'Testing', 'order': 5, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 5,
        'subjects': [
          {'name': 'Operating Systems', 'order': 1, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 6, 'link': 'fakeLink'},
        ]
      },
    ],
    "CE-43": [
      {
        'day': 1,
        'subjects': [
          {'name': 'Operating Systems', 'order': 1, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 3, 'link': 'fakeLink'},
          {'name': 'Software Engineering', 'order': 4, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 2,
        'subjects': [
          {'name': 'Algorithms', 'order': 3, 'link': 'fakeLink'},
          {'name': 'Databases', 'order': 4, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 3,
        'subjects': [
          {'name': 'Testing', 'order': 5, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 6, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 4,
        'subjects': [
          {'name': 'Software Engineering', 'order': 4, 'link': 'fakeLink'},
          {'name': 'Databases', 'order': 6, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 5,
        'subjects': [
          {'name': 'Operating Systems', 'order': 1, 'link': 'fakeLink'},
          {'name': 'Testing', 'order': 5, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 6, 'link': 'fakeLink'},
        ]
      },
    ],
    "CE-44": [
      {
        'day': 1,
        'subjects': [
          {'name': 'Computer Networks', 'order': 3, 'link': 'fakeLink'},
          {'name': 'Software Engineering', 'order': 4, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 2,
        'subjects': [
          {'name': 'Algorithms', 'order': 3, 'link': 'fakeLink'},
          {'name': 'Databases', 'order': 4, 'link': 'fakeLink'},
          {'name': 'Operating Systems', 'order': 1, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 3,
        'subjects': [
          {'name': 'Testing', 'order': 5, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 6, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 4,
        'subjects': [
          {'name': 'Algorithms', 'order': 3, 'link': 'fakeLink'},
          {'name': 'Computer Networks', 'order': 6, 'link': 'fakeLink'},
        ]
      },
      {
        'day': 5,
        'subjects': [
          {'name': 'Operating Systems', 'order': 1, 'link': 'fakeLink'},
          {'name': 'Software Engineering', 'order': 4, 'link': 'fakeLink'},
          {'name': 'Databases', 'order': 6, 'link': 'fakeLink'},
          {'name': 'Testing', 'order': 5, 'link': 'fakeLink'},
        ]
      },
    ],
  };
}
