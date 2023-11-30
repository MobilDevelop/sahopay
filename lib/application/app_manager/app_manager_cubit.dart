import 'package:bloc/bloc.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';
part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit() : super(AppManagerLoading());   
  
  dynamic subscription;

  Future<void> init() async {

    
    try {
      await AppTheme.init();
      await ScreenSize.setSizes();
      emit(AppManagerInitial());
    } catch (e) {
      emit(AppManagerError(e.toString()));
    }
  }


}
