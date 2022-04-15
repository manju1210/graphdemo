import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionGraphScreen extends StatefulWidget {
  const SyncfusionGraphScreen({Key? key}) : super(key: key);

  @override
  State<SyncfusionGraphScreen> createState() => _SyncfusionGraphScreenState();
}

class _SyncfusionGraphScreenState extends State<SyncfusionGraphScreen> {

  List<SalesData> data = [
    SalesData(02, 35.0),
    SalesData(03, 28.0),
    SalesData(04, 34.0),
    SalesData(05, 0.0),
    SalesData(06, 32.0),
    SalesData(07, 40.0),
  ];

  //Initialize the data source.
  List<ChartSampleData > chartData = <ChartSampleData>[
    ChartSampleData(x: 'China', y: 0.541),
    ChartSampleData(x: 'Brazil', y: 0.818),
    ChartSampleData(x: 'Bolivia', y: 1.51),
    ChartSampleData(x: 'Mexico', y: 1.302),
    ChartSampleData(x: 'Egypt', y: 2.017),
    ChartSampleData(x: 'Mongolia', y: 1.683),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0,bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cristiano Ronaldo Earnings (\$M)"),
                const SizedBox(height: 20,),
                SfCartesianChart(
                  series: <ColumnSeries<SalesData, double>>[
                    ColumnSeries<SalesData, double>(
                      // Binding the chartData to the dataSource of the column series.
                      dataSource: data,
                      xValueMapper: (SalesData sales, _) => sales.sales,
                      yValueMapper: (SalesData sales, _) => sales.day,
                    ),
                  ],
                ),
                // Expanded(
                //   child: SfCartesianChart(
                //     series: <ChartSeries>[
                //       BarSeries<SalesData, double>(
                //         dataSource: data,
                //         xValueMapper: (SalesData data, _) => data.sales,
                //         yValueMapper: (SalesData data, _) => data.day,
                //         width: 0.6, // Width of the bars
                //         spacing: 0.3,// Spacing between the bars
                //
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Syncfusion Flutter chart'),
  //       ),
  //       body: Column(children: [
  //         //Initialize the chart widget
  //         SfCartesianChart(
  //             primaryXAxis: CategoryAxis(),
  //             // Chart title
  //             title: ChartTitle(text: 'Half yearly sales analysis'),
  //             // Enable legend
  //             legend: Legend(isVisible: true),
  //             // Enable tooltip
  //             tooltipBehavior: TooltipBehavior(enable: true),
  //             series: <ChartSeries<SalesData, String>>[
  //               LineSeries<SalesData, String>(
  //                   dataSource: data,
  //                   xValueMapper: (SalesData sales, _) => sales.year,
  //                   yValueMapper: (SalesData sales, _) => sales.sales,
  //                   name: 'Sales',
  //                   // Enable data label
  //                   dataLabelSettings: DataLabelSettings(isVisible: true))
  //             ]),
  //         Expanded(
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             //Initialize the spark charts widget
  //             child: SfSparkLineChart.custom(
  //               //Enable the trackball
  //               trackball: SparkChartTrackball(
  //                   activationMode: SparkChartActivationMode.tap),
  //               //Enable marker
  //               marker: SparkChartMarker(
  //                   displayMode: SparkChartMarkerDisplayMode.all),
  //               //Enable data label
  //               labelDisplayMode: SparkChartLabelDisplayMode.all,
  //               xValueMapper: (int index) => data[index].year,
  //               yValueMapper: (int index) => data[index].sales,
  //               dataCount: 5,
  //             ),
  //           ),
  //         )
  //       ]));
  // }

}

class SalesData {
  SalesData(this.day, this.sales);

  final int day;
  final double sales;
}

class ChartSampleData {
  ChartSampleData({this.x, this.y});

  String? x;
  double? y;
}