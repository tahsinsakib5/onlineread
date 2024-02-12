import 'package:flutter/material.dart';

class Template extends StatelessWidget {
 
 final String massege;

  Template({super.key, required this.massege, });

  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.all(8.0),
        // child: Align(
        //     alignment:true ? Alignment.centerRight : Alignment.centerLeft ,
          child:   Container(
          
              width:MediaQuery.of(context).size.width * 0.56,
              
              padding: const EdgeInsets.all(12),
                  color:Colors.black,
                child: Text(
            massege,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: true ? Colors.white : Colors.black),
            textAlign: TextAlign.start,
                ),
              ),
          );
      
  }
}