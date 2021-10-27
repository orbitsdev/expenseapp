import 'package:flutter/material.dart';

class ChartBar extends StatefulWidget {
  final String dayslabel;
  final double spendingamount;
  final double spendinpcoftotal;
  ChartBar({
    Key? key,
    required this.dayslabel,
    required this.spendingamount,
    required this.spendinpcoftotal,
  }) : super(key: key);

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
                child: Text('\₱${widget.spendingamount.toStringAsFixed(0)}')),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            width: 10,
            height: constraints.maxHeight * 0.6,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: widget.spendinpcoftotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text('${widget.dayslabel}',
                      style: TextStyle(
                        fontSize: 13,
                      ))))
        ],
      );
    });
  }
}
