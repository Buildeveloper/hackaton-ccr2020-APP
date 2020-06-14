import 'package:flutter/material.dart';
import './item_card.dart';

class HistoricTab extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.all(15.0),
            itemBuilder: (context,i){
                return Container(
                    width: double.infinity,
                    height: 110,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        child: Column(
                            children: <Widget>[
                                ItemCard()
                            ],
                        ),
                    ),
                );
            },
        );
    }
}