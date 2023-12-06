import 'package:cafe_plug_guardian_client/provider/cafe_list_provider.dart';
import 'package:cafe_plug_guardian_client/provider/user_provider.dart';
import 'package:cafe_plug_guardian_client/screens/home_screen.dart';
import 'package:cafe_plug_guardian_client/screens/shop_screen.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/page_entry_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CafeManageScreen extends StatefulWidget {
  const CafeManageScreen({super.key});

  @override
  State<CafeManageScreen> createState() => _UserManageScreenState();
}

class _UserManageScreenState extends State<CafeManageScreen> {
  TextEditingController cafeNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context
        .read<CafeListProvider>()
        .updateCafeList(context.read<UserProvider>().user!.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.background,
        title: AppBarText(
          content: '${context.read<UserProvider>().user!.userName} 님',
        ),
        actions: [
          CustomButton(
              content: '카페 추가',
              onPressed: () {
                cafeNameController.clear();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const HeadingText(content: '카페 추가'),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            controller: cafeNameController,
                            decoration:
                                const InputDecoration(labelText: '생성할 카페 이름'),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          String cafeName = cafeNameController.text.trim();
                          context.read<CafeListProvider>().addCafe(
                              context.read<UserProvider>().user!.userId,
                              cafeName);
                          Navigator.of(context).pop();
                        },
                        child: const Text('추가'),
                      ),
                    ],
                  ),
                );
              }),
          const SizedBox(width: 20),
          IconButton(
              onPressed: () {
                context.read<UserProvider>().logout();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.logout,
                size: 40,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: context.watch<CafeListProvider>().cafeList.isNotEmpty
                  ? ListView.separated(
                      itemCount:
                          context.watch<CafeListProvider>().cafeList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 30);
                      },
                      itemBuilder: (context, index) {
                        final cafe =
                            context.watch<CafeListProvider>().cafeList[index];
                        return PageEntryButton(
                            content: cafe.cafeName,
                            onTap: () {
                              context
                                  .read<UserProvider>()
                                  .selectCafe(cafe.cafeId, cafe.cafeName);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            });
                      },
                    )
                  : const Center(
                      child: TitleText(content: '아직 추가된 카페가 없습니다.'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
