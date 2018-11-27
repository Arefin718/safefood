<?php

namespace App\Http\Controllers;

use App\Companys;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function SearchRestaurant(){
        return view('user.searchRestaurant');
    }

    public function SearchRestaurantPost(Request $request){

        $key_words=$request->input('key_word');
        $restaurants=Companys::SearchRestaurantByKeywords($key_words);

        return $restaurants;
    }
}
