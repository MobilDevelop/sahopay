import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/registration/registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState>{
  RegistrationCubit():super(RegistrationInitial());
}