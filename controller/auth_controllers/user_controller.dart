import 'package:store_app/data/repository/user_repo.dart';
import 'package:store_app/models/response.dart';
import 'package:store_app/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  
  UserController({required this.userRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      _userModel= UserModel.fromJson(response.body);
      _isLoaded = true;
      responseModel= ResponseModel(true, 'Successfully'/* response.body["token"] */);
    }else{
      responseModel= ResponseModel(false, response.statusText!);
    }
    //_isLoaded = false;
    update();
    return responseModel;
  }
}
