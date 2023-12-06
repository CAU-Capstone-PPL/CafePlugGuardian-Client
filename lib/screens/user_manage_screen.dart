import 'package:cafe_plug_guardian_client/provider/user_provider.dart';
import 'package:cafe_plug_guardian_client/screens/cafe_manage_screen.dart';
import 'package:cafe_plug_guardian_client/screens/shop_screen.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/page_entry_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserManageScreen extends StatelessWidget {
  const UserManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: AppBarText(
          content: '${context.read<UserProvider>().user!.userName} 님',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PageEntryButton(
                  content: '카페 관리',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CafeManageScreen()));
                  }),
              const SizedBox(
                height: 30,
              ),
              PageEntryButton(
                  content: '상점 관리',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShopScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
