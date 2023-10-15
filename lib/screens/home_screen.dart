import 'package:cafe_plug_guardian_client/screens/plug_list_screen.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/plug_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            const Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "example of Nickname",
                    style: TextStyle(
                        color: AppColor.text,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.add_alert_outlined,
                    size: 40,
                  ),
                ],
              ),
            ),
            const Flexible(
              flex: 1,
              child: SizedBox(
                height: 20,
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Plug List',
                        style: TextStyle(
                            color: AppColor.text,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlugListScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(color: AppColor.text),
                          )),
                    ],
                  ),
                  Expanded(child: makeList())
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Power ',
                        style: TextStyle(
                            color: AppColor.text,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            print("버튼 클릭");
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(color: AppColor.text),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ListView makeList() {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: 10,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    itemBuilder: (context, index) {
      return const Plug();
    },
    separatorBuilder: (context, index) => const SizedBox(width: 10),
  );
}
