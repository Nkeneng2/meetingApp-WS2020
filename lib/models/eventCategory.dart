import 'dart:convert';
import 'package:http/http.dart';
import 'package:team3/models/eventCategory_utils.dart';

class EventCategory {
  final String objectId;
  final String name;
  final String color;

  EventCategory({this.objectId, this.name, this.color});

  factory EventCategory.fromJson(Map json) {
    return EventCategory(
      objectId: json['objectId'],
      name: json['name'],
      color: json['color'],
    );
  }

  // ignore: missing_return
  Future<EventCategory> fromJsonWithId(String id) async {
    EventCategory eventtemp;
    Response response = await EventCategoryUtils.getEventCategoryById(id);
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var results = body["results"];

      for (var eventcategory in results) {
        eventtemp = EventCategory.fromJson(eventcategory);
      }
    } else {
      //Handle error
    }

    return eventtemp;
  }

  Map toMap() {
    var map = new Map();
    map["objectId"] = objectId;
    map["name"] = name;
    map["color"] = color;
    return map;
  }

  eventConfirm() {}

  eventDeny() {}
}
