import 'package:cafe_plug_guardian_client/screens/power_graph_screen.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class PowerEntry extends StatelessWidget {
  final String plugId, plugName;
  const PowerEntry({super.key, required this.plugId, required this.plugName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PowerGraphScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.text, width: 1.5),
          borderRadius: BorderRadius.circular(10),
          color: AppColor.background,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(5, 5),
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              plugId == '0'
                  ? const Text(
                      'Total Power Graph',
                      style: TextStyle(
                        color: AppColor.text,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      '$plugName Power Graph',
                      style: const TextStyle(
                        color: AppColor.text,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const Icon(
                Icons.chevron_right_rounded,
                size: 30,
                color: AppColor.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
