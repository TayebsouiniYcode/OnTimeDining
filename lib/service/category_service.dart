import 'package:on_time_dining/dao/category_dao.dart';
import 'package:on_time_dining/model/Category.dart';

class CategoryService {
  CategoryDao categoryDao = CategoryDao();

  void insertCategory() {
    Category category = Category(
        id: 1,
        title: 'cat 1',
        description: 'category description 1',
        image: 'category1.jpg');
    Category category2 = Category(
        id: 2,
        title: 'cat 2',
        description: 'category description 2',
        image: 'category2.jpg');
    Category category3 = Category(
        id: 3,
        title: 'cat 3',
        description: 'category description 3',
        image: 'category3.jpg');
    Category category4 = Category(
        id: 4,
        title: 'cat 4',
        description: 'category description 4',
        image: 'category4.jpg');

    categoryDao.insertRestaurant(category.toMap());
    categoryDao.insertRestaurant(category2.toMap());
    categoryDao.insertRestaurant(category3.toMap());
    categoryDao.insertRestaurant(category4.toMap());
  }
}
