import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subway food app clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "OpenSans"
      ),
      home: MyHomePage(title: 'Food details'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  int activeIndex = 0;
  TabController controller;
  List<String> items = <String>["Favoritos", "Clasicos", "Premium", "Lleva"];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: items.length, vsync: this);
    controller.addListener(() {
      setState(() {
        activeIndex = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight * 1 / 4,
              child: Stack(children: <Widget>[
                Container(
                  height: screenHeight * 1 / 6,
                  width: screenWidth,
                  child: Image.asset(
                    "assets/3982368.jpg",
                    fit: BoxFit.cover,
                    color: Colors.black38,
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    shape: CircleBorder(),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlutterLogo(
                        size: 80,
                      ),
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Text(
                "Subway",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                "Sandwiches y panaderia",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.access_time,
                  color: Colors.grey,
                  size: 20,
                ),
                Text(
                  "12:00AM - 02:30AM",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      color: Colors.redAccent,
                      size: 25,
                    ),
                    Text(
                      "\$3,500",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "MINIMUM DELIVERY",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ]),
                ),
                Container(
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.alarm,
                      color: Colors.redAccent,
                      size: 25,
                    ),
                    Text(
                      "35 min",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "DELIVERY TIME",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ]),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.grey[400],
              width: screenWidth,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    for (var i = 0; i < items.length; i++)
                      Container(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            controller.animateTo(i);
                            activeIndex = controller.index;
                          }),
                          child: Container(
                            height: 60,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  items[i],
                                  style: TextStyle(
                                      fontWeight: activeIndex == i
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: activeIndex == i ? 20 : 17,
                                      color: activeIndex == i
                                          ? Colors.red
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ]),
            ),
            Expanded(
              child: TabBarView(controller: controller, children: [
                Container(
                  child: ListView(
                    children: <Widget>[
                      foodRow("Atun 15cm", "Delicoso atun seleciondado de la mas alta calidad mezcaldo", "assets/hamburger2.jpg", "5,000"),
                      foodRow("Cerdo Desmechado 15cm", "Delicoso atun seleciondado de la mas alta calidad mezcaldo", "assets/hamburger1.jpg", "10,000"),
                    ],
                  ),
                ),
                Container(
                  child: ListView(
                    children: <Widget>[
                      foodRow("Atun 15cm", "Delicoso atun seleciondado de la mas alta calidad mezcaldo", "assets/hamburger2.jpg", "5,000"),
                      foodRow("Cerdo Desmechado 15cm", "Delicoso atun seleciondado de la mas alta calidad mezcaldo", "assets/hamburger1.jpg", "10,000"),
                      foodRow("Pechuga de pollo 15cm", "Delicoso atun seleciondado de la mas alta calidad mezcaldo", "assets/sandwich.png", "9,000"),
                    ],
                  ),
                ),
                Container(
                  child: ListView(
                    children: <Widget>[
                      foodRow("Atun 15cm", "Delicoso atun seleciondado de la mas alta calidad mezcaldo", "assets/hamburger2.jpg", "5,000"),
                      foodRow("Cerdo Desmechado 15cm", "Delicoso atun seleciondado de la mas alta calidad mezcaldo", "assets/hamburger1.jpg", "10,000"),
                      foodRow("Pechuga de pollo 15cm", "Delicoso atun seleciondado de la mas alta calidad mezcaldo", "assets/sandwich.png", "9,000"),
                    ],
                  ),
                ),
                Container(
                  child: ListView(
                    children: <Widget>[
                      foodRow("Atun 15cm", "Delicoso atun seleciondado de la mas alta calidad mezcaldo", "assets/hamburger2.jpg", "5,000"),
                      foodRow("Cerdo Desmechado 15cm", "Delicoso atun seleciondado de la mas alta calidad mezcaldo", "assets/hamburger1.jpg", "10,000"),
                    ],
                  ),
                ),
              
              ]),
            ),
            Container(
              height: 70,
              width: screenWidth,
              margin: EdgeInsets.symmetric(horizontal:20),
              child: Row(
                children:<Widget>[
                  Expanded(
                    flex:4  ,
                    child: RaisedButton(
                      //color: Color(0xfff36b73),
                      color: Color(0xffc73d2b),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Text("Checkout", style: TextStyle(fontSize:18, color:Colors.white),),
                      ),
                      onPressed: (){}),
                  ),
                  Expanded(flex:1,
                    child: RaisedButton(
                      color: Color(0xfffd15c64),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Icon(Icons.alarm, color: Colors.white),
                      ),
                      onPressed:(){}),
                  )
                ]
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget foodRow(String name,String description,String imgPath, String price) {
    return Container(
        child: ListTile(
      title: Text("$name",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
      isThreeLine: true,
      subtitle: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$description", 
            style: TextStyle(fontSize:15,),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,), 
            Text("\$$price", style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold))
            ]),
      ),
      trailing: Image.asset("$imgPath", width: 190,),
    ));
  }
}
