
import 'package:first_try/constants.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/library/bookitems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';


class PodCastScreen extends StatefulWidget {
  static const String routeName = "PodCastScreen";

  @override
  _PodCastScreenState createState() => _PodCastScreenState();
}

class _PodCastScreenState extends State<PodCastScreen> {
  bool isEditing = false;

  late RefreshController _refreshController;

  final List<Map<String, String>> podCasts = [
    {
      "title": "The Advice Young People NEED To Hear",
      "youtuber": "Simon Sinek",
      "description": "The podcast features Simon Sinek discussing essential advice for ....",
      "image": "assets/images/image copy 33.png",
    },
    {
      "title": "The Importance of Consistency",
      "youtuber": "Mel Robbins",
      "description": "Mel shares how small consistent steps make big changes...",
      "image": "assets/images/image copy 33.png",
    },
    {
      "title": "Mindset of High Achievers",
      "youtuber": "Jay Shetty",
      "description": "A deep talk about how top performers think...",
      "image": "assets/images/image copy 33.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  void _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      podCasts.shuffle(); 
    });
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
       final navModel = Provider.of<BottomNavViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Stack(
               // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed:(){
                      Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavExample()),
            );
                    } ,
                    
                    icon: Icon(Icons.arrow_back, color: kPrimaryColor),
                  ),
                 
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Podcasts",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _onRefresh,
          header: CustomHeader(
            builder: (context, mode) {
              return Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 60,
                  width: 60,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/mic_icon.png', 
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          child: ListView.separated(
            itemCount: podCasts.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, index) {
              final podcast = podCasts[index];
              return Stack(
                children: [
                  BookItems(
                    title: podcast['title']!,
                    author: podcast['youtuber']!,
                    description: podcast['description']!,
                    image: podcast['image']!,
                    onTap: () {},
                  ),
                  if (isEditing)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            podCasts.removeAt(index);
                          });
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
       bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
      ),
    );
  }
}
