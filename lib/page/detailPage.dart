import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String firstName, lastName, experience, skill;

  DetailPage({this.firstName, this.lastName, this.skill, this.experience});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Center(
          child: Card(
            elevation: 10.0,
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              alignment: Alignment.center,
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    buildText(
                        text: 'Name : ${widget.firstName} ${widget.lastName}'),
                    buildText(text: 'Skill : ' + widget.skill),
                    buildText(text: 'Experience : ' + widget.experience),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget buildText({String text}) {
    return Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
