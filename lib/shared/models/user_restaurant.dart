import 'package:lumen/shared/models/user_abstract.dart';
import 'package:lumen/shared/models/user_client.dart';

class UserRestaurant extends AbstractUser{
  //Lista de ids dos clientes(API)
  late List<int> listclientIds;

  // Lista dos clientes
  late List<UserClient> listClients;
}