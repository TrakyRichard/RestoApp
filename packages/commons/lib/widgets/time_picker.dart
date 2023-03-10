import 'package:commons/utils/validator.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final TextEditingController controller;
  final void Function() onTap;
  final String title;
  const TimePicker(
      {super.key,
      required this.controller,
      required this.onTap,
      required this.title});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  void initState() {
    widget.controller.text =
        "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}";
    super.initState();
  }

  TimeOfDay timeOfDay = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        validator: (value) {
          return generiqueValidator(value, "Time") ??
              timeValidator(value, "Time");
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          icon: const Icon(Icons.access_time),
          labelText: widget.title,
        ),
        onTap: () async {
          var time =
              await showTimePicker(context: context, initialTime: timeOfDay);
          if (time != null) {
            setState(() {
              widget.controller.text = "${time.hour}:${time.minute}";
            });
            widget.onTap();
          }
        },
      ),
    );
  }
}
