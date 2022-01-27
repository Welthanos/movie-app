import 'package:get/get.dart';
import 'package:movie_app/application/ui/loader/loader_mixin.dart';
import 'package:movie_app/application/ui/messages/messages_mixin.dart';
import 'package:movie_app/services/login/login_service.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(
        MessageModel.info(title: 'Sucesso', message: 'Login realizado com sucesso'));
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Login Error', message: 'Erro ao realizar login'));
    }
  }
}
