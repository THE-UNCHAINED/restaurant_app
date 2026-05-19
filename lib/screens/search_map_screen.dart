import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_model.dart';
import 'package:restaurant_app/screens/restaurant_detail_screen.dart';

class SearchMapScreen extends StatefulWidget {
  const SearchMapScreen({super.key});

  @override
  State<SearchMapScreen> createState() => _SearchMapScreenState();
}

class _SearchMapScreenState extends State<SearchMapScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _showClearButton = false;

  Future<List<RestaurantModel>>? _restaurantsFuture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200], // Background color of the search bar
              borderRadius: BorderRadius.circular(30.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: _controller,

              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Search Restaurants',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: _showClearButton
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _controller.clear();
                        },
                      )
                    : null,
                border: InputBorder.none, // Removes the default underline
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _restaurantsFuture,
              builder: (context, snapshot) {
                if (_restaurantsFuture == null) {
                  return Center(child: Text('Search for restaurants above'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Data has some error"));
                }
                if (snapshot.hasData) {
                  final searchData = snapshot.data;
                  return ListView.builder(
                    itemCount: snapshot.data!.length,

                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(searchData![index].name),
                        leading: Text(searchData[index].address),
                        trailing: Text(searchData[index].rating.toString()),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestaurantDetailScreen(
                              restaurants: searchData[index],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
