import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [dashBg, content],
      ),
    );
  }

  get dashBg => Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.deepOrange,
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
            ),
            flex: 5,
          ),
        ],
      );

  get content => Container(
        child: Column(
          children: <Widget>[header, grid],
        ),
      );

  get header => ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 20, top: 22),
        title: Text(
          'App SENA',
          style: TextStyle(
              color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '8 Areas',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        trailing: CircleAvatar(),
      );

  get grid => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            childAspectRatio: .90,
            children: List.generate(8, (_) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      logoSistemas,
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );

  get logoSistemas => Container(
    child: Column(
      children: [
        Image.asset(
          'assets/img/sistemas.png',
          width: 100.0,
        ),
        Text(
          'Sistemas',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    ),
  );

  //sin usar todavia
  get logoConfeccion => Container(
    child: Column(
      children: [
        Image.asset(
          'assets/img/confecciones.png',
          width: 100.0,
        ),
        Text(
          'Confeccion',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    ),
  );
}
