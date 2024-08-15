import 'package:ecommerce/data/Response/api_response.dart';
import 'package:ecommerce/model/ProductsModel.dart';
import 'package:flutter/foundation.dart';

import '../reposatry/product_reposatry.dart';

class ProductDetailViewModel with ChangeNotifier{

  final _product = ProductRepo();

ApiResponses<ProductsModel> myres = ApiResponses.loading();

setResponse(ApiResponses<ProductsModel> responses){
  myres = responses ;
  notifyListeners();
}


  Future<dynamic> getDetails() async {
  setResponse(ApiResponses.loading());

    _product.getProductDetail().then((value) {
      setResponse(ApiResponses.complete(value));

    },).onError((error, stackTrace) {
      setResponse(ApiResponses.error(error.toString()));

    },);

  }

}