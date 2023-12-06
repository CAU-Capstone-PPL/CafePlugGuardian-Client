const List<Map<String, dynamic>> dummyDataPlugCore = [
  {
    "plugId": 101,
    "topic": "plug_101",
    "plugName": "plug101",
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
    "runningTime": {"hours": 3, "minutes": 15},
    "usedPower": 400.0,
    "assignPower": 600.0
  },
  {
    "plugId": 202,
    "topic": "plug_202",
    "plugName": "plug202",
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0
  },
  {
    "plugId": 303,
    "topic": "plug_303",
    "plugName": "plug303",
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
    "runningTime": {"hours": 1, "minutes": 45},
    "usedPower": 250.0,
    "assignPower": 400.0
  },
  {
    "plugId": 404,
    "topic": "plug_404",
    "plugName": "plug404",
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
    "runningTime": {"hours": 0, "minutes": 15},
    "usedPower": 12.0,
    "assignPower": 900.0
  },
  {
    "plugId": 505,
    "topic": "plug_505",
    "plugName": "plug505",
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
    "runningTime": {"hours": 4, "minutes": 0},
    "usedPower": 450.0,
    "assignPower": 450.0
  },
  {
    "plugId": 606,
    "topic": "plug_606",
    "plugName": "plug606",
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
    "runningTime": {"hours": 2, "minutes": 0},
    "usedPower": 300.0,
    "assignPower": 450.0
  },
  {
    "plugId": 707,
    "topic": "plug_707",
    "plugName": "plug707",
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
    "runningTime": {"hours": 1, "minutes": 30},
    "usedPower": 200.0,
    "assignPower": 300.0
  },
  {
    "plugId": 808,
    "topic": "plug_808",
    "plugName": "plug808",
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
    "runningTime": {"hours": 1, "minutes": 15},
    "usedPower": 130.2,
    "assignPower": 300.0
  },
  {
    "plugId": 909,
    "topic": "plug_909",
    "plugName": "plug909",
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
    "runningTime": {"hours": 2, "minutes": 15},
    "usedPower": 350.0,
    "assignPower": 500.0
  },
  {
    "plugId": 111,
    "topic": "plug_111",
    "plugName": "plug111",
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0
  },
  {
    "plugId": 222,
    "topic": "plug_222",
    "plugName": "plug222",
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
    "runningTime": {"hours": 1, "minutes": 0},
    "usedPower": 250.0,
    "assignPower": 400.0
  },
  {
    "plugId": 333,
    "topic": "plug_333",
    "plugName": "plug333",
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
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
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
    "runningTime": {"hours": 4, "minutes": 0},
    "usedPower": 450.0,
    "assignPower": 450.0,
    "plugDescription": "Opposite the counter",
    "startTime": {"hours": 4, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 606,
    "topic": "plug_606",
    "plugName": "plug606",
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
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
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
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
    "useStatus": true,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": true,
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
    "useStatus": false,
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "toggle": false,
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
    "plugId": 101,
    "plugName": "Plug 101",
    "plugOffTime": {
      "date": {"day": 1, "month": 12, "year": 2023},
      "time": {"hours": 10, "minutes": 30}
    },
    "ownerCheck": true,
    "isToggleOn": false
  },
  {
    "plugId": 202,
    "plugName": "Plug 202",
    "plugOffTime": {
      "date": {"day": 2, "month": 12, "year": 2023},
      "time": {"hours": 12, "minutes": 45}
    },
    "ownerCheck": false,
    "isToggleOn": true
  },
  {
    "plugId": 101,
    "plugName": "Plug 101",
    "plugOffTime": {
      "date": {"day": 3, "month": 12, "year": 2023},
      "time": {"hours": 14, "minutes": 15}
    },
    "ownerCheck": true,
    "isToggleOn": true
  },
  {
    "plugId": 101,
    "plugName": "Plug 101",
    "plugOffTime": {
      "date": {"day": 4, "month": 12, "year": 2023},
      "time": {"hours": 16, "minutes": 30}
    },
    "ownerCheck": false,
    "isToggleOn": false
  },
  {
    "plugId": 505,
    "plugName": "Plug 505",
    "plugOffTime": {
      "date": {"day": 5, "month": 12, "year": 2023},
      "time": {"hours": 18, "minutes": 45}
    },
    "ownerCheck": true,
    "isToggleOn": true
  },
  {
    "plugId": 606,
    "plugName": "Plug 606",
    "plugOffTime": {
      "date": {"day": 6, "month": 12, "year": 2023},
      "time": {"hours": 20, "minutes": 0}
    },
    "ownerCheck": false,
    "isToggleOn": false
  },
  {
    "plugId": 707,
    "plugName": "Plug 707",
    "plugOffTime": {
      "date": {"day": 7, "month": 12, "year": 2023},
      "time": {"hours": 22, "minutes": 15}
    },
    "ownerCheck": true,
    "isToggleOn": true
  },
  {
    "plugId": 808,
    "plugName": "Plug 808",
    "plugOffTime": {
      "date": {"day": 8, "month": 12, "year": 2023},
      "time": {"hours": 23, "minutes": 30}
    },
    "ownerCheck": false,
    "isToggleOn": false
  },
  {
    "plugId": 909,
    "plugName": "Plug 909",
    "plugOffTime": {
      "date": {"day": 9, "month": 12, "year": 2023},
      "time": {"hours": 1, "minutes": 45}
    },
    "ownerCheck": true,
    "isToggleOn": true
  },
  {
    "plugId": 111,
    "plugName": "Plug 111",
    "plugOffTime": {
      "date": {"day": 10, "month": 12, "year": 2023},
      "time": {"hours": 3, "minutes": 0}
    },
    "ownerCheck": false,
    "isToggleOn": false
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

List<Map<String, dynamic>> cafeMenuData = [
  {
    'id': 1,
    'name': 'Espresso',
    'description': 'Strong black coffee',
    'price': 3,
  },
  {
    'id': 2,
    'name': 'Cappuccino',
    'description': 'Espresso with frothy milk',
    'price': 4,
  },
  {
    'id': 3,
    'name': 'Latte',
    'description': 'Espresso with steamed milk',
    'price': 4,
  },
  {
    'id': 4,
    'name': 'Croissant',
    'description': 'Flaky pastry with buttery layers',
    'price': 3,
  },
  {
    'id': 5,
    'name': 'Blueberry Muffin',
    'description': 'muffin with blueberries',
    'price': 2,
  },
  {
    'id': 6,
    'name': 'Avocado Toast',
    'description': 'Toasted bread with mashed avocado',
    'price': 6,
  },
  // Add more cafe items as needed
];
