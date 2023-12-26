import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';

abstract class DashboardState{}

class DashboardInitial extends DashboardState{}

class DashboardNextTransfer extends DashboardState{
  DashboardModel model;
  DashboardNextTransfer(this.model);
}

class DashboardNextWithDraw extends DashboardState{
  DashboardModel model;
  DashboardNextWithDraw(this.model);
}

class DashboardNextDeposit extends DashboardState{
  DashboardModel model;
  DashboardNextDeposit(this.model);
}