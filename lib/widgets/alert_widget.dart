import 'package:cafe_plug_guardian_client/models/date_time_model.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final int plugId;
  final String plugName;
  final DateTimeModel blockingTime;
  final bool check;
  const Alert(
      {super.key,
      required this.plugId,
      required this.plugName,
      required this.blockingTime,
      required this.check});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.5),
        borderRadius: BorderRadius.circular(10),
        color: AppColor.background,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Opacity(
        opacity: check ? 0.5 : 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      image: AssetImage('assets/alert.png'),
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const BoldText(content: '허용하지 않는 기기연결'),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('plugId: $plugId'),
                          Text(plugName),
                          Text(
                              '${blockingTime.date.toString()} ${blockingTime.time.toString()}'),
                        ])
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColor.text,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
