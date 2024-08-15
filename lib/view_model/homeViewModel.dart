import 'package:ecommerce/reposatry/home_reposatry.dart';
import 'package:flutter/cupertino.dart';

import '../data/Response/api_response.dart';
import '../model/ProductsModel.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepo();

  final bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    setLoading(value);
    notifyListeners();
  }

  ApiResponses<ProductsModel> mylist = ApiResponses.loading();

  setResponse(ApiResponses<ProductsModel> responses) {
    mylist = responses;
    notifyListeners();
  }

  Future<dynamic> homeApi() async {
    setResponse(ApiResponses.loading());
    _homeRepo.homeApicall().then(
      (value) {
        setResponse(ApiResponses.complete(value));
      },
    ).onError(
      (error, stackTrace) {
        setResponse(ApiResponses.error(error.toString()));
      },
    );
  }
}
