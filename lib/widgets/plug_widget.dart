import 'package:cafe_plug_guardian_client/screens/plug_detail_screens.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class Plug extends StatelessWidget {
  final String plugId,
      plugName,
      onOff,
      startTime,
      runningTime,
      usedPower,
      assignPower;

  const Plug({
    super.key,
    required this.plugId,
    required this.plugName,
    required this.onOff,
    required this.startTime,
    required this.runningTime,
    required this.usedPower,
    required this.assignPower,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlugDetailScreen(id: plugId),
          ),
        );
      },
      child: Container(
        width: 180,
        height: 300,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.text),
          color: AppColor.background,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(5, 5),
              color: Colors.black.withOpacity(0.3),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  plugName,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.text),
                ),
                Text(onOff),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('사용시작시간'),
                    Text(startTime),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('이용 시간'),
                    Text(runningTime),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('사용한 전력량'),
                    Text(usedPower),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('할당 전력량'),
                    Text(assignPower),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
