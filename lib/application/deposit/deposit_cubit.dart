import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/deposit/deposit_state.dart';
import 'package:sahopay/infrastructure/models/deposit/wallet_items.dart';

class DepositCubit extends Cubit<DepositState>{
  DepositCubit():super(DepositInitial());

  List<WalletItem> walletItems = [];
  WalletItem? selectedWalletItem;
}