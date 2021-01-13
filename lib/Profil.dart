import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

final String imgUrl =
    'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg';

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            CircleAvatar(radius: 40, backgroundImage: NetworkImage(imgUrl)),
            SizedBox(
              height: 25.0,
            ),
            Text(
              'User name',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
            SizedBox(
              height: 35,
            ),
            FlatButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => ModalBottom(),
                );
              },
              color: Colors.white,
              child: Text("MODIFIER"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Colors.amber[800],
                  )),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Count of View",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "200",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Number of View",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "500",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (50),
            ),
          ],
        ),
      ),
    ));
  }
}

class ModalBottom extends StatefulWidget {
  @override
  _ModalBottomState createState() => _ModalBottomState();
}

class _ModalBottomState extends State<ModalBottom> {
  bool gender = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Card(
                  child: Padding(
                padding: EdgeInsets.zero,
                child: GestureDetector(
                  onTap: () {
                    print("change Name"); // function for change name
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          color: Colors.black,
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'Editer votre profil',
                        style: TextStyle(color: Colors.black),
                      ),
                      FlatButton(onPressed: () {}, child: Text("Enregister"))
                    ],
                  ),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Card(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: GestureDetector(
                  onTap: () {
                    print("change photo"); //function for change photo
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: 20, backgroundImage: NetworkImage(imgUrl)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "photo",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          "Nom de profil",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: new TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'User name',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "VOS INSFORMATION PERSONNELLES",
              ),
              Card(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                "Naissance",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                                child: CupertinoDateTextBox(
                              initialValue: DateTime.now(),
                              hintText: 'Hint Text',
                              onDateChange: null,
                            ))
                          ],
                        ),
                      ],
                    )),
              ),
              Card(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(
                                "Sexe",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) {
                                      return Container(
                                        height: 200,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    gender = true;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text(
                                                  "Homme",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 10, 0, 10),
                                                child: Divider(
                                                  height: 2,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    gender = false;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text(
                                                  "Femme",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: gender ? Text("Homme") : Text("Femme"),
                            )),
                          ],
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "VOS COMPTES SOCIAUX",
              ),
              Card(
                child: Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                "Snapchat",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: new TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'snapchat',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                "Facebook",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: new TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'snapchat',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
