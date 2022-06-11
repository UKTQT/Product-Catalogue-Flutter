import '../../init/cache/cache.dart';
import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  NavigationService navigationServicePoint = NavigationService.instance;
  Cache cache = Cache.instance;
}
