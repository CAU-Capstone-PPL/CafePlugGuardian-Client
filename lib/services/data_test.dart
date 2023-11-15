const List<Map<String, dynamic>> dummyDataPlugCore = [
  {
    'plugId': 1,
    'plugName': 'Plug 1',
    'onOff': 'On',
    'runningTime': '2',
    'usedPower': 100,
    'assignPower': 150,
  },
  {
    'plugId': 3,
    'plugName': 'Plug 3',
    'onOff': 'On',
    'runningTime': '3',
    'usedPower': 120,
    'assignPower': 200,
  },
  {
    'plugId': 4,
    'plugName': 'Plug 4',
    'onOff': 'On',
    'runningTime': '1.5',
    'usedPower': 80,
    'assignPower': 110
  },
  {
    'plugId': 6,
    'plugName': 'Plug 6',
    'onOff': 'On',
    'runningTime': '2',
    'usedPower': 110,
    'assignPower': 150
  },
  {
    'plugId': 7,
    'plugName': 'Plug 7',
    'onOff': 'On',
    'runningTime': '2.5',
    'usedPower': 95,
    'assignPower': 130
  },
  {
    'plugId': 9,
    'plugName': 'Plug 9',
    'onOff': 'On',
    'runningTime': '4',
    'usedPower': 150,
    'assignPower': 180
  },
  {
    'plugId': 11,
    'plugName': 'Plug 11',
    'onOff': 'On',
    'runningTime': '3',
    'usedPower': 120,
    'assignPower': 160
  },
  {
    'plugId': 12,
    'plugName': 'Plug 12',
    'onOff': 'On',
    'runningTime': '1.5',
    'usedPower': 70,
    'assignPower': 100
  },
];

//더미데이터
const List<Map<String, dynamic>> dummyDataPlugDetail = [
  {
    'plugId': 1,
    'plugName': 'Plug 1',
    'onOff': 'On',
    'startTime': '08:00 AM',
    'runningTime': '2',
    'usedPower': 100,
    'assignPower': 150,
    'plugDescription': 'hello 1',
    'realTimePower': 200
  },
  {
    'plugId': 2,
    'plugName': 'Plug 2',
    'onOff': 'Off',
    'startTime': '',
    'runningTime': '',
    'usedPower': 0,
    'assignPower': 0,
    'plugDescription': 'hello 2',
    'realTimePower': 0
  },
  {
    'plugId': 3,
    'plugName': 'Plug 3',
    'onOff': 'On',
    'startTime': '03:45 PM',
    'runningTime': '3',
    'usedPower': 120,
    'assignPower': 200,
    'plugDescription': 'hello 3',
    'realTimePower': 50
  },
  {
    'plugId': 4,
    'plugName': 'Plug 4',
    'onOff': 'On',
    'startTime': '09:15 AM',
    'runningTime': '1.5',
    'usedPower': 80,
    'assignPower': 110,
    'plugDescription': 'hello 4',
    'realTimePower': 60
  },
  {
    'plugId': 5,
    'plugName': 'Plug 5',
    'onOff': 'Off',
    'startTime': '',
    'runningTime': '',
    'usedPower': 0,
    'assignPower': 0,
    'plugDescription': 'hello 5',
    'realTimePower': 0
  },
  {
    'plugId': 6,
    'plugName': 'Plug 6',
    'onOff': 'On',
    'startTime': '04:30 PM',
    'runningTime': '2',
    'usedPower': 110,
    'assignPower': 150,
    'plugDescription': 'hello 6',
    'realTimePower': 80
  },
  {
    'plugId': 7,
    'plugName': 'Plug 7',
    'onOff': 'On',
    'startTime': '11:45 AM',
    'runningTime': '2.5',
    'usedPower': 95,
    'assignPower': 130,
    'plugDescription': 'hello 7',
    'realTimePower': 120
  },
  {
    'plugId': 8,
    'plugName': 'Plug 8',
    'onOff': 'Off',
    'startTime': '',
    'runningTime': '',
    'usedPower': 0,
    'assignPower': 0,
    'plugDescription': 'hello 8',
    'realTimePower': 0
  },
  {
    'plugId': 9,
    'plugName': 'Plug 9',
    'onOff': 'On',
    'startTime': '06:00 AM',
    'runningTime': '4',
    'usedPower': 150,
    'assignPower': 180,
    'plugDescription': 'hello 9',
    'realTimePower': 210
  },
  {
    'plugId': 10,
    'plugName': 'Plug 10',
    'onOff': 'Off',
    'startTime': '',
    'runningTime': '',
    'usedPower': 0,
    'assignPower': 0,
    'plugDescription': 'hello 10',
    'realTimePower': 0
  },
  {
    'plugId': 11,
    'plugName': 'Plug 11',
    'onOff': 'On',
    'startTime': '07:30 AM',
    'runningTime': '3',
    'usedPower': 120,
    'assignPower': 160,
    'plugDescription': 'hello 11',
    'realTimePower': 211
  },
  {
    'plugId': 12,
    'plugName': 'Plug 12',
    'onOff': 'On',
    'startTime': '10:00 AM',
    'runningTime': '1.5',
    'usedPower': 70,
    'assignPower': 100,
    'plugDescription': 'hello 12',
    'realTimePower': 223
  },
  {
    'plugId': 13,
    'plugName': 'Plug 13',
    'onOff': 'Off',
    'startTime': '',
    'runningTime': '',
    'usedPower': 0,
    'assignPower': 0,
    'plugDescription': 'hello 13',
    'realTimePower': 0
  }
];

