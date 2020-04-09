import 'package:flutter/material.dart';
import 'package:covid19_gateway/novelcovid/novelquote.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs')),
      body: ListView.builder(
        itemCount: Motif.questionAnswers.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(Motif.questionAnswers[index]['question'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(Motif.questionAnswers[index]['answer']),
              )
            ],
          );
        }
      ),
    );
  }
}
