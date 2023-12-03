import 'package:cafe_plug_guardian_client/models/time_model.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class Plug extends StatelessWidget {
  final int plugId;
  final String plugName;
  final bool toggle, useStatus;
  final TimeModel runningTime;
  final double usedPower, assignPower;
  const Plug({
    super.key,
    required this.plugId,
    required this.plugName,
    required this.toggle,
    required this.useStatus,
    required this.runningTime,
    required this.usedPower,
    required this.assignPower,
  });

  @override
  Widget build(BuildContext context) {
    double fillRatio = assignPower == 0.0
        ? assignPower
        : (assignPower - usedPower) / assignPower;
    return Opacity(
      opacity: toggle ? 1.0 : 0.5,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.background,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(5, 5),
              color: Colors.black.withOpacity(0.3),
            ),
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
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const NormalText(content: '전력량 '),
                Stack(
                  children: [
                    Container(
                      height: 10, // Adjust the height of the bar
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          colors: [
                            AppColor.text,
                            _getColor(fillRatio)
                          ], // You can use different colors here
                        ),
                      ),
                      width:
                          MediaQuery.of(context).size.width * 0.3 * fillRatio,
                    ),
                    Container(
                      height: 10, // Adjust the height of the bar
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                PlugInfoWidget(
                  contentName: '',
                  content: assignPower,
                  unit: 'Wh',
                ),
              ],
            ),
            PlugInfoWidget(
              contentName: '이용시간',
              content: runningTime,
              unit: '',
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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        NormalText(content: contentName),
        BoldText(content: ' $content '),
        CaptionText(content: unit),
      ],
    );
  }
}

Color _getColor(double fillRatio) {
  if (fillRatio >= 0.6) {
    return AppColor.main; // Green when fillRatio is between 60 and 100
  } else if (fillRatio >= 0.3) {
    return Colors.yellow; // Yellow when fillRatio is between 30 and 60
  } else {
    return Colors.red; // Red when fillRatio is between 0 and 30
  }
}
