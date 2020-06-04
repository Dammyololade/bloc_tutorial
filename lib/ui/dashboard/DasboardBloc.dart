import 'package:code_brew/code_brew.dart';
import 'package:flutterbloctutorial/ui/dashboard/models/ServiceCategoryModel.dart';
import 'package:rxdart/rxdart.dart';

/// description:
/// project: bloc_tutorial
/// @package: 
/// @author: dammyololade
/// created on: 04/06/2020
class DashboardBloc {

  BehaviorSubject<ApiCallStates> blocSubject = BehaviorSubject.seeded(
      ApiCallStates.IDLE);
  NetworkUtil _networkUtil = NetworkUtil();
  ServiceCategoryResponse model;

  DashboardBloc() {
    CodeBrewNetworkConfig.baseUrl = "http://159.65.57.139:80/api";
  }

  void getServices() async{
    blocSubject.add(ApiCallStates.LOADING);
    try {
      var response = await _networkUtil.connectApi("/service/categories?activated=1",
          RequestMethod.get);
      model = ServiceCategoryResponse.fromJson(response.data);
      blocSubject.add(ApiCallStates.SUCCESS);
    } on ApiError catch(error) {
      blocSubject.addError(error);
      blocSubject.add(ApiCallStates.ERROR);
    }
  }

  dispose() {
    blocSubject.close();
  }
}