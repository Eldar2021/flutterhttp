import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';


class GraphicContainer extends StatelessWidget {
  const GraphicContainer({required this.data, required this.price});
  final List<double> data;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text("1 BTC ${price} som", style: TextStyle(color: Colors.white, fontSize: 20),),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Sparkline(
                  data: data,
                  lineColor: Colors.cyan,
                  //fillMode: FillMode.below,
                  fillColor: Colors.white10,
                  pointsMode: PointsMode.all,
                  pointSize: 6.0,
                  pointColor: Colors.white,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ],
      ),
    );
  }
}