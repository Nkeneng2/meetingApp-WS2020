import 'package:team3/models/eventCategory.dart';
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
  EventCategory eventCategory;

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
      date: DateTime.parse(json['date']['iso']),
      allday: json['allday'],
      startAt: DateTime.parse(json['startAt']['iso']),
      endAt: DateTime.parse(json['endAt']['iso']),
      description: json['description'],
      shareable: json['shareable'],
      owner: null,
      eventCategory: EventCategory(
          name: json['categoryName'], color: json['categoryColor']),
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

  eventConfirm() {}

  eventDeny() {}
}
