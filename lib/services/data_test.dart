const List<Map<String, dynamic>> dummyDataPlugCore = [
  {
    "plugId": 101,
    "topic": "plug_101",
    "plugName": "plug101",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 3, "minutes": 15},
    "usedPower": 400.0,
    "assignPower": 600.0
  },
  {
    "plugId": 202,
    "topic": "plug_202",
    "plugName": "plug202",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0
  },
  {
    "plugId": 303,
    "topic": "plug_303",
    "plugName": "plug303",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 45},
    "usedPower": 250.0,
    "assignPower": 400.0
  },
  {
    "plugId": 404,
    "topic": "plug_404",
    "plugName": "plug404",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 0, "minutes": 15},
    "usedPower": 12.0,
    "assignPower": 900.0
  },
  {
    "plugId": 505,
    "topic": "plug_505",
    "plugName": "plug505",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0
  },
  {
    "plugId": 606,
    "topic": "plug_606",
    "plugName": "plug606",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 2, "minutes": 0},
    "usedPower": 300.0,
    "assignPower": 450.0
  },
  {
    "plugId": 707,
    "topic": "plug_707",
    "plugName": "plug707",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 30},
    "usedPower": 200.0,
    "assignPower": 300.0
  },
  {
    "plugId": 808,
    "topic": "plug_808",
    "plugName": "plug808",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 1, "minutes": 15},
    "usedPower": 130.2,
    "assignPower": 300.0
  },
  {
    "plugId": 909,
    "topic": "plug_909",
    "plugName": "plug909",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 2, "minutes": 15},
    "usedPower": 350.0,
    "assignPower": 500.0
  },
  {
    "plugId": 111,
    "topic": "plug_111",
    "plugName": "plug111",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0
  },
  {
    "plugId": 222,
    "topic": "plug_222",
    "plugName": "plug222",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 0},
    "usedPower": 250.0,
    "assignPower": 400.0
  },
  {
    "plugId": 333,
    "topic": "plug_333",
    "plugName": "plug333",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0
  }
];

//더미데이터
const List<Map<String, dynamic>> dummyDataPlugDetail = [
  {
    "plugId": 101,
    "topic": "plug_101",
    "plugName": "plug101",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 3, "minutes": 15},
    "usedPower": 400.0,
    "assignPower": 600.0,
    "plugDescription": "Near the entrance",
    "startTime": {"hours": 2, "minutes": 45},
    "realTimePower": 7.5
  },
  {
    "plugId": 202,
    "topic": "plug_202",
    "plugName": "plug202",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "Next to the counter",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 303,
    "topic": "plug_303",
    "plugName": "plug303",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 45},
    "usedPower": 250.0,
    "assignPower": 400.0,
    "plugDescription": "By the window",
    "startTime": {"hours": 3, "minutes": 30},
    "realTimePower": 8.8
  },
  {
    "plugId": 404,
    "topic": "plug_404",
    "plugName": "plug404",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 0, "minutes": 50},
    "usedPower": 150.0,
    "assignPower": 900.0,
    "plugDescription": "Back corner",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 1.2
  },
  {
    "plugId": 505,
    "topic": "plug_505",
    "plugName": "plug505",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "Opposite the counter",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 606,
    "topic": "plug_606",
    "plugName": "plug606",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 3, "minutes": 5},
    "usedPower": 380.0,
    "assignPower": 450.0,
    "plugDescription": "By the door",
    "startTime": {"hours": 1, "minutes": 0},
    "realTimePower": 8.5
  },
  {
    "plugId": 707,
    "topic": "plug_707",
    "plugName": "plug707",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 30},
    "usedPower": 200.0,
    "assignPower": 300.0,
    "plugDescription": "By the wall",
    "startTime": {"hours": 0, "minutes": 45},
    "realTimePower": 8.0
  },
  {
    "plugId": 808,
    "topic": "plug_808",
    "plugName": "plug808",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 1, "minutes": 15},
    "usedPower": 130.2,
    "assignPower": 300.0,
    "plugDescription": "Near the restroom",
    "startTime": {"hours": 3, "minutes": 15},
    "realTimePower": 0.0
  },
  {
    "plugId": 909,
    "topic": "plug_909",
    "plugName": "plug909",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 2, "minutes": 15},
    "usedPower": 350.0,
    "assignPower": 500.0,
    "plugDescription": "By the bookshelf",
    "startTime": {"hours": 1, "minutes": 15},
    "realTimePower": 9.5
  },
  {
    "plugId": 111,
    "topic": "plug_111",
    "plugName": "plug111",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "In the middle",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 222,
    "topic": "plug_222",
    "plugName": "plug222",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 0},
    "usedPower": 250.0,
    "assignPower": 400.0,
    "plugDescription": "By the plant",
    "startTime": {"hours": 3, "minutes": 45},
    "realTimePower": 7.7
  },
  {
    "plugId": 333,
    "topic": "plug_333",
    "plugName": "plug333",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "Near the outlet",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  }
];

