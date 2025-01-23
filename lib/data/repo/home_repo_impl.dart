import 'package:zartek/core/infra/app_endpoints.dart';
import 'package:zartek/core/infra/app_manager.dart';
import 'package:zartek/core/utils/applogger.dart';
import 'package:zartek/domain/models/catergories_model.dart';
import 'package:zartek/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiBaseHelper apiBaseHelper;
  HomeRepoImpl({required this.apiBaseHelper});
  @override
  Future<List<Categories>> getHomeData() async {
    final values =
        await apiBaseHelper.get(endpoint: AppEndpoints.endpoint, params: {});
    final categories = values['categories'];
    AppLogger.debuglog(categories.toString());
    // return Categories.fromJson(categories);
    return (values['categories'] as List)
        .map((category) => Categories.fromJson(category))
        .toList();
  }
}
