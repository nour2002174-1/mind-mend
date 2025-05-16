
import 'package:first_try/constants.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget{
final String routeName;

ActionButton({required this.routeName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10,right: 10),
      child: FloatingActionButton(onPressed: (){
      Navigator.pushNamed(context, routeName);
      },
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.add_circle_outline,color: Colors.white,size: 40 ,)),);

}}