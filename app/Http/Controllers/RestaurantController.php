<?php

namespace App\Http\Controllers;
use App\Categorys;
use APP\Restaurant;
use Illuminate\Http\Request;

class RestaurantController extends Controller
{
    public function AddRestaurant(){
        $categorys=Categorys::all();
        return view('restaurant.addRestaurant')->with('categorys',$categorys);
    }

    public function AddRestaurantPost(Request $request){

    }

    public function RestaurantList(){

    }
    public function RestaurantDetailsByID($id){

    }

}
