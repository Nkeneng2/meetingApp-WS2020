// getTrendingWallpars() async {
//   var response = await http.get("https://api.pexels.com/v1/curated",
//       headers: {
//     "X-Parse-Application-Id": apiKey,
//     "X-Parse-REST-API-Key": apiKey,
//     "X-Parse-Revocable-Session": apiKey,
//     "Content-Type": apiKey,
//   });
//   // print(response.body.toString());
//   Map<String, dynamic> jsonData = jsonDecode(response.body);
//   print(jsonData);
//   jsonData["photos"].forEach((item) {
//     // print(item);
//     WallPaperModel wallPaperModel = new WallPaperModel();
//     wallPaperModel = WallPaperModel.fromMap(item);
//     wallPapers.add(wallPaperModel);
//   });
//   wallPapers.forEach((element) {
//     print(element.photographer);
//   });
//   setState(() {});
// }

import 'data.dart';
import 'package:http/http.dart' as http;

get(object) async {
  return await http.get("https://parseapi.back4app.com/" + object, headers: {
    "X-Parse-Application-Id": appId,
    "X-Parse-REST-API-Key": apiKey,
    "X-Parse-Revocable-Session": '1',
    "Content-Type": 'application/json',
  });
}

post({object, data}) async {
  return await http.post("https://parseapi.back4app.com/" + object, headers: {
    "X-Parse-Application-Id": appId,
    "X-Parse-REST-API-Key": apiKey,
    "X-Parse-Revocable-Session": '1',
    "Content-Type": 'application/json',
  });
}
