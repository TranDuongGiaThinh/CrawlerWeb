/*
  File này chứa các thông tin cấu hình như IP, API...
*/

// API
const String baseURL = 'http://localhost:3001';

// API endpoints
// Người dùng
const String checkLoginAPI = '$baseURL/user/check-login';
const String checkUsernameExistsAPI = '$baseURL/user/check-username-exists/';
const String createUserAPI = '$baseURL/user/register';

// Gói thành viên
const String getAllUserTypeAPI = '$baseURL/user-type/get-all';
const String checkUserTypeNameExistsAPI = '$baseURL/user-type/check-name-exists?';
const String createUserTypeAPI = '$baseURL/user-type/add';
const String updateUserTypeAPI = '$baseURL/user-type/update';
const String deleteUserTypeAPI = '$baseURL/user-type/delete/';

// Gói gia hạn
const String getAllRenewalPackageAPI = '$baseURL/renewal-package/get-all';
const String checkRenewalPackageNameExixstAPI = '$baseURL/renewal-package/check-name-exists?';
const String createRenewalPackageAPI = '$baseURL/renewal-package/add';
const String updateRenewalPackageAPI = '$baseURL/renewal-package/update';
const String deleteRenewalPackageAPI = '$baseURL/renewal-package/delete/';

// Lịch sử đăng ký gói thành viên
const String creatPackageUserAPI = '$baseURL/package-user/add';
const String getAllPackageUserOfUserAPI = '$baseURL/package-user/get-all-of-user/';
const String getPackageUserIsUsingOfUserAPI = '$baseURL/package-user/get-package-is-using/';

// lấy danh sách user
const String getAllUserAPI = '$baseURL/user/get-all-user';
const String lockUserAPI = '$baseURL/user/lock-user/';
const String unlockUserAPI = '$baseURL/user/unlock-user/';
const String searchUserAPI = '$baseURL/user/search-user/';

// Items
const String getAllItemOfUserAPI = '$baseURL/item/get-all-item-of-user/';
const String checkExportPremissionAPI = '$baseURL/item/check-export-permission/';
const String searchItemAPI = '$baseURL/item/search/';
const String getSearchSuggestionsAPI = '$baseURL/item/get-search-suggestions/';
const String exportFileJsonAPI = '$baseURL/item/export/';
const String filterItemAPI = '$baseURL/item/filter/';

// Lấy danh sách cấu hình của user
const String getAllConfigOfUserAPI = '$baseURL/crawl-config/get-all-config-of-user/';

// Lấy danh sách loại item của user
const String getAllItemTypeOfUserAPI = '$baseURL/item-type/get-all-item-type-of-user/';

// Lấy danh sách website của user
const String getAllWebsiteOfUserAPI = '$baseURL/website/get-all-website-of-user/';

// Các api quản lý setting
const String getIntroductionAPI = '$baseURL/setting/get-introduction';
const String downloadAppAPI = '$baseURL/setting/download-app';
const String downloadInstructionAPI = '$baseURL/setting/download-instruction';
const String updateIntroductionAPI = '$baseURL/setting/update-introduction';
const String uploadAppAPI = '$baseURL/setting/update-app';
const String uploadInstructionAPI = '$baseURL/setting/update-instruction';
