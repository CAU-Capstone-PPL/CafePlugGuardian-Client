# CafePlugGuardian-Client

## CafePlugGuardian Project

### Introduction

CafePlugGuardian is a capstone design project at the Chung-Ang University's Department of Software Engineering.

Please note that we will not be accepting contributions for CafePlugGuardian, as it is a Capstone Design Project.

#### The Goal of CafePlugGuardian Project

1. The pin number allows only cafe customers to use the plug, preventing unauthorized use of the plug.
2. Limit the amount of electricity to restrict customers who use excessive power or stay for long periods of time.
3. By analyzing the current patterns of devices in use, devices not permitted in the cafe, such as smartphones and laptop chargers, are automatically blocked through machine learning.

### Structure of CafePlugGuardian

<img width="80%" src="https://github.com/CAU-Capstone-PPL/CafePlugGuardian-Server/assets/55429793/74940115-831a-49f7-ab9a-3d5dc402089a"/>

### Sub Projects of CafePlugGuardian

- [CafePlugGuardian-Client](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-Client)
  - Cafe Manager App - flutter app
- [CafePlugGuardian-WebClient](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-WebClient)
  - Cafe Customer Web - flutter web
- [CafePlugGuardian-Server](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-Server)
  - Backend server - express.js
- [CafePlugGuardian-Hardware](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-Hardware)
  - SmartPlug embedded system - arduino(tasmota open source)
- [CafePlugGuardian-ML](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-ML)
  - AI model - pytorch, GRU model
- [CafePlugGuardian-ML_Server_Flask](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-ML_Server_Flask)
  - AI server - flask

### Additional Requirements

- MongoDB
  - NoSQL DBMS
  - In our project, we install and use mongoDB on an ec2 instance.
  - Install and run mongoDB, or use a mongoDB server.
- MQTT Broker
  - In our project, we install and use mosquitto as an MQTT broker on an ec2 instance.
  - You can install another MQTT broker or use a separate broker server if you have one.


## CafePlugGuardian-Client
### Introduction
CafePlugGuardian-Client is a part of CafePlugGuardian project.

CafePlug Guardian-Client provides cafe managers with the following features.

- Add and manage plugs for cafe management.
- Monitor power consumption of plugs in the cafe:
  - Monitor power consumption of plugs in use by customers.
  - Monitor overall power consumption of all plugs in the cafe.
  - Monitor detailed power consumption for each plug.
- Check logs when abnormal devices are connected to plugs.
- Connect smart plugs.
- Manage cafe shop.

Through these features, the cafe manager can protect the plugs in the cafe.


### Development environment
- Language
  - Dart
  - Version: 3.1.0

- Framework
  - Flutter
  - Version: 3.13.2

- Development Tools
  - Android Studio
  - Visual Studio Code
  - Git

### How to use CafePlugGuardian-Client
1. Install Dart SDK

2. Install Flutter SDK

3. Install Android Studio or Visual Studio Code (optional)

4. Clone the Project

5. Install Dependencies

6. Connect Emulator or Device

7. Run the Application

#### If you want to change the API URL address to your backend server address, follow these instructions.
  - each dart file in lib/services has a baseUrl variable. Change that variable to 'your URL address/api'. 
  
  - ex) http://yourServerAddress/api


## License
This program is licensed under MIT
