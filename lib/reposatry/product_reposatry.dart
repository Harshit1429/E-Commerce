import 'package:ecommerce/data/Network/BaseApiservices.dart';
import 'package:ecommerce/data/Network/NetworkApiServices.dart';
import 'package:ecommerce/model/ProductsModel.dart';
import '../Utils/Utils.dart';
import '../res/index.dart';

class ProductRepo {

  final BaseApiServices _productDetail = NetworkApiServices();

  Future<dynamic> getProductDetail() async {

    try{

      dynamic response = await _productDetail.getGetApiResponse('https://dummyjson.com/products?skip=${(Index.productIndex)}&limit=${(1)}');

      return response = ProductsModel.fromJson(response);


    }
    catch(e){
      Utils.toastMassage(e.toString());
      throw e ;
    }

  }
}