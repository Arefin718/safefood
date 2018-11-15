<?php

namespace App\Http\Controllers;
use App\Categorys;
use App\Restaurants;
use Illuminate\Http\Request;

class RestaurantController extends Controller
{
    public function AddRestaurant(){
        $categorys=Categorys::all();
        return view('restaurant.addRestaurant')->with('categorys',$categorys);
    }

    public function AddRestaurantPost(Request $request){
        $title_english=$request->input('title_english');
        $title_bangla=$request->input('title_bangla');
        $location_english=$request->input('location_english');
        $location_bangla=$request->input('location_bangla');
        $division=$request->input('division');
        $city=$request->input('city');
        $thana_upazila=$request->input('thana_upazila');
        $zip_code=$request->input('zip_code');
        $owner_name=$request->input('owner_name');
        $owner_contact_number=$request->input('owner_contact_number');
        $category=$request->input('category');

        $date_time=date('ymdhis');

        if($division=="Dhaka"){
            $restaurant_id="DHK".$zip_code.$date_time;
        }elseif ($division=="Barisal"){
            $restaurant_id="BAR".$zip_code.$date_time;
        }elseif ($division=="Chittagong"){
            $restaurant_id="CHT".$zip_code.$date_time;
        }elseif ($division=="Khulna"){
            $restaurant_id="KHU".$zip_code.$date_time;
        }elseif ($division=="Mymensingh"){
            $restaurant_id="MYM".$zip_code.$date_time;
        }elseif ($division=="Rajshahi"){
            $restaurant_id="RAJ".$zip_code.$date_time;
        }elseif ($division=="Rangpur"){
            $restaurant_id="RNG".$zip_code.$date_time;
        }elseif ($division=="Sylhet"){
            $restaurant_id="SYL".$zip_code.$date_time;
        }

       // return $restaurant_id;

        $restaurant=new Restaurants();
        $restaurant->restaurant_id  =   $restaurant_id;
        $restaurant->title_english  =   $title_english;
        $restaurant->title_bangla  =   $title_bangla;
        $restaurant->location_english  =   $location_english;
        $restaurant->location_bangla  =   $location_bangla;
        $restaurant->division_english  =   $division;
        $restaurant->city_english  =   $city;
        $restaurant->thana_upazila_english  =   $thana_upazila;
        $restaurant->zip_code  =   $zip_code;
        $restaurant->owner_name  =   $owner_name;
        $restaurant->owner_contact_number  =   $owner_contact_number;
        $restaurant->category  =   $category;
        $restaurant->save();
        return redirect()->route('admin.restaurantList');

    }

    public function RestaurantList(){
       $restaurants=Restaurants::where('status',1)->get();

       return view('restaurant.restaurantList')->with('restaurants',$restaurants);
    }
    public function RestaurantDetailsByID($id){

    }

    public function RestaurantStatusChange(Request $request){
        $restaurant = Restaurants::find($request->id);

        if($restaurant->status==0){
            $restaurant->status=1;
        }
        else if($restaurant->status==1){
            $restaurant->status=0;
        }

        $restaurant->save();

        return "Status Changed";
    }
}
