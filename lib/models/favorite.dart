class FavoriteModel {
  String? favoritesId;
  String? favoritesItemId;
  String? favoritesUserId;
  String? favoritesCreatedAt;

  FavoriteModel(
    {this.favoritesId,
    this.favoritesItemId,
    this.favoritesUserId,
    this.favoritesCreatedAt});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoritesId         = json['favorites_id'];
    favoritesItemId     = json['favorites_item_id'];
    favoritesUserId     = json['favorites_user_id'];
    favoritesCreatedAt  = json['favorites_created_at'];
  }
}
