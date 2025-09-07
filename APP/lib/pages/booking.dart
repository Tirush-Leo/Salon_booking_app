import 'package:flutter/material.dart';
import 'package:salonapp01/services/database.dart';

import '../services/shared_pref.dart';

class Booking extends StatefulWidget {
  String service;
  Booking({required this.service});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String? name, image, email;

  getthedatafromsharepref()async{
    name= await SharePreferenceHelper().getUserName();
    image= await SharePreferenceHelper().getUserImage();
    email = await SharePreferenceHelper().getUserEmail();
    setState(() {

    });
  }

  getontheload()async{
    await getthedatafromsharepref();
    setState(() {

    });
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  DateTime _selectedDate = DateTime.now();
  Future<void> _selectData(BuildContext contect)async{
    final DateTime? picked = await showDatePicker(context: context, firstDate: DateTime(2025), lastDate: DateTime(2026));
    if(picked!=null && picked!=_selectedDate){
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  TimeOfDay _selectedTime= TimeOfDay.now();

  Future<void> _selectTime(BuildContext Context) async{
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: _selectedTime);
    if(picked!=null && picked!=_selectedTime){
      setState(() {
        _selectedTime = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b1615),
      body: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white,size: 30.0,),
              ),
            ),
            SizedBox(height: 30.0,),
            Text("Let the \n journey begin", style: TextStyle(color: Colors.white70, fontSize: 28.0, fontWeight: FontWeight.w500 ),),
            SizedBox(height: 40.0,),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("images/discount.png", fit: BoxFit.cover,)),
            SizedBox(height: 20.0,),
            Text(widget.service, style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              decoration: BoxDecoration(color: Color(0xFFb4817e), borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Text("Set a Date", style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){
                          _selectData(context);
                        },
                        child: Icon(Icons.calendar_month, color: Colors.white, size: 30.0,)),
                    SizedBox(width: 20.0,),
                    Text("${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}", style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),),
                  ],
                )
              ],) ,
            ),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              decoration: BoxDecoration(color: Color(0xFFb4817e), borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Text("Set a Time", style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){
                          _selectTime(context);
                        },
                        child: Icon(Icons.alarm, color: Colors.white, size: 30.0,)),
                    SizedBox(width: 20.0,),
                    Text(_selectedTime.format(context), style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),),
                  ],
                )
              ],) ,
            ),
            SizedBox(height: 40.0,),
            GestureDetector(
              onTap: () async{
                Map<String, dynamic> userBookingmap = {
                  "Service" : widget.service,
                  "Date" : "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}".toString(),
                  "Time" : _selectedTime.format(context).toString(),
                  "Username" : name,
                  "Image" : image,
                  "Email" : email,
                };
                await DatabaseMethods().addUserBooking(userBookingmap).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Service has been booked Successfully!!!", style: TextStyle(fontSize: 20.0),)));
                } );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                decoration: BoxDecoration(
                    color: Color(0xFFfe8f33), borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text("BOOK NOW", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold) ,)),
              ),
            )
          ],),),
    );
  }
}
