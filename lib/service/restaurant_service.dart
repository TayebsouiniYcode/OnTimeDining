import 'package:on_time_dining/dao/restaurant_dao.dart';
import 'package:on_time_dining/model/Restaurant.dart';

class RestaurantService {
  RestaurantDao restaurantDao = RestaurantDao();

  void insertRestaurant() {
    Restaurant restaurant = Restaurant(
      id: 1,
      name: "YouFood",
      city: "Youssoufia",
      country: "Morocco",
      zipCode: "46300",
      phone: "0524645137",
      image: "1.jpg",
    );
    Restaurant restaurant1 = Restaurant(
      id: 2,
      name: "07 Food",
      city: "Safi",
      country: "Morocco",
      zipCode: "46300",
      phone: "0524645137",
      image: "2.jpg",
    );
    Restaurant restaurant2 = Restaurant(
      id: 3,
      name: "Food ma",
      city: "Rabat",
      country: "Morocco",
      zipCode: "20000",
      phone: "0524645137",
      image: "3.jpg",
    );
    restaurantDao.insertRestaurant(restaurant.toMap());
    restaurantDao.insertRestaurant(restaurant1.toMap());
    restaurantDao.insertRestaurant(restaurant2.toMap());
  }

  Future<List<Map<String, dynamic>>> getAllRestaurants() async {
    List<Map<String, dynamic>> list = await restaurantDao.getAllRestaurants();
    print("...... service ");
    print(list);
    return list;
  }
}
