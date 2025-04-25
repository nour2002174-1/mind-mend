import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/textfields.dart';
import 'package:first_try/features/home/presentation/views/widgets/appointments_icon/payment_view.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class first_appointments_reservation_view extends StatelessWidget {
  // Controllers for each input field
  final TextEditingController feelingController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

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
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavExample()),
                    );
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 100),
                Text(
                  'Appointment',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tell us briefly, how do you feel?',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 15),
            Textfields.loginTextField(
              hint: '',
              controller: feelingController,
              maxLines: 5,
            ),
            SizedBox(height: 15),
            Text(
              'Online or in clinic',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 15),
            Textfields.loginTextField(
              hint: 'online',
              controller: placeController,
            ),
            SizedBox(height: 15),
            Text(
              'What day is right for you?',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 15),
            Textfields.loginTextField(
              hint: '22/11/2024',
              controller: dateController,
            ),
            SizedBox(height: 15),
            Text(
              'Available times on this day are:',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 12),
            ..._buildTimeRows(context),
          ],
        ),
      ),
    );
  }

  // A helper method to build time rows
  List<Widget> _buildTimeRows(BuildContext context) {
    List<List<String>> times = [
      ['2pm to 3pm', '3pm to 4pm', '4pm to 5pm'],
      ['5pm to 6pm', '6pm to 7pm', '7pm to 8pm'],
      ['8pm to 9pm', '9pm to 10pm', '10pm to 11pm'],
    ];

    return times.map((row) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: Row(
          children: row.map((time) {
            return Padding(
              padding: const EdgeInsets.only(right: 4),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentView()),
                  );
                },
                child: Container(
                  height: 29,
                  width: time.length > 10 ? 120 : 94,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xffFFD166),
                  ),
                  child: Center(
                    child: Text(
                      time,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }).toList();
  }
}
