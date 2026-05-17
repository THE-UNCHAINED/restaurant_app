import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FacebookUI());
  }
}

class FacebookUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'facebook',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        children: [
          // Create Post
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.white,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text("What's on your mind?"),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8),

          // Story Section
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  width: 110,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/200/300?random=$index',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 8),

          // Post Card
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=3',
                    ),
                  ),
                  title: Text('John Doe'),
                  subtitle: Text('5h'),
                  trailing: Icon(Icons.more_horiz),
                ),

                Image.network(
                  'https://picsum.photos/500/300',
                  fit: BoxFit.cover,
                ),

                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Enjoying Flutter UI development 🚀'),
                ),

                Divider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up_alt_outlined),
                      label: Text('Like'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.comment_outlined),
                      label: Text('Comment'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.share_outlined),
                      label: Text('Share'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
        ],
      ),
    );
  }
}
