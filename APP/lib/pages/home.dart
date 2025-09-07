import 'package:salonapp01/pages/booking.dart';
import 'package:flutter/material.dart';
import 'package:salonapp01/services/shared_pref.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name, image;

  getthedatafromsharepref()async{
    name= await SharePreferenceHelper().getUserName();
    image= await SharePreferenceHelper().getUserImage();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b1615),
      body: Container(
        margin: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello,", style: TextStyle(color: Color.fromARGB(
                        195, 255, 255, 255), fontSize: 24.0, fontWeight: FontWeight.w500 ),),
                    Text(name!, style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold ),)
                  ],
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("images/boy.jpg", height: 60, width: 60, fit: BoxFit.cover,))
              ],),
            SizedBox(height: 20.0,),
            Divider(color: Colors.white30,),
            SizedBox(height: 20.0,),
            Text("Services", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold ),),
            SizedBox(height: 20.0,),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(service: "Classic Shaving")));
                    },
                    child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color(0xFFe29452), borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/shaving.jpg", height: 85, width: 85, fit: BoxFit.cover,),
                            SizedBox(height: 10.0,),
                            Text("Shaving", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold ),),
                          ],
                        )
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(service: "Hair Washing")));
                    },
                    child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color(0xFFe29452), borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/hair.png", height: 85, width: 85, fit: BoxFit.cover,),
                            SizedBox(height: 10.0,),
                            Text("Hair Washing", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold ),),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(service: "Beard Trimming")));
                    },
                    child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color(0xFFe29452), borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/beard.png", height: 85, width: 85, fit: BoxFit.cover,),
                            SizedBox(height: 10.0,),
                            Text("Beard Trimming", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold ),),
                          ],
                        )
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(service: "Hair Cutting")));
                    },
                    child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color(0xFFe29452), borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/cutting.jpg", height: 85, width: 85, fit: BoxFit.cover,),
                            SizedBox(height: 10.0,),
                            Text("Hair Cutting", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold ),),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(service: "Facials")));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color(0xFFe29452), borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/facials.jpeg", height: 85, width: 85, fit: BoxFit.cover,),
                            SizedBox(height: 10.0,),
                            Text("Facials", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold ),),
                          ],
                        )
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(service: "Kids HairCutting")));
                    },
                    child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color(0xFFe29452), borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/kids.jpg", height: 85, width: 85, fit: BoxFit.cover,),
                            SizedBox(height: 10.0,),
                            Text("Kids HairCutting", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold ),),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            )


          ],),),
    );
  }
}
