import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



 modelBottomSheetForEventsCreation(context){
   return showModalBottomSheet(
       isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Add Schedule",
                      style: TextStyle(color: Color.fromRGBO(5, 77, 185, 1,),fontSize: 16,
                        fontWeight: FontWeight.w500

                  ),
                      ),
                      IconButton(onPressed:()=> Navigator.pop(context),
                        icon: Icon(Icons.clear, color: Colors.black,size: 25),)
                    ],
                  ),

                ),
                SizedBox(
                  height: 45,
                ),
                Text("Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                Padding(
                  padding: const EdgeInsets.only(top: 15,

                  ),
                  child: TextField(

                decoration: new InputDecoration(
                  // focusColor: Colors.black,
                  filled: true,
                  fillColor: Color.fromRGBO(229, 239, 255, 1),


                  // focusedBorder: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
            // ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color:  Color.fromRGBO(229, 239, 255, 1), width: .4),
            ),
            //
            ),
                ),),
                Padding(
                  padding: const EdgeInsets.only(top:20.0,bottom: 15),
                  child: Text("Date And Time",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                ),
          Container(
            child: Column(children: [
              TextField(

                decoration: new InputDecoration(
                  // focusColor: Colors.black,
                  filled: true,
                  fillColor: Color.fromRGBO(229, 239, 255, 1),


                  // focusedBorder: OutlineInputBorder(
                  // borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color:  Color.fromRGBO(229, 239, 255, 1), width: .4),
                  ),
                  //
                ),
              ),
              TextField(

                decoration: new InputDecoration(
                  // focusColor: Colors.black,
                  filled: true,
                  fillColor: Color.fromRGBO(229, 239, 255, 1),


                  // focusedBorder: OutlineInputBorder(
                  // borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color:  Color.fromRGBO(229, 239, 255, 1), width: .4),
                  ),
                  //
                ),
              ),
              TextField(

                decoration: new InputDecoration(
                  // focusColor: Colors.black,
                  filled: true,
                  fillColor: Color.fromRGBO(229, 239, 255, 1),


                  // focusedBorder: OutlineInputBorder(
                  // borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color:  Color.fromRGBO(229, 239, 255, 1), width: .4),
                  ),
                  //
                ),
              ),
            ],),
          ),

               SizedBox(
                 height: 20,
               )
              ],
            ),
          ),
        );
      });

}