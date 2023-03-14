import 'package:on_time_dining/dao/dash_dao.dart';
import 'package:on_time_dining/model/Dash.dart';

class DashService {
  DashDao dashDao = DashDao();

  void insertDash() {
    Dash dash = Dash(
        id: 1,
        title: 'Dash 1',
        description: 'this is dash 1',
        price: 30.00,
        image: 'dash1.jpg',
        categoryId: 1,
        restaurantId: 1);
    Dash dash1 = Dash(
        id: 2,
        title: 'Dash 2',
        description: 'this is dash 2',
        price: 10.00,
        image: 'dash2.jpg',
        categoryId: 1,
        restaurantId: 1);
    Dash dash2 = Dash(
        id: 3,
        title: 'Dash 3',
        description: 'this is dash 3',
        price: 35.00,
        image: 'dash3.jpg',
        categoryId: 1,
        restaurantId: 1);
    Dash dash4 = Dash(
        id: 4,
        title: 'Dash 4',
        description: 'this is dash 4',
        price: 12.00,
        image: 'dash4.jpg',
        categoryId: 1,
        restaurantId: 1);
    Dash dash5 = Dash(
        id: 5,
        title: 'Dash 5',
        description: 'this is dash 5',
        price: 21.00,
        image: 'dash5.jpg',
        categoryId: 1,
        restaurantId: 2);
    Dash dash6 = Dash(
        id: 6,
        title: 'Dash 6',
        description: 'this is dash 6',
        price: 10.00,
        image: 'dash6.jpg',
        categoryId: 1,
        restaurantId: 2);

    dashDao.insertRestaurant(dash.toMap());
    dashDao.insertRestaurant(dash1.toMap());
    dashDao.insertRestaurant(dash2.toMap());
    dashDao.insertRestaurant(dash4.toMap());
    dashDao.insertRestaurant(dash5.toMap());
    dashDao.insertRestaurant(dash6.toMap());
  }
}
