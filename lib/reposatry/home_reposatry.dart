import 'package:ecommerce/Utils/Utils.dart';
import 'package:ecommerce/data/Network/BaseApiservices.dart';
import 'package:ecommerce/data/Network/NetworkApiServices.dart';
import 'package:ecommerce/res/app_Url.dart';

import '../model/ProductsModel.dart';

class HomeRepo {

  final BaseApiServices _HomeRepo = NetworkApiServices();

  Future<ProductsModel> homeApicall()async {

    try{
      dynamic response = await _HomeRepo.getGetApiResponse(AppUrl.productsUrl);

      return response = ProductsModel.fromJson(response) ;
      
    }
        catch(e){
      Utils.toastMassage(e.toString());
      throw e ;
        }

  }

}