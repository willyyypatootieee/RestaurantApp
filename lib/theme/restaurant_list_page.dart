import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/restaurant_provider.dart';
import '../widgets/loading_animation.dart';
import '../widgets/restaurant_card.dart';
import 'restaurant_detail_page.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<RestaurantProvider>(
      context,
      listen: false,
    ).fetchAllRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Restoran')),
      body: Consumer<RestaurantProvider>(
        builder: (context, provider, _) {
          switch (provider.state) {
            case ResultState.loading:
              return const LoadingAnimation();
            case ResultState.success:
              return ListView.builder(
                itemCount: provider.restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = provider.restaurants[index];
                  return RestaurantCard(
                    restaurant: restaurant,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => RestaurantDetailPage(id: restaurant.id),
                        ),
                      );
                    },
                  );
                },
              );
            case ResultState.error:
            default:
              return Center(child: Text(provider.message));
          }
        },
      ),
    );
  }
}
