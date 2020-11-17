import 'dart:convert';

import 'package:http/http.dart';
import 'package:team3/models/eventCategory.dart';
import 'package:team3/Common/data.dart';

class EventCategoryUtils {
  //Create
  static Future<Response> addEventCategory(EventCategory eventCategory) async {
    String apiUrl = BaseUrl + "classes/EventCategory";

    Response response = await post(
      apiUrl,
      headers: {
        'X-Parse-Application-Id': appId,
        'X-Parse-REST-API-Key': apiKey,
        'Content-Type': 'application/json'
      },
      body: json.encode(eventCategory.toMap()),
    );
    return response;
  }

  //Read
  static Future getEventCategoryList() async {
    String apiUrl = BaseUrl + "classes/EventCategory";

    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id': appId,
      'X-Parse-REST-API-Key': apiKey,
      "X-Parse-Revocable-Session": '1',
      "Content-Type": 'application/json',
    });

    return response;
  }

  //Read
  static Future getEventCategoryById(String objectId) async {
    String apiUrl = BaseUrl + "classes/EventCategory";

    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id': appId,
      'X-Parse-REST-API-Key': apiKey,
      "X-Parse-Revocable-Session": '1',
      "Content-Type": 'application/json',
      "where": "={objectId\": \"" + objectId + "\"}",
    });

    return response;
  }

  //Update
  static Future updateEventCategory(EventCategory eventCategory) async {
    String apiUrl = BaseUrl + "classes/EventCategory/${eventCategory.objectId}";

    Response response = await put(apiUrl,
        headers: {
          'X-Parse-Application-Id': appId,
          'X-Parse-REST-API-Key': apiKey,
          'Content-Type': 'application/json',
        },
        body: json.encode(eventCategory.toMap()));

    return response;
  }

  //Delete
  static Future deleteEventCategory(String objectId) async {
    String apiUrl = BaseUrl + "classes/EventCategory/$objectId";

    Response response = await delete(apiUrl, headers: {
      'X-Parse-Application-Id': appId,
      'X-Parse-REST-API-Key': apiKey,
    });

    return response;
  }
}
