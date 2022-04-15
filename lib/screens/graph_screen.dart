import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {

    final List<EarningsTimeline> listEarnings = [
      EarningsTimeline(date: "01",earning: 18.5),
      EarningsTimeline(date: "02", earning: 20.0),
      EarningsTimeline(date: "03", earning: 21),
      EarningsTimeline(date: "04", earning: 30),
      EarningsTimeline(date: "05", earning: 38),
      EarningsTimeline(date: "06", earning: 42),
      EarningsTimeline(date: "07", earning: 43.5),
      EarningsTimeline(date: "08", earning: 73),
      // EarningsTimeline(date: "09/03/2022", earning: 79.6),
      // EarningsTimeline(date: "10/03/2022", earning: 82),
      // EarningsTimeline(date: "11/03/2022", earning: 82),
      // EarningsTimeline(date: "12/03/2022", earning: 82),
      // EarningsTimeline(date: "13/03/2022", earning: 82),
      // EarningsTimeline(date: "14/03/2022", earning: 82),
      // EarningsTimeline(date: "15/03/2022", earning: 117),
    ];

    List<charts.Series<EarningsTimeline, String>> timeline = [
      charts.Series(
        id: "Subscribers",
        data: listEarnings,
        domainFn: (EarningsTimeline timeline, _) => timeline.date!,
        measureFn: (EarningsTimeline timeline, _) => timeline.earning,
      )
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Flutter Charts Sample")),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Cristiano Ronaldo Earnings (\$M)"),
                  Expanded(
                    child: charts.BarChart(timeline, animate: true),
                  ),
                  Text("Source: Forbes"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EarningsTimeline {
  String? date;
  double? earning;

  EarningsTimeline({
    this.date,
    this.earning,
  });
}