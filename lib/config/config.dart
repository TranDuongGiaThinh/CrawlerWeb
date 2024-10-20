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
const String deleteUserTypeAPI = '$baseURL/api/user-type/delete/';

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

// Lấy thông tin cài đặt
const String getSettingAPI = '$baseURL/api/setting/get';

// Download C# app
const String downloadAppAPI = '$baseURL/api/download-app';

// Cập nhật file C#
const String updateAppFilePathAPI = '$baseURL/api/setting/update-file-app';

// Download file hướng dẫn
const String downloadInstructionAPI = '$baseURL/api/download-instruction';

// lấy danh sách user
const String getAllUserAPI = '$baseURL/api/user/get-all';
const String lockUserAPI = '$baseURL/api/user/lock/';
const String unlockUserAPI = '$baseURL/api/user/unlock/';

// Cập nhật file C#
const String updateInstructionFilePathAPI = '$baseURL/api/setting/update-file-instruction';

// Items
const String getAllItemOfUserAPI = '$baseURL/item/get-all-item-of-user/';
// /item/filter
// /item/export/:user_id
// /item/search/:user_id/:keyword
// /item/get-search-suggestions/:user_id
// /item/check-export-permission/:user_id


// Lấy danh sách cấu hình của user
const String getAllConfigOfUserAPI = '$baseURL/crawl-config/get-all-config-of-user/';

// Lấy danh sách loại item của user
const String getAllItemTypeOfUserAPI = '$baseURL/item-type/get-all-item-type-of-user/';

// Lấy danh sách website của user
const String getAllWebsiteOfUserAPI = '$baseURL/website/get-all-website-of-user/';

// Lọc danh sách item
// mẫu: http://localhost:3001/api/item/filter?user_id=1&type_id=1&website_id=1&config_id=null
const String filterItemApi = '$baseURL/api/item/filter?';

// Xuất file json cho các sản phẩm hiện tại
const String exportFileJsonAPI = '$baseURL/api/item/export-file-json?';