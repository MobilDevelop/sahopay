import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/password/password_state.dart';

class PasswordCubit extends Cubit<PasswordState>{
  PasswordCubit():super(PasswordInitial());

  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassPassController = TextEditingController();
}