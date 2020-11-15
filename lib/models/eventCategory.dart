import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team3/Common/data.dart';

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
