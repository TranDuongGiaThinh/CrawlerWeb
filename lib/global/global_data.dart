import 'package:crawler_web/models/renewal_package.dart';
import 'package:crawler_web/models/user_model.dart';
import 'package:crawler_web/models/user_type_model.dart';
import 'package:crawler_web/presenters/package_user_presenter.dart';
import 'package:crawler_web/presenters/renewal_package_presenter.dart';
import 'package:crawler_web/presenters/user_presenter.dart';
import 'package:crawler_web/presenters/user_type_presenter.dart';

import '../models/package_user_model.dart';

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

// Các presenter
UserPresenter userPresenter = UserPresenter();
UserTypePresenter userTypePresenter = UserTypePresenter();
PackageUserPresenter packageUserPresenter = PackageUserPresenter();
RenewalPackagePresenter renewalPackagePresenter = RenewalPackagePresenter();
