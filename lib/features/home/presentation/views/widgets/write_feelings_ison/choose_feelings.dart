import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/write_feelings_ison/feeling_confirmationscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseFeelings_View extends StatefulWidget {
  @override
  State<ChooseFeelings_View> createState() => _ChooseFeelingsViewState();
}

class _ChooseFeelingsViewState extends State<ChooseFeelings_View> {
  final GlobalKey<_ChooseFeelings_ViewbodyState> _feelingsBodyKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<BottomNavViewModel>(context);
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
            child: Stack(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavExample()),
                      );
                    },
                    icon: Icon(Icons.arrow_back,color: kPrimaryColor,),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Feelings',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 0,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ChooseFeelings_Viewbody(key: _feelingsBodyKey),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
      ),
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: () {
            if (_feelingsBodyKey.currentState != null && 
                _feelingsBodyKey.currentState!.selectedFeelings.isNotEmpty) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => FeelingsConfirmationScreen(
                    selectedFeelings: _feelingsBodyKey.currentState!.selectedFeelings,
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please select at least one feeling')),
              );
            }
          },
          child: Image.asset(AssetsData.pen_icon2, height: 15,width:15),
          backgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}

final Map<String, Color> feelingBgColors = {
  'Happiness': Color(0xffFFD166),
  'Sadness': kPrimaryColor,
  'Anger': Color(0xffEC6746),
  'Joy': Color(0xffFFD166),
  'Melancholy': kPrimaryColor,
  'Frustration': Color(0xffEC6746),
  'Contentment': Color(0xffFFD166),
  'Grief': kPrimaryColor,
  'Aggression': Color(0xffEC6746),
  'Hope': Color(0xffFFD166),
  'Loneliness': kPrimaryColor,
  'Rage': Color(0xffEC6746),
  'Fear': Colors.black,
  'Disgust': Color(0xff70C1B3),
  'Surprise': Color(0xffEC6746),
  'Anxiety': Colors.black,
  'Aversion': Color(0xff70C1B3),
  'Amazement': Color(0xffEC6746),
  'Terror': Colors.black,
  'Loathing': Color(0xff70C1B3),
  'Shock': Color(0xffEC6746),
  'Nervousness': Colors.black,
  'Love': Color(0xffEC6746),
  'Acceptance': Color(0xff70C1B3),
  'Affection': Color(0xffEC6746),
  'Inner Peace': Color(0xff70C1B3),
  'Gratitude': Color(0xffEC6746),
  'Appreciation': Color(0xff70C1B3),
  'Passion': Color(0xffEC6746),
};

class ChooseFeelings_Viewbody extends StatefulWidget {
  const ChooseFeelings_Viewbody({Key? key}) : super(key: key);

  @override
  State<ChooseFeelings_Viewbody> createState() => _ChooseFeelings_ViewbodyState();
}

class _ChooseFeelings_ViewbodyState extends State<ChooseFeelings_Viewbody> {
  List<String> selectedFeelings = [];
  List<String> allFeelings = feelingBgColors.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'How do you feel now?',
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3,
            ),
            itemCount: allFeelings.length,
            itemBuilder: (context, index) {
              final feeling = allFeelings[index];
              return FeelingChip(
                feeling: feeling,
                isSelected: selectedFeelings.contains(feeling),
                onTap: () {
                  setState(() {
                    if (selectedFeelings.contains(feeling)) {
                      selectedFeelings.remove(feeling);
                    } else if (selectedFeelings.length < 3) {
                      selectedFeelings.add(feeling);
                    }
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class FeelingChip extends StatelessWidget {
  final String feeling;
  final bool isSelected;
  final VoidCallback onTap;

  const FeelingChip({
    required this.feeling,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = feelingBgColors[feeling] ?? Colors.grey[200]!;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 29,
        width: 100,
        decoration: BoxDecoration(
          color: isSelected ? bgColor.withOpacity(0.7) : bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              feeling,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

  