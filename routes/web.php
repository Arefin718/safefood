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

Route::get('/home','HomeController@AdminHome')->name('home');

Route::get('/addadmin','AdminController@AddAdmin')->name('admin.addAdmin');
Route::post('/addadmin','AdminController@AddAdminPost');

Route::get('/addcategory','CategoryController@AddCategory')->name('admin.addCategory');
Route::post('/addcategory','CategoryController@AddCategoryPost');

Route::get('/categorylist','CategoryController@CategoryList')->name('admin.categoryList');

Route::get('/category/edit/{id}','CategoryController@EditCategory')->name('admin.editCategory');
Route::post('/category/edit/{id}','CategoryController@EditCategoryPost');

//Admin Group
Route::group(['middleware' => 'AdminLoginCheck'], function (){

});