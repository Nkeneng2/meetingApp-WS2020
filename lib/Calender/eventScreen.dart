import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:team3/models/event.dart';
import 'package:team3/models/event_utils.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

TextEditingController _titleController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
DateTime date1;

class EventScreen extends StatefulWidget {
  EventScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
      ),
      body: Container(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              List<Event> eventList = snapshot.data;
              return ListView.builder(
                itemBuilder: (_, position) {
                  return ListTile(
                    title: Text(eventList[position].title),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              //Show dialog box to update item
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              //Show dialog box to delete item
                            })
                      ],
                    ),
                  );
                },
                itemCount: eventList.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          future: geteventList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddEventDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<List<Event>> geteventList() async {
    List<Event> eventList = [];

    Response response = await EventUtils.getEventList();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var results = body["results"];

      for (var event in results) {
        eventList.add(Event.fromJson(event));
      }
    } else {
      //Handle error
    }

    return eventList;
  }

  void showAddEventDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Enter event Title",
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: "Enter event description",
              ),
            ),
            DateTimePickerFormField(
              inputType: InputType.time,
              format: DateFormat("HH:mm"),
              initialTime: TimeOfDay(hour: 5, minute: 5),
              editable: false,
              decoration: InputDecoration(
                  labelText: 'Time', hasFloatingPlaceholder: false),
              onChanged: (dt) {
                date1 = new DateTime.now();
                setState(() => date1 = dt);
                print('Selected date: $date1');
                print('Hour: $date1.hour');
                print('Minute: $date1.minute');
              },
            ),
          ]),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  addEvent();
                },
                child: Text("Add")),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel")),
          ],
        );
      },
    );
  }

  void addEvent() {
    Scaffold.of(this.context).showSnackBar(SnackBar(
      content: Row(
        children: <Widget>[
          Text("Adding Event"),
          CircularProgressIndicator(),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      duration: Duration(minutes: 1),
    ));
    Event event = Event(
        title: _titleController.text,
        date: null,
        allday: false,
        startAt: null,
        endAt: null,
        description: null,
        shareable: true,
        owner: null,
        eventCategory: null);

    EventUtils.addEvent(event).then((res) {
      Scaffold.of(this.context).hideCurrentSnackBar();

      Response response = res;
      if (response.statusCode == 201) {
        //Successful
        _titleController.text = "";

        Scaffold.of(this.context).showSnackBar(SnackBar(
          content: Text("event added!"),
          duration: Duration(seconds: 1),
        ));

        setState(() {
          //Update UI
        });
      }
    });
  }
}
