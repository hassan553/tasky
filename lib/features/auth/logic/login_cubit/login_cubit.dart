import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ttt/features/auth/data/repo/login_repo.dart';
import 'package:ttt/features/auth/data/repo/profile_repo.dart';

import '../../../../components/custom_toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginRepo loginRepo;
  ProfileRepo profileRepo;
  LoginCubit({required this.loginRepo, required this.profileRepo})
      : super(LoginInitial());

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  void login() async {
    emit(LoginSuccess());
    var result = await loginRepo.login(
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );
    result.fold((error) {
      showToast(msg: error, isError: true);
      emit(LoginError());
    }, (_) async {
      showToast(msg: 'login successfully');
      await _getUserProfile();
      emit(LoginSuccess());
    });
  }

  Future _getUserProfile() async {
    var result = await profileRepo.getUserProfile();
    result.fold((error) {
      emit(GetUserProfileError());
    }, (_) {
      emit(GetUserProfileSuccess());
    });
  }

  void disposeController() {
    phoneController.dispose();
    passwordController.dispose();
  }
}
