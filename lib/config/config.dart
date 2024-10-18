/*
  File này chứa các thông tin cấu hình như IP, API...
*/

// API
const String baseURL = 'http://localhost:3001';

// API endpoints
const String checkLoginAPI = '$baseURL/user/check-login';
const String checkUsernameExistsAPI = '$baseURL/user/check-username-exists/';
const String createUserAPI = '$baseURL/user/register';

const String getUserTypeAPI = '$baseURL/api/user-type/get/';//
const String getUserTypeDefaultAPI = '$baseURL/api/user-type/get-default';
const String getAllUserTypeAPI = '$baseURL/api/user-type/get-all';
const String createUserTypeAPI = '$baseURL/api/user-type/create';
const String updateUserTypeAPI = '$baseURL/api/user-type/update';
const String deleteUserTypeAPI = '$baseURL/api/user-type/delete/';

const String getPackageTypeAPI = '$baseURL/api/package-type/get/';
const String getAllPackageTypeAPI = '$baseURL/api/package-type/get-all';
const String createPackageTypeAPI = '$baseURL/api/package-type/create';
const String updatePackageTypeAPI = '$baseURL/api/package-type/update';
const String deletePackageTypeAPI = '$baseURL/api/package-type/delete/';

const String creatPackageUserAPI = '$baseURL/api/package-user/create';
const String getAllUserPackageUserOfUser = '$baseURL/api/package-user/get-all-by-user-id/';

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
const String getAllItemOfUserAPI = '$baseURL/api/item/get-all-of-user/';

// Lấy danh sách cấu hình của user
const String getAllConfigOfUserAPI = '$baseURL/api/crawl-config/get-all-by-user-id/';

// Lấy danh sách loại item của user
const String getAllItemTypeOfUserAPI = '$baseURL/api/type/get-all-item-type-of-user/';

// Lấy danh sách website của user
const String getAllWebsiteOfUserAPI = '$baseURL/api/type/get-all-website-of-user/';

// Lọc danh sách item
// mẫu: http://localhost:3001/api/item/filter?user_id=1&type_id=1&website_id=1&config_id=null
const String filterItemApi = '$baseURL/api/item/filter?';

// Xuất file json cho các sản phẩm hiện tại
const String exportFileJsonAPI = '$baseURL/api/item/export-file-json?';