import 'package:get/get.dart';

class Nav {
  const Nav._();

  static void pop<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) =>
      Get.back(
        result: result,
        closeOverlays: closeOverlays,
        canPop: canPop,
        id: id,
      );

  static Future? pushNamed(
    String routeName, {
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(routeName, parameters: parameters, arguments: arguments);
  }

  static Future? popAndPushNamed(
    String routeName, {
    dynamic arguments,
    Map<String, String>? parameters,
  }) =>
      Get.offNamed(routeName, parameters: parameters, arguments: arguments);

  static Future? pushAndRemoveUntilNamed(
    String routeName, {
    dynamic arguments,
    Map<String, String>? parameters,
  }) =>
      Get.offAllNamed(routeName, parameters: parameters, arguments: arguments);
}
