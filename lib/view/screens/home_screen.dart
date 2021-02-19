import 'package:TaskApp/controller/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color blue = Color.fromRGBO(1, 118, 228, 1);

class HomeScreen extends StatelessWidget {
  final CardController controller = Get.put(CardController());

  Widget buildAppbar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 66),
      child: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: blue,
          size: 35,
        ),
        title: Text(
          'task.',
          style:
              TextStyle(fontSize: 22, color: blue, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  Widget buildFAT() {
    return Container(
      height: 53,
      width: 53,
      child: FittedBox(
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 38,
            color: blue,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppbar(),
        floatingActionButton: buildFAT(),
        body: GetX<CardController>(
          initState: (state) => controller.getData(),
          builder: (_) {
            if (controller.isDataLoading.value)
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(blue),
                ),
              );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 12),
                  child: Text(
                    'Tasks',
                    style: TextStyle(
                        color: Color.fromRGBO(51, 50, 50, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: controller.loadedCardList,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
