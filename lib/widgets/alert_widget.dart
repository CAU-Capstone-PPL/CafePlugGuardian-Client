import 'package:cafe_plug_guardian_client/models/date_time_model.dart';
import 'package:cafe_plug_guardian_client/screens/alert_by_plug_id.dart';
import 'package:cafe_plug_guardian_client/screens/plug_detail_screens.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final int plugId;
  final String plugName;
  final DateTimeModel plugOffTime;
  final bool ownerCheck, isToggleOn;
  const Alert(
      {super.key,
      required this.plugId,
      required this.plugName,
      required this.plugOffTime,
      required this.ownerCheck,
      required this.isToggleOn});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(5, 5),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Opacity(
        opacity: ownerCheck ? 0.5 : 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Image(
                        image: AssetImage('assets/Blocking.png'),
                        width: 20,
                      ),
                      SizedBox(width: 10),
                      BoldText(content: '비허용 기기 연결'),
                    ],
                  ),
                  CaptionText(
                      content:
                          '${plugOffTime.date.toString()} ${plugOffTime.time.toString()}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          NormalText(content: 'plugId: $plugId'),
                          NormalText(content: plugName)
                        ],
                      ),
                      const NormalText(content: '   플러그 전원을 차단합니다.'),
                    ],
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColor.text,
                    size: 30,
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
