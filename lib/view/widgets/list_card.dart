import 'package:TaskApp/model/my_card.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCard extends StatelessWidget {
  final MyCard card;

  final RxBool istap = false.obs;

  final List colors = [Colors.red[100], Colors.blue[100], Colors.green[100]];

  ListCard({this.card});
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(right: 5, left: 2),
                decoration: BoxDecoration(
                    color: colors[card.id - 1],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Expanded(
              flex: 19,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(248, 248, 248, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(card.title),
                  subtitle: Text(card.timestamp),
                  trailing: Obx(
                    () => CircularCheckBox(
                      inactiveColor: Colors.blue,
                      value: istap.value,
                      onChanged: (_) => istap.value = !istap.value,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
