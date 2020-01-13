import 'package:flutter/material.dart';
import 'package:gymapp/pages/project.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white ,
        floatingActionButton: FloatingActionButton(
          onPressed: (){ 
             //
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.black,),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Container(
              color: Colors.red,// color del contenedor
              padding: EdgeInsets.only(left: 110.0),
              child: Row(
                children: <Widget>[
                Text("TIMER GYM",
              style: TextStyle(fontSize: 60.0, 
              fontWeight: FontWeight.w900, 
              color: Colors.white
              ),
            ),
          ],
        )
        ),
          SizedBox(height: 30.0,),
          ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              _buildProjectTile("Correr", backgroundColor: Colors.redAccent, textColor: Colors.black,),
              _buildProjectTile("Caminar", backgroundColor: Colors.blue, textColor: Colors.black),
              _buildProjectTile("Bicicleta", backgroundColor: Colors.yellow, textColor: Colors.black),
              _buildProjectTile("Nadar", backgroundColor: Colors.greenAccent, textColor: Colors.black),
              _buildProjectTile("Caminadora", backgroundColor: Colors.deepPurple, textColor: Colors.black),
            ],
          )
        ],
      ),
    ),
  );
}

Widget _buildProjectTile(String projectName, 
    {Color backgroundColor = Colors.white, Color textColor = Colors.black}){
    //BuildContext context;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                color:  Colors.black,
                blurRadius: 2.0,
                spreadRadius: 2.0,
                offset: Offset(0.0, 4.0),
              )
            ]
          ),
          child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    //PAGINAPRYECTO
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>ProjectPage(projectName),
                    )
                  );
                },
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          //color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    projectName, 
                    style: TextStyle(
                      color: textColor, 
                      fontSize: 30.0, 
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(color: textColor),
                      children: [
                        TextSpan(text: "3H\n",style: TextStyle(fontSize: 26.0, height: 0.9)),
                        TextSpan(text: "15m", style: TextStyle(fontSize: 16.0, height: 0.9)),
                    ]
                  )
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}