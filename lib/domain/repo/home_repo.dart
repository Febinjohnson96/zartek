import 'package:zartek/domain/models/catergories_model.dart';

abstract class HomeRepo {
  Future<List<Categories>> getHomeData();
}
