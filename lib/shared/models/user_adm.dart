import 'package:lumen/shared/models/user_abstract.dart';
import 'package:lumen/shared/models/user_restaurant.dart';

class UserAdm extends AbstractUser{
  late String restName;
  late String restLogoImg;
  late List<int> listRestaurantIds;
  late List<UserRestaurant> listUserRestaurant;
}