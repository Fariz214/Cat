import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    String? displayName = user?.displayName;
    String? email = user?.email;
    String? photoURL = user?.photoURL;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: photoURL != null ? NetworkImage(photoURL) : null,
                      child: photoURL == null ? const Icon(Icons.person) : null,
                    ),
                    TextButton(
                      onPressed: () {
                        // Implement logic to change profile picture
                      },
                      child: Text(
                        'Change Profile Picture',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              Text(
                'Profile Information',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              _buildProfileInfoItem('Name', displayName ?? 'Not available'),
              _buildProfileInfoItem('Email', email ?? 'Not available'),
              const Divider(),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Implement logic to close account
                  },
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfoItem(String title, String value) {
    return ListTile(
      title: Text(title),
      subtitle: Text(value),
      onTap: () {
        // Add logic if you want to edit this information
      },
    );
  }
}
