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
      body: Center(
        child: Text('Schedule'),
      ),
    );
  }
}