//더미데이터
const List<Map<String, dynamic>> dummyDataAlerts = [
  {
    'plugId': 1,
    'plugName': 'Plug 1',
    'blockingTime': '11-07 08:00 AM',
  },
  {
    'plugId': 2,
    'plugName': 'Plug 2',
    'blockingTime': '11-08 09:30 AM',
  },
  {
    'plugId': 3,
    'plugName': 'Plug 3',
    'blockingTime': '11-09 10:15 AM',
  },
  {
    'plugId': 4,
    'plugName': 'Plug 4',
    'blockingTime': '11-10 11:45 AM',
  },
  {
    'plugId': 5,
    'plugName': 'Plug 5',
    'blockingTime': '11-11 01:20 PM',
  },
  {
    'plugId': 6,
    'plugName': 'Plug 6',
    'blockingTime': '11-12 02:45 PM',
  },
  {
    'plugId': 7,
    'plugName': 'Plug 7',
    'blockingTime': '11-13 03:30 PM',
  },
  {
    'plugId': 8,
    'plugName': 'Plug 8',
    'blockingTime': '11-14 04:10 PM',
  },
  {
    'plugId': 9,
    'plugName': 'Plug 9',
    'blockingTime': '11-15 05:45 PM',
  },
  {
    'plugId': 10,
    'plugName': 'Plug 10',
    'blockingTime': '11-16 07:00 PM',
  },
  {
    'plugId': 11,
    'plugName': 'Plug 11',
    'blockingTime': '11-17 08:15 PM',
  },
  {
    'plugId': 12,
    'plugName': 'Plug 12',
    'blockingTime': '11-18 09:30 PM',
  },
  {
    'plugId': 13,
    'plugName': 'Plug 13',
    'blockingTime': '11-19 10:45 PM',
  },
];

//더미데이터
const List<Map<String, dynamic>> dummyDataPlugs = [
  {
    'plugId': 1,
    'plugName': 'Plug 1',
    'onOff': 'On',
    'runningTime': '2',
    'usedPower': 100,
    'assignPower': 150,
  },
  {
    'plugId': 2,
    'plugName': 'Plug 2',
    'onOff': 'Off',
    'runningTime': '',
    'usedPower': 0,
    'assignPower': 0,
  },
  {
    'plugId': 3,
    'plugName': 'Plug 3',
    'onOff': 'On',
    'runningTime': '3',
    'usedPower': 120,
    'assignPower': 200,
  },
  {
    'plugId': 4,
    'plugName': 'Plug 4',
    'onOff': 'On',
    'runningTime': '1.5',
    'usedPower': 80,
    'assignPower': 110,
  },
  {
    'plugId': 5,
    'plugName': 'Plug 5',
    'onOff': 'Off',
    'runningTime': '',
    'usedPower': 0,
    'assignPower': 0,
  },
  {
    'plugId': 6,
    'plugName': 'Plug 6',
    'onOff': 'On',
    'runningTime': '2',
    'usedPower': 110,
    'assignPower': 150,
  },
  {
    'plugId': 7,
    'plugName': 'Plug 7',
    'onOff': 'On',
    'runningTime': '2.5',
    'usedPower': 95,
    'assignPower': 130,
  },
  {
    'plugId': 8,
    'plugName': 'Plug 8',
    'onOff': 'Off',
    'runningTime': '',
    'usedPower': 0,
    'assignPower': 0,
  },
  {
    'plugId': 9,
    'plugName': 'Plug 9',
    'onOff': 'On',
    'runningTime': '4',
    'usedPower': 150,
    'assignPower': 180,
  },
  {
    'plugId': 10,
    'plugName': 'Plug 10',
    'onOff': 'Off',
    'runningTime': '',
    'usedPower': 0,
    'assignPower': 0,
  },
  {
    'plugId': 11,
    'plugName': 'Plug 11',
    'onOff': 'On',
    'runningTime': '3',
    'usedPower': 120,
    'assignPower': 160,
  },
  {
    'plugId': 12,
    'plugName': 'Plug 12',
    'onOff': 'On',
    'runningTime': '1.5',
    'usedPower': 70,
    'assignPower': 100,
  },
  {
    'plugId': 13,
    'plugName': 'Plug 13',
    'onOff': 'Off',
    'runningTime': '',
    'usedPower': 0,
    'assignPower': 0,
  }
];
const List<double> dummyDataWeeklyPowerData = [
  70.0,
  60.0,
  120.0,
  150.6,
  200.7,
  70.4,
  80.7
];
