import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sahopay/application/profile/profile_state.dart';
import 'package:sahopay/domain/provider/profile.dart';
import 'package:sahopay/infrastructure/models/profile/profile.dart';
import 'package:sahopay/infrastructure/models/profile/set_profile.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(ProfileInitial()){
     init();
  }

  final emailController = TextEditingController();
  final firtnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final referalController = TextEditingController();

  bool check = false;

  ProfileModel? profileInfo;

  void init() async {
    profileInfo =  await  ProfileService().getProfile(); 
    emailController.text = profileInfo!.email;
    firtnameController.text = profileInfo!.firstName;
    lastnameController.text = profileInfo!.lastName;
    referalController.text = profileInfo!.clientId;
    emit(ProfileInitial());
  }

  void setProfile() async {
     
     String firstName = firtnameController.text.trim();
     String lastName = lastnameController.text.trim();

    ServerMessage resopons = await ProfileService().setProfile(UpdateProfile(firstName: firstName, lastName: lastName).toJson());
    EasyLoading.showSuccess(resopons.message);
    
  }

  void clear(){
    firtnameController.clear();
    lastnameController.clear();
    emit(ProfileInitial());
  }
  

}