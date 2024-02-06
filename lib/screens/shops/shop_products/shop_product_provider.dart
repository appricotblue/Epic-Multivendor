import 'dart:developer';

import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/model/SuccessModel.dart';
import 'package:epic_multivendor/screens/category/model/category_product_model.dart';
import 'package:epic_multivendor/screens/home/model/home_service_list_model.dart';
import 'package:epic_multivendor/screens/home/model/home_shop_list_model.dart';
import 'package:epic_multivendor/screens/shops/shop_products/model/product_subcategory_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../apis/http_request.dart';
import '../../../helper/helper_logger.dart';
import '../../../helper/model/user_model.dart';
import 'model/ShopProductListModel.dart';
import 'new/shop_products_list_model.dart' as shop;

class ShopProductProvider extends ChangeNotifier {
  ShopProductProvider() {
    initializeScrollController();
  }
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  ShopProductListModel? shopProductListModel;
  SuccessModel? successModel;
  CategoryProductModel? categoryProductModel;
  ProductSubCategoryModel? productSubCategoryModel;

  /// Home shops
  ///
  ///
  // Future<ShopProductListModel> shopProductList({userId, shopId}) async {
  //   try {
  //     setLoading(true);
  //     ApiResponse apiResponse = await ApiHelper().postData(data: {
  //       "user_id": "$userId",
  //       "shop_id": "$shopId",
  //     }, route: ApiEndPoints.shopProduct);
  //     if (apiResponse.data != null) {
  //       shopProductListModel = ShopProductListModel.fromJson(apiResponse.data);
  //       int temp = shopProductListModel?.products?.length ?? 0;
  //       for (int i = 0; i < temp; i++) {
  //         int attributeLength =
  //             shopProductListModel?.products?[i].attributes?.length ?? 0;
  //         if (attributeLength != 0) {
  //           shopProductListModel?.products?[i].productPrice =
  //               shopProductListModel?.products?[i].attributes?[0].value
  //                       .toString() ??
  //                   "";
  //         } else {
  //           shopProductListModel?.products?[i].productPrice =
  //               shopProductListModel?.products?[i].price.toString() ?? "";
  //         }
  //       }
  //     }
  //     setLoading(false);
  //   } catch (ex) {
  //     setLoading(false);
  //     showErrorMessage("Something went wrong");
  //   }
  //   return shopProductListModel!;
  // }

  //shop products//api
  shop.ShopProductList? shopProductlist;
  int currentpage = 1;
  int? endpage;
  List<shop.Products> shopproductslist = [];
  var userModel = Get.find<UserModel>();
  Future<void> shopProducts(String page) async {
    if (page == "1") {
      // If it's the first page, clear the existing list
      shopproductslist.clear();
    }
    // log('-------USERID-------$userId/n----------SHOPID--------$shopId');
    try {
      
      page=="1"?setLoading(true):setLoading(false);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": userModel.userId,
        "shop_id": userModel.shopId,
        // "user_id": "28",
        // "shop_id": "14",
        "page": page
      }, route: ApiEndPoints.shopProduct);
      if (apiResponse.data != null) {
        log('SHOPAPI----------${apiResponse.data}');
        shopProductlist = shop.ShopProductList.fromJson(apiResponse.data);
        currentpage = shopProductlist!.pagination!.currentPage!;
        endpage = shopProductlist!.pagination!.lastPage!;
        // int temp = shopProductlist?.products?.length ?? 0;
        // for (int i = 0; i < temp; i++) {
        //   int attributeLength =
        //       shopProductListModel?.products?[i].attributes?.length ?? 0;
        //   if (attributeLength != 0) {
        //     shopProductListModel?.products?[i].productPrice =
        //         shopProductListModel?.products?[i].attributes?[0].value
        //                 .toString() ??
        //             "";
        //   } else {
        //     shopProductListModel?.products?[i].productPrice =
        //         shopProductListModel?.products?[i].price.toString() ?? "";
        //   }
        // }
        if (page == "1") {
          shopproductslist.addAll(shopProductlist?.products ?? []);
        } else {
          // If it's not the first page, update the existing list
          // assuming there's an identifier, for example, orderId
          shopproductslist.removeWhere((existingproduct) =>
              shopProductlist?.products
                  ?.any((newproduct) => newproduct.id == existingproduct.id) ??
              false);
          shopproductslist.addAll(shopProductlist?.products ?? []);
        }
        // notifyListeners();
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    // return shopProductlist!;
  }

