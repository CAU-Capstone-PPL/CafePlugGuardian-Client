import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class PageEntryButton extends StatefulWidget {
  final String content;
  final void Function() onTap;

  const PageEntryButton({
    super.key,
    required this.content,
    required this.onTap,
  });

  @override
  State<PageEntryButton> createState() => _PageEntryButtonState();
}

class _PageEntryButtonState extends State<PageEntryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          //border: Border.all(color: AppColor.text, width: 1.5),
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
              Text(
                widget.content,
                style: const TextStyle(
                  color: AppColor.text,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.arrow_forward,
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
