import 'package:flutter/material.dart';

import 'CreateEventPage.dart';
import 'EventDetailsPage.dart';
import 'MyEventsPage.dart';
import 'ProfilePage.dart';

class EventSearchPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/profile_pic.png'), 
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(
              'Hey John',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subtitle
            Text(
              'Stay up to date with the latest events below.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            // Search Bar
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search all events...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChip(
                    label: const Text('For You'),
                    selected: true,
                    onSelected: (bool value) {},
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Basketball'),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Concerts'),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Pickleball'),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Section Title
            const Text(
              'Posted Today',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            // Event List
            Expanded(
              child: ListView(
                children: [
                  EventCard(
                    title: '2 on 2 Basketball @ the Arc',
                    author: 'Jackson Hewitt',
                    time: '1h',
                    onViewNow: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EventDetailsPage()),
                      );
                    },
                  ),
                  EventCard(
                    title: 'Chicago concert on 10/17',
                    author: 'Anna Brown',
                    time: '12h',
                    onViewNow: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EventDetailsPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Create Event Page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateEventPage()),
          );
        },
        backgroundColor: Colors.blue[900],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String author;
  final String time;
  final VoidCallback onViewNow;

  const EventCard({
    Key? key,
    required this.title,
    required this.author,
    required this.time,
    required this.onViewNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(
          'images/event_icon.png', 
          width: 50,
          height: 50,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '$author • $time',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        trailing: TextButton(
          onPressed: onViewNow,
          child: Text(
            'View Now',
            style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}