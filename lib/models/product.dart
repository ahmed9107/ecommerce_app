/* class Product {
  String? itemsId;
  String? itemsName;
  String? itemsDescription;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsAddDate;
  String? itemsImage;
  String? itemsRating;
  String? itemsCatId;

  Product(
      {this.itemsId,
      this.itemsName,
      this.itemsDescription,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsAddDate,
      this.itemsImage,
      this.itemsRating,
      this.itemsCatId});

  Product.fromJson(Map<String, dynamic> json) {
    itemsId           = json['items_id'];
    itemsName         = json['items_name'];
    itemsDescription  = json['items_description'];
    itemsPrice        = json['items_price'];
    itemsDiscount     = json['items_discount'];
    itemsAddDate      = json['items_add_date'];
    itemsImage        = json['items_image'];
    itemsRating       = json['items_rating'];
    itemsCatId        = json['items_cat_id'];
  }

  Map<String, dynamic> toJson(Product? product) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id']          = itemsId;
    data['items_name']        = itemsName;
    data['items_description'] = itemsDescription;
    data['items_price']       = itemsPrice;
    data['items_discount']    = itemsDiscount;
    data['items_add_date']    = itemsAddDate;
    data['items_image']       = itemsImage;
    data['items_rating']      = itemsRating;
    data['items_cat_id']      = itemsCatId;
    return data;
  }
} */

class Product {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsNameFr;
  String? itemsDescription;
  String? itemsDescriptionAr;
  String? itemsDescriptionFr;
  String? itemsPrice;
  String? itemsCount;
  String? itemsActive;
  String? itemsDiscount;
  String? itemsAddDate;
  String? itemsRating;
  String? itemsCatId;
  List<ItemsImages>? itemsImages;

  Product(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsNameFr,
      this.itemsDescription,
      this.itemsDescriptionAr,
      this.itemsDescriptionFr,
      this.itemsPrice,
      this.itemsCount,
      this.itemsActive,
      this.itemsDiscount,
      this.itemsAddDate,
      this.itemsRating,
      this.itemsCatId,
      this.itemsImages});

  Product.fromJson(Map<String, dynamic> json) {
    itemsId             = json['items_id'];
    itemsName           = json['items_name'];
    itemsNameAr         = json['items_name_ar'];
    itemsNameFr         = json['items_name_fr'];
    itemsDescription    = json['items_description'];
    itemsDescriptionAr  = json['items_description_ar'];
    itemsDescriptionFr  = json['items_description_fr'];
    itemsPrice          = json['items_price'];
    itemsCount          = json['items_count'];
    itemsActive         = json['items_active'];
    itemsDiscount       = json['items_discount'];
    itemsAddDate        = json['items_add_date'];
    itemsRating         = json['items_rating'];
    itemsCatId          = json['items_cat_id'];
    if (json['items_images'] != null) {
      itemsImages = <ItemsImages>[];
      json['items_images'].forEach((v) {
        itemsImages!.add(ItemsImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['items_id']              = itemsId;
    data['items_name']            = itemsName;
    data['items_name_ar']         = itemsNameAr;
    data['items_name_fr']         = itemsNameFr;
    data['items_description']     = itemsDescription;
    data['items_description_ar']  = itemsDescriptionAr;
    data['items_description_fr']  = itemsDescriptionFr;
    data['items_price']           = itemsPrice;
    data['items_count']           = itemsCount;
    data['items_active']          = itemsActive;
    data['items_discount']        = itemsDiscount;
    data['items_add_date']        = itemsAddDate;
    data['items_rating']          = itemsRating;
    data['items_cat_id']          = itemsCatId;
    if (itemsImages != null) {
      data['items_images'] = itemsImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemsImages {
  String? imagesId;
  String? imagesItemId;
  String? imagesIsPrincipal;
  String? image;

  ItemsImages(
      {this.imagesId, this.imagesItemId, this.imagesIsPrincipal, this.image});

  ItemsImages.fromJson(Map<String, dynamic> json) {
    imagesId          = json['images_id'];
    imagesItemId      = json['images_item_id'];
    imagesIsPrincipal = json['images_is_principal'];
    image             = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['images_id']           = imagesId;
    data['images_item_id']      = imagesItemId;
    data['images_is_principal'] = imagesIsPrincipal;
    data['image']               = image;
    return data;
  }
}