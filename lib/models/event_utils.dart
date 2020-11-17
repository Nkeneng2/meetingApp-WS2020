import 'dart:convert';

import 'package:http/http.dart';
import 'package:team3/models/event.dart';
import 'package:team3/Common/data.dart';
import 'package:team3/models/user.dart';

class EventUtils {
  //Create
  static Future<Response> addEvent(Event event) async {
    String apiUrl = BaseUrl + "classes/Event";

    Response response = await post(
      apiUrl,
      headers: {
        'X-Parse-Application-Id': appId,
        'X-Parse-REST-API-Key': apiKey,
        'Content-Type': 'application/json'
      },
      body: json.encode(event.toMap()),
    );
    return response;
  }

  //Read
  static Future getEventList() async {
    String apiUrl = BaseUrl + "classes/Event";

    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id': appId,
      'X-Parse-REST-API-Key': apiKey,
      "X-Parse-Revocable-Session": '1',
      "Content-Type": 'application/json',
    });

    return response;
  }

  //Read
  static Future getEventListByUser(User user) async {
    String apiUrl = BaseUrl + "classes/Event";

    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id': appId,
      'X-Parse-REST-API-Key': apiKey,
      "X-Parse-Revocable-Session": '1',
      "Content-Type": 'application/json',
      "where": "={\"userId\": \"" + user.userId + "\"}",
    });

    return response;
  }

  //Update
  static Future updateEvent(Event event) async {
    String apiUrl = BaseUrl + "classes/Event/${event.objectId}";

    Response response = await put(apiUrl,
        headers: {
          'X-Parse-Application-Id': appId,
          'X-Parse-REST-API-Key': apiKey,
          'Content-Type': 'application/json',
        },
        body: json.encode(event.toMap()));

    return response;
  }

  //Delete
  static Future deleteEvent(String objectId) async {
    String apiUrl = BaseUrl + "classes/Event/$objectId";

    Response response = await delete(apiUrl, headers: {
      'X-Parse-Application-Id': appId,
      'X-Parse-REST-API-Key': apiKey,
    });

    return response;
  }
}
