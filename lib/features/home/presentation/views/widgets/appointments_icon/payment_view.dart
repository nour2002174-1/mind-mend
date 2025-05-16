import 'package:first_try/constants.dart';
import 'package:first_try/features/home/presentation/views/widgets/appointments_icon/appointment_confirmation_view.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, 
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.06),
                offset: Offset(0, 4),
                blurRadius: 44,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SafeArea(
            
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavExample()),
      );

                }, icon: Icon(Icons.arrow_back)),
                SizedBox(width: 100,),
                Text('Payment',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: 0,
                    color: kPrimaryColor
                    ),
                    ),
                
             
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
  cardNumber: '4242 4242 4242 4242',
  expiryDate: '04/27',
  cardHolderName: 'Nour Ahmed',
  cvvCode: '123',
  showBackView: false,
  isHolderNameVisible: true,
  cardBgColor: Colors.deepPurple,
  onCreditCardWidgetChange: (brand) {},
),
SizedBox(height: 15,),
Container(
  height: 625,
  width: 377,
  decoration: BoxDecoration(
     color: Colors.white, 
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40),
      topRight: Radius.circular(40),
      
    )
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
        child: Text('CREDIT CARD NUMBER',
        style: GoogleFonts.inter(
          color: Color(0xff1A1A1A4D),
          fontSize: 12,
          fontWeight: FontWeight.w900,
          
        ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
           obscureText: true,
           style: GoogleFonts.inter(
            color: kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700
           ),
          decoration: InputDecoration(
            border: UnderlineInputBorder(), 
            enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey), 
            ),
            focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.blue), 
            ),
           
            
          ),
        ),
      ),
       Padding(
        padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
        child: Text('CARD HOLDER NAME',
        style: GoogleFonts.inter(
          color: Color(0xff1A1A1A4D),
          fontSize: 12,
          fontWeight: FontWeight.w900,
          
        ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
           obscureText: true,
           style: GoogleFonts.inter(
            color: kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700
           ),
          decoration: InputDecoration(
            border: UnderlineInputBorder(), 
            enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey), 
            ),
            focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.blue), 
            ),
           
            
          ),
        ),
      ),
      Row(
        children: [
          Padding(
        padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
        child: Text('EXPIRY',
        style: GoogleFonts.inter(
          color: Color(0xff1A1A1A4D),
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
        ),
      ),
      SizedBox(width: 180,),
      Padding(
        padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
        child: Text('CVV',
        style: GoogleFonts.inter(
          color: Color(0xff1A1A1A4D),
          fontSize: 12,
          fontWeight: FontWeight.w900,
          
        ),
        ),
      ),
        ],

      ),
    Row(
  children: [
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          obscureText: false,
          style: GoogleFonts.inter(
            color: kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ),
    ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: TextField(
          obscureText: true, 
          style: GoogleFonts.inter(
            color: kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ),
    ),
  ],
),
SizedBox(height: 60,),
Row(
  children: [
    Checkbox(
      value: true,
      onChanged: (bool? value) {
       
      },
      activeColor: Color(0xFF78C2B3),
      checkColor: Colors.white,      
    ),
  
    Text(
      'Save this card for future transactions',
      style: GoogleFonts.inter(
        fontSize: 12,
        color: Color(0xFFBDBDBD),
        fontWeight: FontWeight.w400 
      ),
    ),
  ],
),
SizedBox(height: 40,),
Center(child: 
Text('Total',style: GoogleFonts.inter(
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: kPrimaryColor,
),)),
Center(
  child: Text('400',style: GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: kPrimaryColor,
  ),),
),
Padding(
  padding: const EdgeInsets.only(

    top:12,
right: 36,

bottom: 12,
left: 36

  ),
  child: Center(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        width: 181,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            backgroundColor: kPrimaryColor,
            
          ),
          onPressed: 
        (){
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AppointmentConfirmationView ()),
        );
        }, child: Text('Proceed to pay',style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700
        ),)),
      ),
    ),
  ),
)


      

    ],
  ),
)
          ],
        ),
      ),
   );
    
    











  }
}





