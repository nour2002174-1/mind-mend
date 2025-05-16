import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_try/constants.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:provider/provider.dart';

class Navigatorbar_seetings extends StatefulWidget {
  @override
  _Navigatorbar_seetingsState createState() => _Navigatorbar_seetingsState();
}

class _Navigatorbar_seetingsState extends State<Navigatorbar_seetings> {
  String firstName = '';
  String lastName = '';
  bool isLoading = true;
  bool isFaceIDEnabled = false;

  @override
  void initState() {
    super.initState();
    fetchFirstNameandLastName();
  }

  Future<void> fetchFirstNameandLastName() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance
            .collection('users_collection')
            .doc(user.uid)
            .get();

        setState(() {
          firstName = doc['firstName'] ?? '';
          lastName = doc['lastName'] ?? '';
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching first name and last name: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 4),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Your Profile",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: 4,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.blueGrey, size: 45),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: isLoading
                      ? Center(child: CircularProgressIndicator(color: Colors.white))
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$firstName $lastName',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '@${firstName.toLowerCase()}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfileScreen()),
                    );
                    fetchFirstNameandLastName(); // Re-fetch after editing
                  },
                  child: const Icon(Icons.edit, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildSection("Security Settings"),
          _buildCustomTile(
            context,
            "Enable Face ID",
            Icons.face,
            Switch(
              value: isFaceIDEnabled,
              onChanged: (value) {
                setState(() {
                  isFaceIDEnabled = value;
                });
              },
              activeColor: kPrimaryColor,
            ),
          ),
          const SizedBox(height: 10),
          _buildCustomTile(
            context,
            "Change Password",
            Icons.lock_outline,
            Icon(Icons.arrow_forward_ios, size: 18),
          ),
          const SizedBox(height: 20),
          _buildSection("General Settings"),
          _buildCustomTile(
            context,
            "Language",
            Icons.language,
            Icon(Icons.arrow_forward_ios, size: 18),
          ),
          const SizedBox(height: 10),
          _buildCustomTile(
            context,
            "Dark Mode",
            Icons.brightness_6,
            Switch(
              value: false,
              onChanged: (value) {},
              activeColor: kPrimaryColor,
            ),
          ),
          const SizedBox(height: 20),
          _buildSection("Support"),
          _buildCustomTile(
            context,
            "Contact Us",
            Icons.support_agent,
            Icon(Icons.arrow_forward_ios, size: 18),
          ),
          const SizedBox(height: 10),
          _buildCustomTile(
            context,
            "Privacy Policy",
            Icons.privacy_tip,
            Icon(Icons.arrow_forward_ios, size: 18),
          ),
          const SizedBox(height: 30),
          Center(
            child: TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomBottomNavigationBar(
                      currentIndex: 0,
                      onTap: (index) {}, // Dummy callback
                    ),
                  ),
                  (Route<dynamic> route) => false, // Removes all previous routes
                );
              },
              child: Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTile(
      BuildContext context, String title, IconData leadingIcon, Widget trailing) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(leadingIcon, color: kPrimaryColor),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}


class EditProfileScreen extends StatefulWidget {
  static const String routeName = "EditProfileScreen";

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance
            .collection('users_collection')
            .doc(user.uid)
            .get();

        if (doc.exists) {
          setState(() {
            _nameController.text = doc['firstName'] ?? '';
            _usernameController.text = doc['lastName'] ?? '';
          });
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> saveChanges() async {
    try {
      setState(() {
        isLoading = true;
      });
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users_collection')
            .doc(user.uid)
            .update({
          'firstName': _nameController.text.trim(),
          'lastName': _usernameController.text.trim(),
        });

        Navigator.pop(context); // Go back after saving
      }
    } catch (e) {
      print('Error saving changes: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save changes. Try again.')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 4),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Edit Profile",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back, color: kPrimaryColor),
              ),
            ),
            Container(height: 4, color: Colors.grey.shade300),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: kPrimaryColor))
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          width: screenWidth * 0.85,
                          padding: const EdgeInsets.fromLTRB(16, 60, 16, 24),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Edit your name",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Your Name",
                                  hintStyle: const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Edit user name",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "User Name",
                                  hintStyle: const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  color: kPrimaryColor,
                                  size: 45,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: -10,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: kPrimaryColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ElevatedButton(
                        onPressed: saveChanges,
                        style: ElevatedButton.styleFrom(
                          iconColor: kPrimaryColor,
                          minimumSize: Size(screenWidth * 0.85, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Save Changes",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
