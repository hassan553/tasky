import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ttt/features/auth/data/repo/Register_repo.dart';
import 'package:ttt/features/auth/data/repo/profile_repo.dart';

import '../../../../components/custom_toast.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterRepo registerRepo;
  ProfileRepo profileRepo;
  RegisterCubit({required this.registerRepo, required this.profileRepo})
      : super(RegisterInitial());

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var displayNameController = TextEditingController();
  var experienceYearsController = TextEditingController();
  var addressController = TextEditingController();
  var levelController = TextEditingController();
  void register() async {
    emit(RegisterSuccess());
    var result = await registerRepo.register(
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
      displayName: displayNameController.text.trim(),
      experienceYears: experienceYearsController.text.trim(),
      address: addressController.text.trim(),
      level: levelController.text.trim(),
    );
    result.fold((error) {
      showToast(msg: error, isError: true);
      emit(RegisterError());
    }, (_) {
      _getUserProfile();
      emit(RegisterSuccess());
    });
  }

  Future _getUserProfile() async {
    var result = await profileRepo.getUserProfile();
    result.fold((error) {
      emit(GetUserProfileError());
    }, (_) {
      showToast(msg: 'Register successfully');
      emit(GetUserProfileSuccess());
    });
  }

  void disposeController() {
    phoneController.dispose();
    passwordController.dispose();
    displayNameController.dispose();
    experienceYearsController.dispose();
    addressController.dispose();
    levelController.dispose();
  }
}
