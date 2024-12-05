import 'package:flutter/material.dart';
import 'package:myapp/pages/SplashScreen.dart';

import 'EditProfilePage.dart';
import 'EventSearchPage.dart';
import 'MyEventsPage.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            Text(
              'Hello,',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            // Thank You Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thank you for supporting us!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Thank you for using our app!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildOption(
              context,
              icon: Icons.person,
              label: 'Edit Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            _buildOption(
              context,
              icon: Icons.settings,
              label: 'Event Preferences',
              onTap: () {
                // Navigate to Event Preferences
              },
            ),
            _buildOption(
              context,
              icon: Icons.info,
              label: 'About Us',
              onTap: () {
                // Navigate to About Us
              },
            ),
            _buildOption(
              context,
              icon: Icons.support_agent,
              label: 'Support Center',
              onTap: () {
                // Navigate to Support Center
              },
            ),
            _buildOption(
              context,
              icon: Icons.email,
              label: 'Contact Us',
              onTap: () {
                // Navigate to Contact Us
              },
            ),
            _buildOption(
              context,
              icon: Icons.share,
              label: 'Share the Illini Connect App',
              onTap: () {
                // Implement Share Logic
              },
            ),
            _buildOption(
              context,
              icon: Icons.exit_to_app,
              label: 'Sign Out',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[100], 
            child: Icon(
              icon,
              color: Colors.blue[800],
            ),
          ),
          title: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          onTap: onTap,
        ),
        Divider(
          height: 1,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}