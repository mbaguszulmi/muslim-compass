import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Schedule extends StatefulWidget {

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime _currentDate = DateTime.now();
  DateFormat _formatDate = DateFormat("d MMMM yyyy");
  TextStyle _cardMainTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16
  );
  

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 70),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(20, 9, 20, 9),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFECECEC),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () async {
                DateTime pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _currentDate,
                  firstDate: DateTime(1996),
                  lastDate: DateTime(2030)
                );

                if (pickedDate != null && pickedDate != _currentDate) {
                  setState(() {
                    _currentDate = pickedDate;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _formatDate.format(_currentDate),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF2F2F2F)
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/mdi-calendar-month-outline.svg',
                      semanticsLabel: 'Calendar',
                      height: 32,
                    )
                  ],
                ),
              ),
            ),
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Waktu saat ini',
                  style: TextStyle(
                    fontSize: 26,
                  )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: <BoxShadow> [
                    BoxShadow(
                      blurRadius: 14,
                      offset: Offset(0, 4),
                      color: Color.fromRGBO(0, 0, 0, 0.1)
                    )
                  ]
                ),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.asset(
                        'assets/illustrations/IllustrationImsak.svg',
                        semanticsLabel: 'Illustrations',
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.width * 190.67 / 371,
                      ),
                    ),
                    // Card content
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/icons/mdi-clipboard-list-outline.svg',
                                      semanticsLabel: 'Clipboard',
                                      width: 24,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Imsak',
                                      style: _cardMainTextStyle,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/icons/mdi-timer-sand.svg',
                                      semanticsLabel: 'TimerSand',
                                      width: 24,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '8 menit',
                                      style: _cardMainTextStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/icons/mdi-clock-outline.svg',
                                  semanticsLabel: 'TimerSand',
                                  width: 24,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '03:31',
                                  style: _cardMainTextStyle,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(bottom: 20, top: 30),
                child: Text(
                  'Semua waktu',
                  style: TextStyle(
                    fontSize: 26,
                  )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                    color: Colors.orange,
                  ),
                  boxShadow: <BoxShadow> [
                    BoxShadow(
                      blurRadius: 15,
                      offset: Offset(0, 4),
                      color: Color.fromRGBO(0, 0, 0, 0.1)
                    )
                  ]
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/mdi-clipboard-list-outline.svg',
                                semanticsLabel: 'Clipboard',
                                width: 24,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Imsak',
                                style: _cardMainTextStyle,
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                '3 menit tersisa',
                                style:TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  color: Color(0xFF656565)
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icons/mdi-clock-outline.svg',
                            semanticsLabel: 'TimerSand',
                            width: 24,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '03:31',
                            style: _cardMainTextStyle,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}