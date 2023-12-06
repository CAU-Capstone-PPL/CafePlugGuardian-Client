import 'package:cafe_plug_guardian_client/screens/power_graph_screen.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class PowerEntry extends StatefulWidget {
  final String plugName;
  final int plugId;

  const PowerEntry({
    super.key,
    required this.plugId,
    required this.plugName,
  });

  @override
  State<PowerEntry> createState() => _PowerEntryState();
}

class _PowerEntryState extends State<PowerEntry> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PowerGraphScreen(
              plugId: widget.plugId,
              plugName: widget.plugName,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          //border: Border.all(color: AppColor.text, width: 1.5),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
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
              widget.plugId == 0
                  ? const Text(
                      'Total Power Graph',
                      style: TextStyle(
                        color: AppColor.text,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      '${widget.plugName} Power Graph',
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
