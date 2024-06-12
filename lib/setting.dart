import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile Picture'),
            onTap: () {
              // Add functionality to change profile picture
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Name'),
            onTap: () {
              // Add functionality to edit name
            },
          ),
          ListTile(
            leading: Icon(Icons.person_pin),
            title: Text('Personal Details'),
            onTap: () {
              // Add functionality to edit personal details
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Method'),
            onTap: () {
              // Add functionality to manage payment method
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              // Add language settings functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Add notifications settings functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Security'),
            onTap: () {
              // Add security settings functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Theme'),
            onTap: () {
              // Add theme settings functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            onTap: () {
              // Add account settings functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
              // Add log out functionality
            },
          ),
        ],
      ),
    );
  }
}
