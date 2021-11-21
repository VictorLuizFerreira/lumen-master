import 'package:lumen/shared/models/cardapio_block.dart';
import 'package:lumen/shared/models/user_abstract.dart';

class UserClient extends AbstractUser{
  late String uniqueCodeClient;
  late List<CardapioBlock> listCardapioBlock;
}