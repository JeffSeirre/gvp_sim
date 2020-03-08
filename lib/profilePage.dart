import 'package:flutter/material.dart';
import 'package:gvp_sim_db/gameData.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Odpoledne'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 350,
                child: Row(
                  children: <Widget>[
                    StatBar(barColor: Colors.blue,),
                    StatBar(barColor: Colors.red,),
                    StatBar(barColor: Colors.green,),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.check,
          size: 35,
        ),
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Navigator.pushNamed(context, "/Encounter");
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.assignment,
                color: Colors.white,
                size: 30,
              ),
              onPressed: (){
                final data = Provider.of<GameData>(context, listen: false);
                data.sleep -= 10;
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
              onPressed: (){
                final data = Provider.of<GameData>(context, listen: false);
                data.sleep += 10;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StatBar extends StatefulWidget {
  StatBar({Key key, this.barColor}): super(key: key);
  final Color barColor;
  @override
  _StatBarState createState() => _StatBarState();
}

class _StatBarState extends State<StatBar> {


  /*void Increase(int increase) {
    if(barFlex + increase <= 100) {
      setState(() {
        barFlex += increase;
      });
    }
  }

  void Decrease(int decrease) {
    if(barFlex - decrease >= 0) {
      setState(() {
        barFlex -= decrease;
      });
    }
  }*/


  @override
  Widget build(BuildContext context) {
    final data = Provider.of<GameData>(context);
    int barFlex = data.sleep;
    return AspectRatio(
      aspectRatio: 1 / 5,
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 5)),
          child: Column(
            children: <Widget>[
              Flexible(
                  flex: 100 - barFlex,
                  child: Container(color: Colors.grey,)),
              Flexible(
                  flex: barFlex,
                  child: Container(color: widget.barColor))
            ],
          )
      ),
    );
  }
}

class SkillBox extends StatefulWidget {
  @override
  _SkillBoxState createState() => _SkillBoxState();
}

class _SkillBoxState extends State<SkillBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,

      decoration: BoxDecoration(border: Border.all(width: 2), color: Colors.grey[300],),
    );
  }
}
