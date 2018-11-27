<?php

namespace App\Http\Controllers;
use App\Categorys;
use App\Complains;
use App\Inspections;
use App\Ratings;
use App\Restaurants;
use Illuminate\Http\Request;

class RestaurantController extends Controller
{
    public function AddRestaurant(){
        $categorys=Categorys::all();
        return view('restaurant.addRestaurant')->with('categorys',$categorys);
    }

    public function AddRestaurantPost(Request $request){
        $restaurant_id=$request->input('restaurant_id');
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
        $current_category=$request->input('category');
        $last_inspection_date=$request->input('last_inspection_date');
        $inspected_by=$request->input('inspected_by');

        $this
            ->validate($request,[
                'restaurant_id'       =>'unique:restaurants,restaurant_id',
            ],
                [

                    'restaurant_id.unique'          => 'Restaurant ID already exist',
                ]);

       // return $restaurant_id;
        $added_by=session()->get('admin.id');
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
        $restaurant->added_by  =   $added_by;

        $restaurant->save();
        return redirect()->route('admin.restaurantList');

    }

    public function RestaurantList(){
       $restaurants=Restaurants::where('status',1)->orderBy('id','desc')->get();

       return view('restaurant.restaurantList')->with('restaurants',$restaurants);
    }
    public function ClosedRestaurantList(){
        $restaurants=Restaurants::where('status',0)->get();

        return view('restaurant.closedRestaurantList')->with('restaurants',$restaurants);
    }


    public function RestaurantStatusChange(Request $request){
        $restaurant = Restaurants::find($request->id);
        $updated_by=session()->get('admin');
        if($restaurant->status==0){
            $restaurant->status=1;
        }
        else if($restaurant->status==1){
            $restaurant->status=0;
        }
$restaurant->updated_by=$updated_by;
        $restaurant->save();

        return "Status Changed";
    }


    public function RestaurantDetails($id){
        //complain, rating, inspection history, details
        $restaurant=Restaurants::where('restaurant_id',$id)->first();

        $complains=Complains::where('restaurant_id',$id)->orderBy('id', 'desc')->get();
        $ratings=Ratings::where('restaurant_id',$id)->orderBy('id', 'desc')->get();
        $inspections=Inspections::where('restaurant_id',$id)->orderBy('id', 'desc')->get();
        $categorys=Categorys::all();
        return view('restaurant.restaurantDetails',['restaurant'=>$restaurant,'complains'=>$complains,
            'inspections'=>$inspections,'ratings'=>$ratings,'categorys'=>$categorys]);
    }

    public function EditRestaurant($id){

        $restaurant=Restaurants::find($id);
        $categorys=Categorys::all();
        return view('restaurant.editRestaurant',['restaurant'=>$restaurant,'categorys'=>$categorys]);
    }
    public function EditRestaurantPost(Request $request){
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



        $updated_by=session()->get('admin.id');
        $restaurant_id=$request->input('restaurant_id');
        $id=$request->input('id');
        $restaurant=Restaurants::find($id);
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
        $restaurant->updated_by=$updated_by;
        $restaurant->save();
        return redirect()->route('admin.restaurantList');

    }
}
