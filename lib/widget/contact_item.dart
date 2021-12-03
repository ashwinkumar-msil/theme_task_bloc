import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:theme_task/data/apptheme.dart';
import 'package:theme_task/model/contact_data_model.dart';

Widget listItem(BuildContext context, List<Contact> contactdata) {
  return Container(
    padding: const EdgeInsets.only(top: 15),
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    child: ListView.builder(
        itemCount: contactdata.length,
        itemBuilder: (
          BuildContext context,
          int i,
        ) {
          return userList(context, i, contactdata[i].name,
              contactdata[i].contacts, contactdata[1].url);
        }),
  );
}

Widget userList(
    BuildContext context, int index, String name, String number, String url) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Theme.of(context).bottomAppBarColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).canvasColor,
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ]),
    width: double.infinity,
    height: 80,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 5,
                  ),
                  Text(number,
                      style: const TextStyle(fontSize: 15, letterSpacing: .3)),
                ],
              ),
            ],
          ),
        ),
        Center(
          child: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(left: 5),
              // child: Text('image'
              child: Image.network("https://picsum.photos/200")),
        ),
      ],
    ),
  );
}
