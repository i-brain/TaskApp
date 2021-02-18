import 'package:TaskApp/controller/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CardController controller = Get.put(CardController());

  AppBar buildAppbar() {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.blue),
      backgroundColor: Colors.white,
      title: Text(
        'task.',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }

  FloatingActionButton buildFAT() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.add,
        size: 30,
        color: Colors.blue,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: [DrawerHeader(child: Text('Drawer'))],
          ),
        ),
        appBar: buildAppbar(),
        floatingActionButton: buildFAT(),
        body: GetX<CardController>(
          initState: (state) => controller.getData(),
          builder: (controller) {
            if (controller.isDataLoading.value)
              return Center(child: CircularProgressIndicator());
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Tasks',
                    style: TextStyle(fontSize: 20),
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
