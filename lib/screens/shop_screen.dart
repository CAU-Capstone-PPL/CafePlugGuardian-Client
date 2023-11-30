import 'package:cafe_plug_guardian_client/provider/menu_provider.dart';
import 'package:cafe_plug_guardian_client/provider/plug_core_provider.dart';
import 'package:cafe_plug_guardian_client/screens/plug_connect_screen.dart';
import 'package:cafe_plug_guardian_client/screens/plug_detail_screens.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MenuProvider>().updateMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.background,
        title: const AppBarText(content: '상점 관리 페이지'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(
                    content:
                        '메뉴 개수: ${context.watch<MenuProvider>().menuList.length}'),
                Row(
                  children: [
                    CustomButton(content: '메뉴 추가', onPressed: () {}),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomButton(content: '메뉴 삭제', onPressed: () {}),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: context.read<MenuProvider>().menuList.isNotEmpty
                  ? GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      children: context
                          .watch<MenuProvider>()
                          .menuList
                          .map(
                            (menu) => GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title:
                                        const HeadingText(content: '구매하시겠습니까?'),
                                    content: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Image(
                                          image:
                                              AssetImage('assets/coffee.png'),
                                          width: 100,
                                          height: 100,
                                        ),
                                        NormalText(content: menu.name),
                                        BoldText(
                                            content: '${menu.price} point'),
                                        CaptionText(content: menu.description),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Menu(
                                name: menu.name,
                                price: menu.price,
                                description: menu.description,
                              ),
                            ),
                          )
                          .toList(),
                    )
                  : const Center(
                      child: TitleText(content: '등록된 메뉴가 없습니다. 추가하세요!')),
            ),
          ],
        ),
      ),
    );
  }
}
