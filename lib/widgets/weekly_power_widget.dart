import 'package:cafe_plug_guardian_client/style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyPowerWidget extends StatelessWidget {
  final List<double> weeklyData;

  const WeeklyPowerWidget({
    super.key,
    required this.weeklyData,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(
          show: true,
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: const Color(0xff37434d),
            width: 1,
          ),
        ),
        minX: 0,
        maxX: 6, // X 축의 레이블 수 (일주일)
        minY: 0,
        maxY: weeklyData
                .reduce((current, next) => current > next ? current : next) +
            50, // Y 축 최대 값
        lineBarsData: [
          LineChartBarData(
            spots: [
              for (int i = 0; i < weeklyData.length; i++)
                FlSpot(i.toDouble(), weeklyData[i]),
            ],
            isCurved: true, // 곡선 형태의 그래프 사용
            color: AppColor.main, // 그래프 색상 설정
            dotData: const FlDotData(show: false), // 점 표시 여부
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
