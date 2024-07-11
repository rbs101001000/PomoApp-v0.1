import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:pomoapp/home/homePage.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DailyProgress, String>> series = [
      charts.Series(
        id: 'Progress',
        data: [
          DailyProgress('Sat', 8),
          DailyProgress('Sun', 6),
          DailyProgress('Mon', 10),
          DailyProgress('Tue', 15),
          DailyProgress('Wed', 8),
          DailyProgress('Thu', 12),
          DailyProgress('Fri', 20),
        ],
        domainFn: (DailyProgress progress, _) => progress.day,
        measureFn: (DailyProgress progress, _) => progress.value,
        colorFn: (_, __) => charts.Color.fromHex(code: '#FFA500'),
      ),
    ];

    List<charts.Series<DailyProgress, String>> seriesW = [
      charts.Series(
        id: 'Progress',
        data: [
          DailyProgress('Sat', 8),
          DailyProgress('Sun', 16),
          DailyProgress('Mon', 14),
          DailyProgress('Tue', 5),
          DailyProgress('Wed', 18),
          DailyProgress('Thu', 12),
          DailyProgress('Fri', 10),
        ],
        domainFn: (DailyProgress progress, _) => progress.day,
        measureFn: (DailyProgress progress, _) => progress.value,
        colorFn: (_, __) => charts.Color.fromHex(code: '#FFA500'), // Change color to red
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Progress Page"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              padding: const EdgeInsets.all(16),
              child: charts.BarChart(
                series,
                animate: true,

              ),
            ),
            const SizedBox(
                width: 300,
                child: Divider()),
            const Text("Last Week Progress",style: TextStyle(fontSize: 20),),
            Container(
              height: 300,
              padding: const EdgeInsets.all(16),
              child: charts.BarChart(
                seriesW,
                animate: true,
              ),
            ),
            const SizedBox(
                width: 300,
                child: Divider()),
            const Text("This Week Progress: ",style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
class DailyProgress {
  final String day;
  final int value;

  DailyProgress(this.day, this.value);
}
