import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../app/app.router.dart';
import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../model/caleg_model.dart';
import '../../../model/my_response.model.dart';

class LoginScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('LoginScreenViewModel');

  // variable
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  Future<void> init() async {
    globalVar.backPressed = 'backNormal';
  }

  login() async {
    easyLoading.customLoading('Login..');
    globalVar.backPressed = 'cantBack';

    try {
      // log.i('username: ${usernameController.text}');
      // log.i('password: ${passwordController.text}');
      var formData = FormData.fromMap({
        'username': usernameController.text,
        'password': passwordController.text,
      });
      // log.i('formData: $formData');
      var response =
          await httpService.postWithFormData('login/caleg', formData);

      // log.i('response: ${response.data}');

      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      var data = myResponseModel.data;
      // log.i('data: $data');
      CalegModel calegModel = CalegModel.fromJson(data);
      // log.i('calegModel: ${calegModel.toJson()}');
      await mySharedPrefs.setString('id', calegModel.idCaleg!.toString());
      await mySharedPrefs.setString('nama', calegModel.namaCaleg!);
      await mySharedPrefs.setString(
          'nomorUrut', calegModel.nomorUrutCaleg!.toString());
      await mySharedPrefs.setString('foto', calegModel.foto!);
      await mySharedPrefs.setString('level', 'caleg');
      await mySharedPrefs.setString('password', passwordController.text);

      snackbarService.showSnackbar(
        message:
            'Selamat datang kembali Calon Legislatif ${calegModel.namaCaleg}',
        title: 'Login Berhasil',
        duration: const Duration(milliseconds: 2500),
      );
      navigationService.navigateToCalegIndexTrackingView();
    } catch (e) {
      log.e('error: $e');
    } finally {
      easyLoading.dismissLoading();
      globalVar.backPressed = 'backNormal';
    }

    // navigationService.pushNamedAndRemoveUntil('/home-screen');
    // await navigationService.navigateToAdminIndexTrackingView();
  }
}
