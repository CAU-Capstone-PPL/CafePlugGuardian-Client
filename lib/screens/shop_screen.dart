import 'package:cafe_plug_guardian_client/provider/menu_provider.dart';
import 'package:cafe_plug_guardian_client/provider/user_provider.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late int cafeId;

  void _showErrorSnackBar(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const HeadingText(content: 'Error'),
        content: BoldText(content: errorMessage),
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
  }

  @override
  void initState() {
    super.initState();
    cafeId = context.read<UserProvider>().cafeId!;
    context.read<MenuProvider>().updateMenu(cafeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                CustomButton(
                    content: '메뉴 추가',
                    onPressed: () {
                      nameController.clear();
                      priceController.clear();
                      descriptionController.clear();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const HeadingText(content: '메뉴 추가'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage('assets/coffee.png'),
                                  width: 100,
                                  height: 100,
                                ),
                                TextField(
                                  controller: nameController,
                                  decoration:
                                      const InputDecoration(labelText: '메뉴 이름'),
                                ),
                                TextField(
                                  controller: priceController,
                                  decoration:
                                      const InputDecoration(labelText: '가격'),
                                  keyboardType: TextInputType.number,
                                ),
                                TextField(
                                  controller: descriptionController,
                                  decoration:
                                      const InputDecoration(labelText: '설명'),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                String name = nameController.text.trim();
                                int price =
                                    int.parse(priceController.text.trim());
                                String description =
                                    descriptionController.text.trim();
                                try {
                                  context.read<MenuProvider>().addMenu(
                                      cafeId, name, price, description);
                                  Navigator.of(context).pop();
                                } catch (e) {
                                  String errorMessage = e.toString();
                                  _showErrorSnackBar(context, errorMessage);
                                }
                              },
                              child: const Text('추가'),
                            ),
                          ],
                        ),
                      );
                    }),
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
                                nameController.text = menu.menuName;
                                priceController.text =
                                    menu.menuPrice.toString();
                                descriptionController.text =
                                    menu.menuDescription;
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const HeadingText(content: '메뉴'),
                                    content: SingleChildScrollView(
                                      child: Column(
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
                                          TextField(
                                            controller: nameController,
                                            decoration: const InputDecoration(
                                                labelText: '메뉴 이름'),
                                          ),
                                          TextField(
                                            controller: priceController,
                                            decoration: const InputDecoration(
                                                labelText: '가격'),
                                            keyboardType: TextInputType.number,
                                          ),
                                          TextField(
                                            controller: descriptionController,
                                            decoration: const InputDecoration(
                                                labelText: '설명'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          try {
                                            context
                                                .read<MenuProvider>()
                                                .deleteMenu(
                                                    cafeId, menu.menuId);

                                            Navigator.of(context).pop();
                                          } catch (e) {
                                            String errorMessage = e.toString();
                                            _showErrorSnackBar(
                                                context, errorMessage);
                                          }
                                        },
                                        child: const Text('삭제'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          String name =
                                              nameController.text.trim();
                                          int price = int.parse(
                                              priceController.text.trim());
                                          String description =
                                              descriptionController.text.trim();
                                          try {
                                            context
                                                .read<MenuProvider>()
                                                .editMenu(cafeId, menu.menuId,
                                                    name, price, description);
                                            Navigator.of(context).pop();
                                          } catch (e) {
                                            String errorMessage = e.toString();
                                            _showErrorSnackBar(
                                                context, errorMessage);
                                          }
                                        },
                                        child: const Text('수정'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Menu(
                                menuId: menu.menuId,
                                menuName: menu.menuName,
                                menuPrice: menu.menuPrice,
                                menuDescription: menu.menuDescription,
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
