import 'package:flutter/material.dart';

class GeneralUtilities {
  static Map<String, double> getSizes(GlobalKey globalKey) {
    final RenderBox renderBoxWidget =
        globalKey.currentContext.findRenderObject();
    final widgetHeight = renderBoxWidget.size.height;
    final widgetWidth = renderBoxWidget.size.width;
    print("widgetHeight of Widget: $widgetHeight");
    print("widgetWidth of Widget: $widgetWidth");

    return {
      'widgetHeight': widgetHeight,
      'widgetWidth': widgetWidth,
    };
  }

  static Widget connectionProblemWidget(double height, Function retryFn) {
    return Container(
      height: height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Connection Failed!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          RaisedButton(
            color: Colors.grey,
            child:const Text(
              'Retry',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: retryFn,
          ),
        ],
      ),
    );
  }

  static void errorAlert(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Alert Message Title Text.'),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
