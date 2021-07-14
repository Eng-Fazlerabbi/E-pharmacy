import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:epharmacy/provider/daySchedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

enum SingingCharacter { Hour, Nones }

class PharmacySchedule extends StatefulWidget {
  @override
  _PharmacyScheduleState createState() => _PharmacyScheduleState();
}

class _PharmacyScheduleState extends State<PharmacySchedule> {
  // SingingCharacter? _value = SingingCharacter.Hour;
  TimeOfDay? opentime;
  TimeOfDay? closetime;
  int radioValue = 1;

  getTime() async {
    TimeOfDay startTime =
        (await showTimePicker(context: context, initialTime: TimeOfDay.now()))!;

    setState(() {
      opentime = startTime;
    });
  }

  getTimes() async {
    TimeOfDay endTime =
        (await showTimePicker(context: context, initialTime: TimeOfDay.now()))!;

    setState(() {
      closetime = endTime;
    });
  }

  void _handleRadioValueChange(int? value) {
    setState(() {
      radioValue = value!;
      print(radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        offDayDropdown(),
        TitleWidget(sTitle: "Opening & Clossing Time"),
        openingtimePicker(),
        endTimePicker(),
        Row(
          children: [
            Radio(
              value: 24,
              groupValue: radioValue,
              onChanged: _handleRadioValueChange,
            ),
            Text('24 Hours'),
            Radio(
              value: 0,
              groupValue: radioValue,
              onChanged: _handleRadioValueChange,
            ),
            Text('none'),
          ],
        ),
      ],
    );
  }

  Padding openingtimePicker() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/clock_end.svg',
                height: 35,
                width: 10,
              ),
              onPressed: () {
                getTime();
              },
            ),
          ),
          opentime == null
              ? GestureDetector(
                  onTap: () {
                    getTime();
                  },
                  child: Text(
                    "Opening Time?",
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              : Text(
                  "Opening Time : ${opentime!.hour}:${opentime!.minute}",
                  style: TextStyle(fontSize: 18.0),
                ),
        ],
      ),
    );
  }

  Padding endTimePicker() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/clock_end.svg',
                height: 35,
                width: 10,
              ),
              onPressed: () {
                getTimes();
              },
            ),
          ),
          closetime == null
              ? GestureDetector(
                  onTap: () {
                    getTimes();
                  },
                  child: Text(
                    "Clossing Time?",
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              : Text(
                  "Clossing Time : ${closetime!.hour}:${closetime!.minute}",
                  style: TextStyle(fontSize: 18.0),
                ),
        ],
      ),
    );
  }

  Consumer offDayDropdown() {
    return Consumer<SelectSchedule>(builder: (_, data, child) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: ScreenSize.width,
            height: ScreenSize.height! * .07,
            child: DropdownButton<String>(
                isExpanded: true,
                focusColor: Colors.white,
                value: data.selected,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: data.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }).toList(),
                hint: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Choose Offday (Optional)',
                  ),
                ),
                onChanged: (String? value) {
                  data.selected = value;
                }),
          ),
        ],
      );
    });
  }
}

class TitleWidget extends StatelessWidget {
  final String sTitle;

  const TitleWidget({Key? key, required this.sTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        sTitle,
        style: TextStyle(
          color: kSeceonndaryColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
