import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/core/utils/textfields.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Edit_appointment extends StatelessWidget{
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
                    letterSpacing: 0,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          )
          
          ),
          body: Edit_appointment_body(),
    );
  }
}
class Edit_appointment_body extends StatefulWidget{
  
  @override
  State<Edit_appointment_body> createState() => _Edit_appointment_bodyState();
}

class _Edit_appointment_bodyState extends State<Edit_appointment_body> {
    final TextEditingController DateController = TextEditingController();
  void _selectBirthDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      DateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }
  @override
  Widget build(BuildContext context) {
   return Column(
   mainAxisAlignment: MainAxisAlignment.start,
   children: [
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'What day is right for you?',
          style: 
          GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
                  onTap: () => _selectBirthDate(context),
                  child: AbsorbPointer(
                    child: buildInputField(
                      hint: '23/11/2025',
                      controller: DateController,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AssetsData.calender_icon,
                          height: 9,
                          width: 9,
                        ),
                      ),
                      validator: (value) =>
                          value == null || value.isEmpty ? "Select the date" : null,
                    ),
                  ),
                ),
    ),
    SizedBox(height: 10,),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Available times on this day are:',
          style: 
          GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14),
        ),
      ),
    ),
   ],
   );
  }
}
 Widget buildInputField({
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Textfields.loginTextField(
      hint: hint,
      controller: controller,
      isPassword: isPassword,
      suffixIcon: suffixIcon,
      validator: validator,
    );
  }
