import 'dart:convert';

import 'package:TaskApp/model/my_card.dart';
import 'package:TaskApp/view/widgets/list_card.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class CardController extends GetxController {
  RxBool isDataLoading = false.obs;

  List<ListCard> loadedCardList = [];

  getData() async {
    isDataLoading.value = true;
    String url = 'https://cdn.fonibo.com/challenges/tasks.json';
    var response = await get(url);

    var body = jsonDecode(response.body);

    await body.forEach((bodyElement) {
      MyCard card = MyCard.fromFactory(bodyElement);

      loadedCardList.add(ListCard(
        card: card,
      ));
    });

    isDataLoading.value = false;
  }
}
