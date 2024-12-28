import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  late List<ThirdChartData> chartData;
  late TooltipBehavior _tooltipBehavior;

  late List<FourthChartData> fourthChartData;
  late TooltipBehavior _ftooltipBehavior;
  @override
  void initState() {
    chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            '\$${data.y.toStringAsFixed(0)}\n${DateFormat('dd MMMM, yyyy').format(data.x)}',
            textAlign: TextAlign.center,
          ),
        );
      },
    );

    fourthChartData = fourthGetChartData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            '${data.y.toStringAsFixed(3)}\n${DateFormat('dd MMM, yyyy').format(data.x)}',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
    super.initState();
  }

  List<ThirdChartData> getChartData() {
    return <ThirdChartData>[
      ThirdChartData(DateTime(2021, 8, 22), 7),
      ThirdChartData(DateTime(2021, 8, 23), 10),
      ThirdChartData(DateTime(2021, 8, 24), 5),
      ThirdChartData(DateTime(2021, 8, 25), 15),
      ThirdChartData(DateTime(2021, 8, 26), 25),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFollowerCard(),
            SizedBox(
              child: SfCircularChart(
                title: ChartTitle(text: 'Gender'), // Chart title
                series: <CircularSeries<ChartData, String>>[
                  DoughnutSeries<ChartData, String>(
                    dataSource: [
                      ChartData('Male', 352, const Color(0xff7C4DFF)),
                      ChartData('Female', 834, const Color(0xffFFCA28)),
                    ],
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    pointColorMapper: (ChartData data, _) => data.color,
                    innerRadius: '84%', // Adjust for the donut thickness
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                      connectorLineSettings: ConnectorLineSettings(
                        type: ConnectorType.curve,
                        length: '20%',
                      ),
                    ),
                    enableTooltip: true, // Enable tooltips
                    cornerStyle: CornerStyle.bothCurve,
                    startAngle: 95,
                    endAngle: 92,
                    opacity: 0.78,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Activity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '462,98K',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_upward,
                              color: Colors.green, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '3.48%',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 40,
                      interval: 10,
                      majorTickLines: const MajorTickLines(size: 0),
                      axisLine: const AxisLine(width: 0),
                      labelStyle: const TextStyle(fontSize: 12),
                    ),
                    series: <CartesianSeries<ThirdChartData, String>>[
                      SplineSeries<ThirdChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ThirdChartData data, _) => data.xString,
                        yValueMapper: (ThirdChartData data, _) => data.y,
                        color: const Color(0xFFFFA726),
                        width: 3,
                        markerSettings: const MarkerSettings(
                          isVisible: true,
                          color: Colors.white,
                          borderColor: Color(0xFFFFA726),
                          borderWidth: 2,
                          height: 10,
                          width: 10,
                        ),
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.top,
                          useSeriesColor: true,
                          builder:
                              (data, point, series, pointIndex, seriesIndex) {
                            if (pointIndex == 2) {
                              return Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  '\$${data.y.toStringAsFixed(0)}\n${DateFormat('dd MMMM, yyyy').format(data.x)}',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        enableTooltip: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Statistics',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'This Week',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Share',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            const Text(
                              '19,042',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8.0),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                children: const [
                                  Icon(Icons.arrow_upward,
                                      color: Colors.green, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    '4.85%',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Likes',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4.0),
                        const Text(
                          '34,3',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 40,
                      interval: 10,
                      majorTickLines: const MajorTickLines(size: 0),
                      axisLine: const AxisLine(width: 0),
                      labelStyle: const TextStyle(fontSize: 12),
                    ),
                    series: <CartesianSeries<FourthChartData, String>>[
                      ColumnSeries<FourthChartData, String>(
                        dataSource: fourthChartData,
                        xValueMapper: (FourthChartData data, _) => data.xString,
                        yValueMapper: (FourthChartData data, _) => data.y,
                        pointColorMapper: (FourthChartData data, _) =>
                            data.color,
                        width: 0.4,
                        spacing: 0.2,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.top,
                        ),
                        enableTooltip: true,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFollowerCard() {
    return Container(
      width: 320,
      height: 400,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Followers',
              ),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),

          // Total Followers
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '254,68K',
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_upward,
                        size: 14, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      '6.18%',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Chart
          SizedBox(
            height: 180,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                isVisible: false,
              ),
              plotAreaBorderWidth: 0,
              series: <ColumnSeries<_ChartData, String>>[
                ColumnSeries<_ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (_ChartData data, _) => data.day,
                  yValueMapper: (_ChartData data, _) => data.value,
                  pointColorMapper: (_ChartData data, _) => data.color,
                  width: 0.3,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
                  isTrackVisible: true,
                  trackColor: kLightGrayColor,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Followers and Unfollowers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '834',
                  ),
                  Text(
                    'Followers',
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Container(
                width: 1,
                height: 20,
                color: Colors.grey[300],
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Text(
                    '152',
                  ),
                  Text(
                    'Unfollowed',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<_ChartData> _getChartData() {
    return [
      _ChartData('M', 50, const Color(0xFF6A5AE0)), // Purple
      _ChartData('T', 70, const Color(0xFF6A5AE0)), // Purple
      _ChartData('W', 80, const Color(0xFF6A5AE0)), // Purple
      _ChartData('T', 100, kOrangeAccentColor), // Orange
      _ChartData('F', 60, const Color(0xFF6A5AE0)), // Purple
      _ChartData('S', 40, const Color(0xFF6A5AE0)), // Purple
      _ChartData('S', 50, const Color(0xFF6A5AE0)), // Purple
    ];
  }

  List<FourthChartData> fourthGetChartData() {
    return <FourthChartData>[
      FourthChartData(DateTime(2021, 8, 23), 15.650, const Color(0xFF7C4DFF)),
      FourthChartData(DateTime(2021, 8, 23), 2.550, const Color(0xFFFFCA28)),
      FourthChartData(DateTime(2021, 8, 23), 2.400, const Color(0xFFFFA726)),
      FourthChartData(DateTime(2021, 8, 23), 15.650, const Color(0xFF7C4DFF)),
      FourthChartData(DateTime(2021, 8, 23), 2.550, const Color(0xFFFFCA28)),
      FourthChartData(DateTime(2021, 8, 23), 2.400, const Color(0xFFFFA726)),
    ];
  }
}

class _ChartData {
  final String day;
  final double value;
  final Color color;

  _ChartData(this.day, this.value, this.color);
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class ThirdChartData {
  ThirdChartData(this.x, this.y);
  final DateTime x;
  final double y;

  String get xString => DateFormat('EEE').format(x); // Get short weekday name
}

class FourthChartData {
  FourthChartData(this.x, this.y, this.color);
  final DateTime x;
  final double y;
  final Color color;

  String get xString => DateFormat('EEE').format(x);
}
