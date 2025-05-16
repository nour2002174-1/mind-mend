import 'package:first_try/constants.dart';
import 'package:flutter/material.dart';

class ReminderTile extends StatefulWidget {
  final String time;
  final String title;
  final String subtitle;
  final bool initialActiveState;

  const ReminderTile({
    Key? key,
    required this.time,
    required this.title,
    required this.subtitle,
    this.initialActiveState = false,
  }) : super(key: key);

  @override
  _ReminderTileState createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.initialActiveState;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 209, 102, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              widget.time,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(fontSize: 15, color: kPrimaryColor),
                ),
              ],
            ),
          ),
          Switch(
            value: isActive,
            onChanged: (value) {
              setState(() {
                isActive = value;
              });
            },
            activeColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}