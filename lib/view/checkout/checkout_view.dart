import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:status_change/status_change.dart';
import '../../constant.dart';
import 'add_address_widget.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  CheckOutViewState createState() => CheckOutViewState();
}

class CheckOutViewState extends State<CheckOutView> {
  int _processIndex = 0;
  Pages pages = Pages.DeliveryTime;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return Colors.teal;
    } else {
      return todoColor;
    }
  }

  final _processes = [
    'Order Signed',
    'Order Processed',
    'Shipped ',
    'Out for delivery ',
    'Delivered ',
  ];

  final _content = [
    '20/18',
    '20/18',
    '20/18',
    '20/18',
    '20/18',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Order Status",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: StatusChange.tileBuilder(
              theme: StatusChangeThemeData(
                direction: Axis.vertical,
                connectorTheme:
                    const ConnectorThemeData(space: 1.0, thickness: 1.0),
              ),
              builder: StatusChangeTileBuilder.connected(
                  // itemWidth: (_) =>
                  //     MediaQuery.of(context).size.width / _processes.length,
                contentWidgetBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'add content here',
                      style: TextStyle(
                        color: Colors
                            .blue, // change color with dynamic color --> can find it with example section
                      ),
                    ),
                  );
                },
                nameWidgetBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'your text ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getColor(index),
                      ),
                    ),
                  );
                },
                indicatorWidgetBuilder: (_, index) {
                  if (index <= _processIndex) {
                    return DotIndicator(
                      size: 35.0,
                      border: Border.all(color: Colors.green, width: 1),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const OutlinedDotIndicator(
                      size: 30,
                      borderWidth: 1.0,
                      color: todoColor,
                    );
                  }
                },
                lineWidgetBuilder: (index) {
                  if (index > 0) {
                    if (index == _processIndex) {
                      final prevColor = getColor(index - 1);
                      final color = getColor(index);
                      var gradientColors;
                      gradientColors = [
                        prevColor,
                        Color.lerp(prevColor, color, 0.5)
                      ];
                      return DecoratedLineConnector(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                          ),
                        ),
                      );
                    } else {
                      return SolidLineConnector(
                        color: getColor(index),
                      );
                    }
                  } else {
                    return null;
                  }
                },
                itemCount: _processes.length,
              ),
            ),
          ),
          AddAddress()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _processIndex++;
          });
        },
        backgroundColor: inProgressColor,
        child: const Icon(Icons.skip_next),
      ),
    );
  }
}
