<?php

namespace App\Http\Controllers;

use App\Restaurants;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function SearchRestaurant(){
        return view('user.searchRestaurant');
    }

    public function SearchRestaurantPost(Request $request){

        $key_words=$request->input('key_word');
        $restaurants=Restaurants::SearchRestaurantByKeywords($key_words);

        return $restaurants;
    }
}
