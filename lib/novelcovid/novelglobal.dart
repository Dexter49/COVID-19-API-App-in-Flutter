import 'package:flutter/material.dart';

class NovelGlobal extends StatelessWidget {

  final Map globalData;

  const NovelGlobal({Key key, this.globalData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          FeedPanel(
            title: 'CONFIRMED',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: globalData['cases'].toString(),
          ),
          FeedPanel(
            title: 'RECOVERED',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: globalData['recovered'].toString(),
          ),
          FeedPanel(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue,
            count: globalData['active'].toString(),
          ),
          FeedPanel(
            title: 'DEATHS',
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: globalData['cases'].toString(),
          ),
        ],
      ),
    );
  }
}

class FeedPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const FeedPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      height: 80, width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)), 
          Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor))
        ],
      ),
    );
  }
}
