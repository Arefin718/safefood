<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/','HomeController@Login')->name('login');
Route::post('/','HomeController@LoginPost');
Route::get('/login','HomeController@Login')->name('login');
Route::post('/login','HomeController@LoginPost');
Route::get('/logout','HomeController@Logout')->name('logout');

//Admin Routes start
Route::get('/home','HomeController@AdminHome')->name('home');

Route::get('/admin/create','AdminController@AddAdmin')->name('admin.addAdmin');
Route::post('/admin/create','AdminController@AddAdminPost');
Route::get('/admin/list','AdminController@AdminList')->name('admin.adminList');

Route::get('/addcategory','CategoryController@AddCategory')->name('admin.addCategory');
Route::post('/addcategory','CategoryController@AddCategoryPost');

Route::get('/categorylist','CategoryController@CategoryList')->name('admin.categoryList');

Route::get('/category/edit/{id}','CategoryController@EditCategory')->name('admin.editCategory');
Route::post('/category/edit/{id}','CategoryController@EditCategoryPost');

Route::get('/addCompany','CompanyController@AddCompany')->name('admin.addCompany');
Route::post('/addCompany','CompanyController@AddCompanyPost');
Route::get('/districtlist','AreaController@GetDistrictList')->name('admin.districtList');
Route::get('/thanaupazilalist','AreaController@GetThanaList')->name('admin.thanaList');



Route::get('/companylist','CompanyController@CompanyList')->name('admin.companyList');
Route::get('/companylist/closed','CompanyController@ClosedCompanyList')->name('admin.closedCompanyList');
Route::post('/company/changestatus','CompanyController@CompanyStatusChange')->name('admin.companyStatus');
Route::get('/company/details/{id}','CompanyController@CompanyDetails')->name('admin.companyDetails');
Route::get('/company/edit/{id}','CompanyController@EditCompany')->name('admin.editCompany');
Route::post('/company/edit/{id}','CompanyController@EditCompanyPost');
Route::get('/company/details/{id}','CompanyController@CompanyDetails')->name('admin.companyDetails');

Route::post('/company/addinspection','InspectionController@AddInspectionPost');
Route::get('/inspection/inspectionlist','InspectionController@InspectionList')->name('admin.inspectionList');
Route::get('/inspection/inspectionlist','InspectionController@InspectionList')->name('admin.inspectionList');
Route::get('/inspection/inspectionofthemonth','InspectionController@InspectionsoftheMonth')->name('admin.inspectionoftheMonth');
Route::get('/inspection/inspectionexpired','InspectionController@InspectionExpired')->name('admin.inspectionExpired');



//Admin Routes end
//Admin Profile start
Route::get('/admin/profile/view','ProfileController@AdminProfileView')->name('admin.profileView');
Route::post('/admin/profile/view','ProfileController@AdminProfileViewPost');
Route::get('/admin/passwordchange','ProfileController@AdminPasswordChange')->name('admin.passwordChange');
Route::post('/admin/passwordchange','ProfileController@AdminPasswordChangePost');


//Admin Profile end

//User
Route::get('/user/searchCompany','UserController@SearchCompany')->name('user.searchCompany');
Route::post('/user/searchCompany','UserController@SearchCompanyPost');


//Admin Group
Route::group(['middleware' => 'AdminLoginCheck'], function (){

});