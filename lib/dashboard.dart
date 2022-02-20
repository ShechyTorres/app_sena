import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'modelos/areas.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App SENA',
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          this.dashBg(),
          this.content(),
        ],
      ),
    );
  }

  Widget dashBg() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.deepOrange,
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            color: Colors.transparent,
          ),
          flex: 5,
        ),
      ],
    );
  }

  Widget content() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(3.0),
        children: <Widget>[
          FutureBuilder(
            future: getAreas(),
            builder: (BuildContext context, AsyncSnapshot<List<Areas>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<Areas> lasareas = snapshot.data;
                return grid(lasareas);
              }
              return Center(child: CircularProgressIndicator());
            }
          ),
        ],
      ),
    );
  }

  ListView grid(List<Areas> lasareas) {
    return ListView.builder(
      itemCount: lasareas.length,
      itemBuilder: (BuildContext context, int index) {
        Areas areas = lasareas[index];
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Image.network(
                    areas.urlAreas,
                    width: 130.0,
                  ),
                  Text(
                    areas.titleAreas,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<List<Areas>> getAreas() async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/ShechyTorres/areas_senaAPI/main/areasSENA.json');
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return areasFromJson(respuesta.body);
    } else
      return null;
  }
}