//더미데이터
const List<Map<String, dynamic>> dummyDataChanged = [
  {
    "plugId": 101,
    "topic": "plug_101",
    "plugName": "plug101",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 4, "minutes": 32},
    "usedPower": 480.0,
    "assignPower": 600.0,
    "plugDescription": "Near the entrance",
    "startTime": {"hours": 2, "minutes": 45},
    "realTimePower": 7.5
  },
  {
    "plugId": 202,
    "topic": "plug_202",
    "plugName": "plug202",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "Next to the counter",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 303,
    "topic": "plug_303",
    "plugName": "plug303",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 2, "minutes": 15},
    "usedPower": 320.0,
    "assignPower": 400.0,
    "plugDescription": "By the window",
    "startTime": {"hours": 3, "minutes": 30},
    "realTimePower": 8.8
  },
  {
    "plugId": 404,
    "topic": "plug_404",
    "plugName": "plug404",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 300.0,
    "assignPower": 900.0,
    "plugDescription": "Back corner",
    "startTime": {"hours": 1, "minutes": 15},
    "realTimePower": 0.2
  },
  {
    "plugId": 505,
    "topic": "plug_505",
    "plugName": "plug505",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 3, "minutes": 5},
    "usedPower": 380.0,
    "assignPower": 450.0,
    "plugDescription": "By the door",
    "startTime": {"hours": 1, "minutes": 0},
    "realTimePower": 8.5
  },
  {
    "plugId": 606,
    "topic": "plug_606",
    "plugName": "plug606",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 3, "minutes": 5},
    "usedPower": 380.0,
    "assignPower": 450.0,
    "plugDescription": "By the door",
    "startTime": {"hours": 1, "minutes": 0},
    "realTimePower": 8.5
  },
  {
    "plugId": 707,
    "topic": "plug_707",
    "plugName": "plug707",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 2, "minutes": 15},
    "usedPower": 270.0,
    "assignPower": 300.0,
    "plugDescription": "By the wall",
    "startTime": {"hours": 1, "minutes": 45},
    "realTimePower": 8.0
  },
  {
    "plugId": 808,
    "topic": "plug_808",
    "plugName": "plug808",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 1, "minutes": 15},
    "usedPower": 130.2,
    "assignPower": 300.0,
    "plugDescription": "Near the restroom",
    "startTime": {"hours": 3, "minutes": 15},
    "realTimePower": 0.0
  },
  {
    "plugId": 909,
    "topic": "plug_909",
    "plugName": "plug909",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 3, "minutes": 0},
    "usedPower": 430.0,
    "assignPower": 500.0,
    "plugDescription": "By the bookshelf",
    "startTime": {"hours": 1, "minutes": 15},
    "realTimePower": 9.5
  },
  {
    "plugId": 111,
    "topic": "plug_111",
    "plugName": "plug111",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "In the middle",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 222,
    "topic": "plug_222",
    "plugName": "plug222",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 30},
    "usedPower": 290.0,
    "assignPower": 400.0,
    "plugDescription": "By the plant",
    "startTime": {"hours": 3, "minutes": 45},
    "realTimePower": 7.7
  },
  {
    "plugId": 333,
    "topic": "plug_333",
    "plugName": "plug333",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "Near the outlet",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
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

const List<double> dummyDataWeeklyPowerData = [
  70.0,
  60.0,
  120.0,
  150.6,
  200.7,
  70.4,
  80.7
];
