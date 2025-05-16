
import 'package:first_try/constants.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/library/bookitems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';


class LibraryScreen extends StatefulWidget {
  static const String routeName = "LibraryScreen";

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool isEditing = false;
  RefreshController _refreshController = RefreshController();

  void _onRefresh() async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    _refreshController.refreshCompleted();
  }

  final List<Map<String, String>> _books = [
    {
      "title": "The Noonday Demon:\nAn Atlas of Depression",
      "author": "Andrew Solomon",
      "description": "A comprehensive and empathetic exploration of depression...",
      "image": "assets/images/image copy 34.png",
    },
    {
      "title": "The Psychopathology of Everyday Life",
      "author": "Sigmund Freud",
      "description": "Freud explores how our everyday mistakes and slips of the tongue...",
      "image": "assets/images/image copy 35.png",
    },
    {
      "title": "Thinking, Fast and Slow",
      "author": "Daniel Kahneman",
      "description": "Kahneman dives into the two types of thinking—fast and slow...",
      "image": "assets/images/image copy 36.png",
    },{
      "title": "The Noonday Demon:\nAn Atlas of Depression",
      "author": "Andrew Solomon",
      "description": "A comprehensive and empathetic exploration of depression...",
      "image": "assets/images/image copy 36.png",
    },
    {
      "title": "The Psychopathology of Everyday Life",
      "author": "Sigmund Freud",
      "description": "Freud explores how our everyday mistakes and slips of the tongue...",
      "image": "assets/images/image copy 36.png",
    },
    {
      "title": "Thinking, Fast and Slow",
      "author": "Daniel Kahneman",
      "description": "Kahneman dives into the two types of thinking—fast and slow...",
      "image": "assets/images/image copy 36.png",
    },{
      "title": "The Noonday Demon:\nAn Atlas of Depression",
      "author": "Andrew Solomon",
      "description": "A comprehensive and empathetic exploration of depression...",
      "image": "assets/images/image copy 36.png",
    },
    {
      "title": "The Psychopathology of Everyday Life",
      "author": "Sigmund Freud",
      "description": "Freud explores how our everyday mistakes and slips of the tongue...",
      "image": "assets/images/image copy 36.png",
    },
    {
      "title": "Thinking, Fast and Slow",
      "author": "Daniel Kahneman",
      "description": "Kahneman dives into the two types of thinking—fast and slow...",
      "image": "assets/images/image copy 36.png",
    },
  ];

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
               //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                       Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavExample()),
            );
                    },
                    icon: Icon(Icons.arrow_back, color: kPrimaryColor),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Library",
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
          onRefresh: _onRefresh,
          header: CustomHeader(
            builder: (context, mode) {
              bool isLoading = mode == RefreshStatus.refreshing || mode == RefreshStatus.canRefresh;
              return Container(
                height: 80,
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.menu_book_rounded,
                      size: 40,
                      color:kPrimaryColor,
                    ),
                    if (isLoading)
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          child: ListView.separated(
            itemCount: _books.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, index) {
              final book = _books[index];
              return Stack(
                children: [
                  BookItems(
                    title: book['title']!,
                    author: book['author']!,
                    description: book['description']!,
                    image: book['image']!,
                    onTap: () {},
                  ),
                  if (isEditing)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _books.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.close, color: Colors.red, size: 30),
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
