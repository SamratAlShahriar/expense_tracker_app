import 'dart:math';

import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';

import '../constants/const_strings.dart';
import '../themes/colors.dart';

class AnalysisPage extends StatefulWidget {
  static const String routeName = '/analysis_page';

  const AnalysisPage({Key? key}) : super(key: key);

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  late TransactionProvider transactionProvider;
  String selectionType = TYPE_ALL;

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
          title: Text(
            'Analysis',
          ),
        ),
        body: Column(
          children: [
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //choice of transaction type
                  SizedBox(
                    width: MediaQuery.of(context).size.width-8,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        SizedBox(
                          width: 2.0,
                        ),
                        ChoiceChip(
                          elevation: 1,
                          label: Text(
                            TYPE_ALL,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: selectionType == TYPE_ALL
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          selected: selectionType == TYPE_ALL ? true : false,
                          backgroundColor: Colors.white70,
                          selectedColor: colorBlueDark,
                          onSelected: (value) {
                            setState(() {
                              selectionType = TYPE_ALL;
                            });
                          },
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        ChoiceChip(
                          elevation: 1,
                          label: Text(
                            LAST_7_DAYS,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: selectionType == LAST_7_DAYS
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          selected: selectionType == LAST_7_DAYS ? true : false,
                          backgroundColor: Colors.white70,
                          selectedColor: colorBlueDark,
                          onSelected: (value) {
                            setState(() {
                              selectionType = LAST_7_DAYS;
                            });
                          },
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        ChoiceChip(
                          elevation: 1,
                          label: Text(
                            LAST_30_DAYS,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: selectionType == LAST_30_DAYS
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          selected: selectionType == LAST_30_DAYS ? true : false,
                          backgroundColor: Colors.white70,
                          selectedColor: colorBlueDark,
                          onSelected: (value) {
                            setState(() {
                              selectionType = LAST_30_DAYS;
                            });
                          },
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        ChoiceChip(
                          elevation: 1,
                          label: Text(
                            LAST_1_YEAR,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: selectionType == LAST_1_YEAR
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          selected: selectionType == LAST_1_YEAR ? true : false,
                          backgroundColor: Colors.white70,
                          selectedColor: colorBlueDark,
                          onSelected: (value) {
                            setState(() {
                              selectionType = LAST_1_YEAR;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder(
              future: transactionProvider.getCategoryWiseExpenseList(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final mData = transactionProvider.categoryWiseExpenseList;
                  Map<String, double> dataMap = <String, double>{};
                  mData.forEach((element) {
                    dataMap.addAll({element.category: element.categorySum});
                  });

                  return dataMap == null || dataMap.isEmpty
                      ? Column(
                          children: [
                            Text('NO DATA TO SHOW'),
                            Image.asset('assets/images/no_analysis.jpg'),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: colorBlueLight,
                              border:
                                  Border.all(width: 1, color: colorBlueDark),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 36.0,
                            ),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: PieChart(
                                dataMap: dataMap,
                                animationDuration: Duration(milliseconds: 800),
                                chartLegendSpacing: 32,
                                chartRadius:
                                    MediaQuery.of(context).size.width / 3.2,
                                colorList: colorList,
                                initialAngleInDegree: 0,
                                chartType: ChartType.ring,
                                ringStrokeWidth: 32,
                                centerText: "EXPENSE\nCATEGORY",
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
