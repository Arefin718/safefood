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

Route::get('/addadmin','AdminController@AddAdmin')->name('admin.addAdmin');
Route::post('/addadmin','AdminController@AddAdminPost');

Route::get('/addcategory','CategoryController@AddCategory')->name('admin.addCategory');
Route::post('/addcategory','CategoryController@AddCategoryPost');

Route::get('/categorylist','CategoryController@CategoryList')->name('admin.categoryList');

Route::get('/category/edit/{id}','CategoryController@EditCategory')->name('admin.editCategory');
Route::post('/category/edit/{id}','CategoryController@EditCategoryPost');

Route::get('/addrestaurant','RestaurantController@AddRestaurant')->name('admin.addRestaurant');
Route::post('/addrestaurant','RestaurantController@AddRestaurantPost');
Route::get('/restaurantlist','RestaurantController@RestaurantList')->name('admin.restaurantList');
Route::get('/restaurantlist/closed','RestaurantController@ClosedRestaurantList')->name('admin.closedRestaurantList');
Route::post('/restaurant/changestatus','RestaurantController@RestaurantStatusChange')->name('admin.restaurantStatus');
Route::get('/restaurant/details/{id}','RestaurantController@RestaurantDetails')->name('admin.restaurantDetails');
Route::get('/restaurant/edit/{id}','RestaurantController@EditRestaurant')->name('admin.editRestaurant');
Route::post('/restaurant/edit/{id}','RestaurantController@EditRestaurantPost');
Route::get('/restaurant/details/{id}','RestaurantController@RestaurantDetails')->name('admin.restaurantDetails');

Route::post('/restaurant/addinspection','InspectionController@AddInspectionPost');
Route::get('/inspection/inspectionlist','InspectionController@InspectionList')->name('admin.inspectionList');
Route::get('/inspection/inspectionlist','InspectionController@InspectionList')->name('admin.inspectionList');
Route::get('/inspection/inspectionofthemonth','InspectionController@InspectionsoftheMonth')->name('admin.inspectionoftheMonth');
Route::get('/inspection/inspectionexpired','InspectionController@InspectionExpired')->name('admin.inspectionExpired');



//Admin Routes end


//User
Route::get('/user/searchrestaurant','UserController@SearchRestaurant')->name('user.searchRestaurant');
Route::post('/user/searchrestaurant','UserController@SearchRestaurantPost');


//Admin Group
Route::group(['middleware' => 'AdminLoginCheck'], function (){

});