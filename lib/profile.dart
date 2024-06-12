import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjAP8tc7I6e451X8FXl8JCICudetoUJ_AdHQ&s'),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'User Name', // Replace with user's name
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Personal Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Email: user@example.com'), // Replace with user's email
            Text('Phone: (123) 456-7890'), // Replace with user's phone number
            SizedBox(height: 32),
            Text(
              'Payment Methods',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Credit Card'),
              subtitle: Text('**** **** **** 1234'), // Replace with user's card details
              trailing: Icon(Icons.edit),
              onTap: () {
                // Add edit payment method functionality here
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Wallet Balance'),
              subtitle: Text('\$1000'), // Replace with user's wallet balance
              trailing: Icon(Icons.edit),
              onTap: () {
                // Add edit wallet functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}


