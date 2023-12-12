import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(ProfileInitial());

  final emailController = TextEditingController();
  final firtnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final referalController = TextEditingController();
}