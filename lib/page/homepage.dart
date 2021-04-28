import 'package:flutter/material.dart';
import 'package:flutter_node/model/data_model.dart';
import 'package:flutter_node/page/detailPage.dart';
import 'package:flutter_node/service/data_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataService dataService = DataService();
  String appname = 'Node_Flutter';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: FutureBuilder(
          future: dataService.getData(),
          builder: (_, snapshot) {
            List<Data> data = snapshot.data;
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ));
            }
            return buildListView(data, context);
          },
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      title: Text(appname),
      centerTitle: true,
      elevation: 0.0,
    );
  }

  Widget buildListView(List<Data> data, BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (_, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailPage(
                            firstName: data[index].firstName,
                            lastName: data[index].lastName,
                            skill: data[index].skill,
                            experience: data[index].experience)));
              },
              leading: Icon(Icons.local_fire_department_sharp),
              title: Text('${data[index].firstName} ${data[index].lastName} '),
              subtitle: Text('${data[index].skill}'),
              trailing: Text('${data[index].experience}'),
            ),
          ),
        );
      },
    );
  }
}
