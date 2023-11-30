import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class Plug extends StatelessWidget {
  final String plugName, runningTime;
  final bool toggle;
  final int plugId;
  final double usedPower, assignPower;

  const Plug({
    super.key,
    required this.plugId,
    required this.plugName,
    required this.toggle,
    required this.runningTime,
    required this.usedPower,
    required this.assignPower,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: toggle ? 1.0 : 0.5,
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
                TitleText(
                  content: plugName,
                ),
                BoldText(
                  content: toggle ? 'On' : 'Off',
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
                  contentName: '할당량',
                  content: assignPower,
                  unit: 'Wh',
                ),
                PlugInfoWidget(
                  contentName: '소모량',
                  content: usedPower,
                  unit: 'Wh',
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
        NormalText(content: contentName),
        BoldText(content: '$content $unit'),
      ],
    );
  }
}