  ScrollController scrollController = ScrollController();
  

  void initializeScrollController() {
    scrollController.addListener(() {
      log('initialscroll');
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        log('REACHED END OF LIST');

        Future.microtask(() {
          loadmore();
        });
        
      }
    });
    Future.microtask(() {
      shopProducts("1");
    });
  }

  @override
  void dispose() {
    // Dispose of the scrollController when the provider is disposed
    scrollController.dispose();
    super.dispose();
  }

  void loadmore() async {
    var newpage = currentpage + 1;
    if (newpage <= endpage!) {
      await shopProducts(newpage.toString());
      // if (activeOrderModel?.orders != null) {
      //   orderlist.addAll(activeOrderModel!.orders!);
      // }
      log('--new-page-------------$newpage');
      log('AFTER--LOADING-------------${shopproductslist.length}');
    } else {
      return;
    }
  }

  // addRemoveStock(int index, bool isRemove) {
  //   if (shopProductListModel!.products![index].quantity != 0) {
  //     if (isRemove) {
  //       shopProductListModel!.products![index].quantityCount--;
  //     } else {
  //       if (shopProductListModel!.products![index].quantityCount <=
  //           shopProductListModel!.products![index].quantity!) {
  //         shopProductListModel!.products![index].quantityCount++;
  //       }
  //     }
  //     notifyListeners();
  //   } else {}
  // }
   addRemoveStock(int index, bool isRemove) {
    if (shopproductslist[index].quantity != 0) {
      if (isRemove) {
        shopproductslist[index].quantityCount--;
      } else {
        if (shopproductslist[index].quantityCount <=
           shopproductslist[index].quantity!) {
          shopproductslist[index].quantityCount++;
        }
      }
      notifyListeners();
    } else {}
  }

  Future<CategoryProductModel> categoryProductList(
      {userId, shopId, categoryId, subCategoryId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "category_id": "$categoryId",
        "shop_id": "$shopId",
        "sub_category_id": "$subCategoryId"
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

  Future<ProductSubCategoryModel> getProductSubCategory({categoryId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "category_id": "$categoryId",
      }, route: ApiEndPoints.productSubCategory);
      if (apiResponse.data != null) {
        productSubCategoryModel =
            ProductSubCategoryModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return productSubCategoryModel!;
  }

  Future<SuccessModel> addToWishList(context, {userId, productId}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().addWishList(data: {
        "user_id": "$userId",
        "product_id": "$productId",
      }, route: ApiEndPoints.addToWishList);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
        successModel?.errorMsg == null ||
                successModel?.errorMsg == "" ||
                successModel?.errorMsg == "null"
            ? SnackBarMessage(context, "Added to wish list")
            : SnackBarMessage(context, successModel?.errorMsg);
      }
    } catch (ex) {
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }

  Future<SuccessModel> removeWishList(context, {userId, productId}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().addWishList(data: {
        "user_id": "$userId",
        "product_id": "$productId",
      }, route: ApiEndPoints.removeToWishList);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
        successModel?.errorMsg == null ||
                successModel?.errorMsg == "" ||
                successModel?.errorMsg == "null"
            ? SnackBarMessage(context, "Remove wish list")
            : SnackBarMessage(context, successModel?.errorMsg);
      }
    } catch (ex) {
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }
}
