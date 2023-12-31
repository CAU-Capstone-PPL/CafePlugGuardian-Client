import 'package:cafe_plug_guardian_client/models/date_time_model.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final int plugId, plugOffLogId, plugUseId;
  final String plugName, toggle;
  final DateTimeModel plugOffTime;
  final bool ownerCheck;
  const Alert(
      {super.key,
      required this.plugId,
      required this.plugOffLogId,
      required this.plugUseId,
      required this.plugName,
      required this.plugOffTime,
      required this.ownerCheck,
      required this.toggle});

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
                        children: [Text('plugId: $plugId'), Text(plugName)],
                      ),
                      const NormalText(content: '  플러그 전원을 차단합니다.'),
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
