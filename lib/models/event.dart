import 'package:http/http.dart' as http;
import 'package:team3/Common/data.dart';
import 'package:team3/models/eventCategory.dart';
import 'dart:convert';
import 'package:team3/models/user.dart';

class Event {
  final String objectId;
  final String title;
  final DateTime date;
  final bool allday;
  final DateTime startAt;
  final DateTime endAt;
  final String description;
  final bool shareable;
  final User owner;
  final EventCategory eventCategory;

  Event(
      {this.objectId,
      this.title,
      this.date,
      this.allday,
      this.startAt,
      this.endAt,
      this.description,
      this.shareable,
      this.owner,
      this.eventCategory});

  factory Event.fromJson(Map json) {
    return Event(
      objectId: json['objectId'],
      title: json['title'],
      date: json['date'],
      allday: json['allday'],
      startAt: json['startAt'],
      endAt: json['endAt'],
      description: json['description'],
      shareable: json['shareable'],
      owner: json['userId'],
      eventCategory: json['eventCategory'],
    );
  }

  Map toMap() {
    var map = new Map();
    map["objectId"] = objectId;
    map["title"] = title;
    map["date"] = date;
    map["allday"] = allday;
    map["startAt"] = startAt;
    map["endAt"] = endAt;
    map["description"] = description;
    map["shareable"] = shareable;
    map["userId"] = owner;
    map["eventCategory"] = eventCategory;
    return map;
  }

  Future login(String url, {Map body}) async {
    return http.post(url, body: body, headers: {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": apiKey,
      "X-Parse-Revocable-Session": '1',
    }).then((http.Response response) {
      final int statusCode = response.statusCode;

      print(response.body.toString());

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return Event.fromJson(json.decode(response.body));
    });
  }

  eventConfirm() {}

  eventDeny() {}
}
