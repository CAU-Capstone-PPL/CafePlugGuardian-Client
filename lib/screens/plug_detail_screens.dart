import 'dart:async';
import 'dart:math';
import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/provider/plug_detail_provider.dart';
import 'package:cafe_plug_guardian_client/screens/alert_by_plug_id.dart';
import 'package:cafe_plug_guardian_client/screens/power_graph_screen.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/page_entry_button_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/plug_power_info.dart';
import 'package:cafe_plug_guardian_client/widgets/power_entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlugDetailScreen extends StatefulWidget {
  final int id;
  const PlugDetailScreen({super.key, required this.id});

  @override
  State<PlugDetailScreen> createState() => _PlugDetailScreenState();
}

class _PlugDetailScreenState extends State<PlugDetailScreen> {
  late String plugOnOff;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    //plug = ApiPlug.getPlugById(widget.id);
  }

  void _startTimer() {
    context.read<PlugDetailProvider>().updatePlug(widget.id);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      context.read<PlugDetailProvider>().updatePlug(widget.id);
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double fillRatio =
        context.watch<PlugDetailProvider>().plug!.assignPower == 0.0
            ? context.watch<PlugDetailProvider>().plug!.assignPower
            : context.watch<PlugDetailProvider>().plug!.usedPower /
                context.watch<PlugDetailProvider>().plug!.assignPower;

    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.background,
        title: const AppBarText(content: '플러그 상세 페이지'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _stopTimer();
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeadingText(content: '플러그 정보'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                      iconSize: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    //border: Border.all(color: AppColor.text, width: 1.5),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                        color: Colors.black.withOpacity(0.3),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText(content: '플러그 ID: ${widget.id}'),
                            BoldText(
                                content: context
                                    .read<PlugDetailProvider>()
                                    .plug!
                                    .plugName),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage('assets/smartPlug.png'),
                                width: 100,
                              ),
                            ),
                            BoldText(
                                content: context
                                        .watch<PlugDetailProvider>()
                                        .plug!
                                        .toggle
                                    ? 'On'
                                    : 'Off'),
                            CustomButton(
                                content: context
                                        .watch<PlugDetailProvider>()
                                        .plug!
                                        .toggle
                                    ? 'Off'
                                    : 'On',
                                onPressed: () {
                                  if (context
                                      .watch<PlugDetailProvider>()
                                      .plug!
                                      .toggle) {
                                    ApiPlug.patchPlugOff(widget.id);
                                  } else {
                                    ApiPlug.patchPlugOn(widget.id);
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            CaptionText(
                              content: context
                                  .read<PlugDetailProvider>()
                                  .plug!
                                  .plugDescription,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  width: 170,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200],
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  height: 170,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CustomPaint(
                                    painter:
                                        CircularGraphPainter(ratio: fillRatio),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const CaptionText(content: '실시간 전력량'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TitleText(
                                            content:
                                                '${context.watch<PlugDetailProvider>().plug!.realTimePower}'),
                                        const CaptionText(content: ' Wh'),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const NormalText(content: '총 전력량'),
                                const SizedBox(width: 10),
                                BoldText(
                                    content:
                                        '${context.watch<PlugDetailProvider>().plug!.assignPower}'),
                                const SizedBox(width: 2),
                                const CaptionText(content: 'Wh'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const NormalText(content: '남은 전력량'),
                                const SizedBox(width: 10),
                                BoldText(
                                    content:
                                        '${context.watch<PlugDetailProvider>().plug!.assignPower - context.watch<PlugDetailProvider>().plug!.usedPower}'),
                                const SizedBox(width: 2),
                                const CaptionText(content: 'Wh'),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                '사용시간 ${context.watch<PlugDetailProvider>().plug!.runningTime}'),
                            Text(
                                '시작시간 ${context.watch<PlugDetailProvider>().plug!.startTime}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PageEntryButton(
                    content:
                        '${context.read<PlugDetailProvider>().plug!.plugName} Power Graph',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PowerGraphScreen(
                            plugId: widget.id,
                            plugName: context
                                .read<PlugDetailProvider>()
                                .plug!
                                .plugName,
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                PageEntryButton(
                  content: '비정상 접근 로그',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlertByPlugIdScreen(
                          plugId: widget.id,
                          plugName:
                              context.read<PlugDetailProvider>().plug!.plugName,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Color _getColor(double fillRatio) {
  if (fillRatio >= 0.8) {
    return Colors.red;
  } else if (fillRatio >= 0.6) {
    return Colors.yellow;
  } else {
    return AppColor.main;
  }
}

class CircularGraphPainter extends CustomPainter {
  final double ratio;

  CircularGraphPainter({required this.ratio});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = _getColor(ratio)
      ..style = PaintingStyle.fill;

    double radius = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * ratio;

    Path path = Path()
      ..moveTo(centerX, centerY)
      ..lineTo(centerX, centerY - radius)
      ..arcTo(Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
          startAngle, sweepAngle, false)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
