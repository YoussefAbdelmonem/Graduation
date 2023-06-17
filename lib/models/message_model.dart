import 'package:meaw/components/constants.dart';

class Message{
  final String message;
  final String id;
  var date;
  Message(this.message,this.id,this.date);
  factory Message.JesonData(jsonData)
  {
    return Message(jsonData[KMessageField],jsonData[KId],jsonData[KCreatedAt]);
  }
}