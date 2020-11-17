class EventCategory {
  final String name;
  final String color;

  EventCategory({this.name, this.color});

  factory EventCategory.fromJson(Map json) {
    return EventCategory(
      name: json['name'],
      color: json['color'],
    );
  }

  Map toMap() {
    var map = new Map();
    map["name"] = name;
    map["color"] = color;
    return map;
  }

  eventConfirm() {}

  eventDeny() {}
}
