import 'package:get/get.dart';

import '../controllers/ld_search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LdSearchController>(
      () => LdSearchController(),
    );
  }
}
