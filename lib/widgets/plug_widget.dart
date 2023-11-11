import 'package:cafe_plug_guardian_client/screens/plug_detail_screens.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class Plug extends StatelessWidget {
  final String plugId, plugName, onOff, runningTime, usedPower, assignPower;

  const Plug({
    super.key,
    required this.plugId,
    required this.plugName,
    required this.onOff,
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
      child: Opacity(
        opacity: onOff == 'On' ? 1.0 : 0.5,
        child: Container(
          width: 170,
          height: 150.0,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.text),
            color: AppColor.background,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: const Offset(3, 3),
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
                  Text(
                    onOff,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.text),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PlugInfoWidget(
                    contentName: '할당전력량',
                    content: assignPower,
                    unit: 'W',
                  ),
                  PlugInfoWidget(
                    contentName: '누적소모량',
                    content: usedPower,
                    unit: 'W',
                  ),
                  PlugInfoWidget(
                    contentName: '이용시간',
                    content: runningTime,
                    unit: 'h',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlugInfoWidget extends StatelessWidget {
  const PlugInfoWidget({
    super.key,
    required this.contentName,
    required this.content,
    required this.unit,
  });

  final String contentName;
  final dynamic content;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          contentName,
          style: const TextStyle(fontSize: 16, color: AppColor.text),
        ),
        Text(
          '$content $unit',
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.text),
        ),
      ],
    );
  }
}
