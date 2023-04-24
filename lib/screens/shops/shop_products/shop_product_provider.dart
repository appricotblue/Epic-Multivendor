import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/model/SuccessModel.dart';
import 'package:epic_multivendor/screens/category/model/category_product_model.dart';
import 'package:epic_multivendor/screens/home/model/home_service_list_model.dart';
import 'package:epic_multivendor/screens/home/model/home_shop_list_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../apis/http_request.dart';
import '../../../helper/helper_logger.dart';
import 'model/ShopProductListModel.dart';

class ShopProductProvider extends ChangeNotifier {
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  ShopProductListModel? shopProductListModel;
  SuccessModel? successModel;
  CategoryProductModel? categoryProductModel;

  /// Home shops
  ///
  ///
  Future<ShopProductListModel> shopProductList({userId, shopId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "shop_id": "$shopId",
      }, route: ApiEndPoints.shopProduct);
      if (apiResponse.data != null) {
        shopProductListModel = ShopProductListModel.fromJson(apiResponse.data);
        int temp = shopProductListModel?.products?.length ?? 0;
        for (int i = 0; i < temp; i++) {
          int attributeLength =
              shopProductListModel?.products?[i].attributes?.length ?? 0;
          if (attributeLength != 0) {
            shopProductListModel?.products?[i].productPrice =
                shopProductListModel?.products?[i].attributes?[0].value
                        .toString() ??
                    "";
          } else {
            shopProductListModel?.products?[i].productPrice =
                shopProductListModel?.products?[i].price.toString() ?? "";
          }
        }
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return shopProductListModel!;
  }

  addRemoveStock(int index, bool isRemove) {
    if (shopProductListModel!.products![index].quantity != 0) {
      if(isRemove){
        shopProductListModel!.products![index].quantityCount--;
      }else{
        if(shopProductListModel!.products![index].quantityCount<=shopProductListModel!.products![index].quantity!){
          shopProductListModel!.products![index].quantityCount++;
        }
      }
      notifyListeners();
    } else {}
  }

  Future<CategoryProductModel> categoryProductList({userId, categoryId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "category_id": "$categoryId",
      }, route: ApiEndPoints.categoryProduct);
      if (apiResponse.data != null) {
        categoryProductModel = CategoryProductModel.fromJson(apiResponse.data);
        int temp = categoryProductModel?.products?.length ?? 0;
        for (int i = 0; i < temp; i++) {
          int attributeLength =
              categoryProductModel?.products?[i].attributes?.length ?? 0;
          if (attributeLength != 0) {
            categoryProductModel?.products?[i].productPrice =
                categoryProductModel?.products?[i].attributes?[0].value
                        .toString() ??
                    "";
          } else {
            categoryProductModel?.products?[i].productPrice =
                categoryProductModel?.products?[i].price.toString() ?? "";
          }
        }
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return categoryProductModel!;
  }

}
