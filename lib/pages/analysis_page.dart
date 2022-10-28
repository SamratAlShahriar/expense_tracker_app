import 'dart:math';

import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';

import '../themes/colors.dart';

class AnalysisPage extends StatefulWidget {
  static const String routeName = '/analysis_page';

  const AnalysisPage({Key? key}) : super(key: key);

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  late TransactionProvider transactionProvider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    transactionProvider.getCategoryWiseExpenseList(1);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.analytics,
            color: Colors.blue,
          ),
          title: Text('Analysis', ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Text('Show Expnses by category'),
              ],
            ),
            SizedBox(height: 100,),
            FutureBuilder(
              future: transactionProvider.getCategoryWiseExpenseList(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final mData = transactionProvider.categoryWiseExpenseList;
                  Map<String, double> dataMap = <String, double>{};
                  mData.forEach((element) {
                    dataMap.addAll({element.category: element.categorySum});
                  });

                  return dataMap == null || dataMap.isEmpty ? Column(
                    children: [
                      Text('NO DATA TO SHOW'),
                      Image.asset('assets/images/no_analysis.jpg'),
                    ],
                  ) : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorBlueLight,
                        border: Border.all(width: 1, color: colorBlueDark),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 36.0,),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: PieChart(
                          dataMap: dataMap,
                          animationDuration: Duration(milliseconds: 800),
                          chartLegendSpacing: 32,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          colorList: colorList,
                          initialAngleInDegree: 0,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 32,
                          centerText: "EXPENSE",
                          legendOptions: LegendOptions(
                            showLegendsInRow: false,
                            legendPosition: LegendPosition.right,
                            showLegends: true,
                            legendShape: BoxShape.circle,
                            legendTextStyle: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          chartValuesOptions: ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: true,
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: true,
                            decimalPlaces: 0,
                          ),
                          // gradientList: ---To add gradient colors---
                          // emptyColorGradient: ---Empty Color gradient---
                        ),
                      ),
                    ),
                  );
                }

                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
