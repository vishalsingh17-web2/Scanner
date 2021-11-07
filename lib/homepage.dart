import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  List<Widget> pages;
  HomePage({required this.pages});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
          body: DefaultTabController(
            initialIndex: 1,
            length: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 22,
                  child: TabBarView(
                    children: widget.pages,
                  ),
                ),
                 Expanded(
                  flex: 2,
                  child:  Container(
                    margin: const EdgeInsets.only(left:20,bottom: 10,right: 20),
                   padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(220, 220, 220, 0.3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:  TabBar(
                      automaticIndicatorColorAdjustment: true,
                      indicator: BoxDecoration(
                        color: const Color.fromRGBO(180, 150, 220, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      
                      tabs:const [
                        Tab(
                          child: Text(
                            'Create',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Scanner',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
