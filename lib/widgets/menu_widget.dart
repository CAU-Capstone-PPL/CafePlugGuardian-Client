import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final String menuName, menuDescription;
  final int menuId, menuPrice;

  const Menu({
    super.key,
    required this.menuId,
    required this.menuName,
    required this.menuPrice,
    required this.menuDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 150.0,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.text),
        color: Colors.white,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/coffee.png'),
            width: 40,
            height: 40,
          ),
          NormalText(content: menuName),
          BoldText(content: '$menuPrice point'),
        ],
      ),
    );
  }
}
