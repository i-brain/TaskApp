import 'package:intl/intl.dart';

class MyCard {
  int id;
  String title;
  String timestamp;
  MyCard({this.id, this.timestamp, this.title});

  factory MyCard.fromFactory(bodyElement) {
    DateTime dateTime = DateTime.parse(bodyElement['createdAt']);

    String newDateFormat = DateFormat.yMEd().add_jms().format(dateTime);

    return MyCard(
      id: bodyElement['id'],
      timestamp: newDateFormat,
      title: bodyElement['title'],
    );
  }
}
