import 'package:TaskApp/model/my_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCard extends StatelessWidget {
  final MyCard card;

  final RxBool isCircleChecked = false.obs;

  final List colors = [
    Color.fromRGBO(255, 222, 222, 1),
    Color.fromRGBO(91, 177, 255, 1),
    Color.fromRGBO(177, 248, 193, 1)
  ];

  
  /*
  Qeyd: Listtile-ın enini dizaynda göstərildiyi kimi verdikdə bəzi telefonlarda 
        pixel xetası verəcəyini düşündüyüm üçün Expanded-lə etməyi üstün tutdum.
  */

  ListCard({this.card});
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(right: 6.16, left: 2),
                decoration: BoxDecoration(
                    color: colors[card.id - 1],
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            Expanded(
              flex: 19,
              child: Container(
                height: 66,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(248, 248, 248, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Obx(
                  () => ListTile(
                    onTap: isCircleChecked.toggle,
                    title: Text(
                      card.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      card.timestamp,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    trailing: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          color: isCircleChecked.value
                              ? Colors.blue
                              : Colors.white,
                          shape: BoxShape.circle),
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
