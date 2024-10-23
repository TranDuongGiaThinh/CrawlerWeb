import 'package:crawler_web/models/item_model.dart';
import 'package:crawler_web/models/item_type_model.dart';
import 'package:crawler_web/models/renewal_package.dart';
import 'package:crawler_web/models/user_model.dart';
import 'package:crawler_web/models/user_type_model.dart';
import 'package:crawler_web/models/website_model.dart';
import 'package:crawler_web/presenters/item_presenter.dart';
import 'package:crawler_web/presenters/package_user_presenter.dart';
import 'package:crawler_web/presenters/renewal_package_presenter.dart';
import 'package:crawler_web/presenters/user_presenter.dart';
import 'package:crawler_web/presenters/user_type_presenter.dart';

import '../models/check_box_item.dart';
import '../models/package_user_model.dart';

// Trạng thái loading của trang web
bool isLoading = false;

// Thông tin user đăng nhập vào trang web
UserModel? userLogin;

// Danh sách gói thành viên
List<UserTypeModel> userTypes = [];

// Gói thành viên người dùng đang dùng
PackageUserModel? packageUserIsUsing;

// Danh sách gói thành viên người dùng đã đăng ký
List<PackageUserModel> packageUsers = [];

// Danh sách gói gia hạn
List<RenewalPackageModel> renewalPackages = [];

// Danh sách kết quả thu thập
List<ItemModel> items = [];

// Danh sách loại item
List<ItemTypeModel> itemTypes = [];

// Danh sách website
List<WebsiteModel> websites = [];

// Dữ liệu checkbox lọc kết quả thu thập
List<CheckBoxItem> configItems = [
  CheckBoxItem(id: null, name: "Chọn cấu hình")
];
List<CheckBoxItem> itemTypeItems = [
  CheckBoxItem(id: null, name: "Chọn chủ đề")
];
List<CheckBoxItem> websiteItems = [
  CheckBoxItem(id: null, name: "Chọn website")
];

// Các presenter
UserPresenter userPresenter = UserPresenter();
UserTypePresenter userTypePresenter = UserTypePresenter();
PackageUserPresenter packageUserPresenter = PackageUserPresenter();
RenewalPackagePresenter renewalPackagePresenter = RenewalPackagePresenter();
ItemPresenter itemPresenter = ItemPresenter();

// Hàm reset các biến toàn cục
cleanDataOfUser() {
  isLoading = false;
  userLogin = null;
  userTypes = [];
  packageUserIsUsing = null;
  packageUsers = [];
  renewalPackages = [];
  items = [];
  itemTypes = [];
  websites = [];
  configItems = [CheckBoxItem(id: null, name: "Chọn cấu hình")];
  itemTypeItems = [CheckBoxItem(id: null, name: "Chọn chủ đề")];
  websiteItems = [CheckBoxItem(id: null, name: "Chọn website")];
  userPresenter = UserPresenter();
  userTypePresenter = UserTypePresenter();
  packageUserPresenter = PackageUserPresenter();
  renewalPackagePresenter = RenewalPackagePresenter();
  itemPresenter = ItemPresenter();
}
