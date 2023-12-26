import 'package:get/get.dart';
import 'package:rss_interactive_v2/controllers/auth_controller.dart';
import 'package:rss_interactive_v2/controllers/model_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(ModelController(), permanent: true);
  }
}
