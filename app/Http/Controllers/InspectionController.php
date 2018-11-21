<?php

namespace App\Http\Controllers;

use App\Inspections;
use App\Restaurants;
use Illuminate\Http\Request;
use Carbon\Carbon;
class InspectionController extends Controller
{
    public function AddInspectionPost(Request $request){
        $id=$request->input('form_id');
        $restaurant_id=$request->input('form_restaurant_id');
        $inspection_date=$request->input('form_inspection_date');
        $inspected_by=$request->input('form_inspected_by');
        $current_category=$request->input('form_category');
        $next_inspection = date('Y-m-d', strtotime("+3 months", strtotime($inspection_date)));


        $restaurant=Restaurants::find($id);
        $restaurant->current_category=$current_category;
        $restaurant->last_inspection_date=$inspection_date;
        $restaurant->inspected_by=$inspected_by;
        $restaurant->save();

        $inspection=new Inspections();
        $inspection->restaurant_id=$restaurant_id;
        $inspection->current_category=$current_category;
        $inspection->inspection_date=$inspection_date;
        $inspection->inspected_by=$inspected_by;
        $inspection->next_inspection=$next_inspection;
        $inspection->save();


        return redirect()->route('admin.restaurantDetails', ['id' => $restaurant_id]);
    }

    public function InspectionList(){
$inspections=Inspections::all();
return view('inspection.inspectionsList')->with('inspections',$inspections);
    }

    public function InspectionsoftheMonth(){
$current_date=date('Y-m');
$inspections=Inspections::InspectionsoftheMonth($current_date);
        return view('inspection.inspectionoftheMonth')->with('inspections',$inspections);
    }

    public function InspectionExpired(){
$current_date=date('Y-m-d');
        $inspections=Inspections::InspectionExpired($current_date);
        return view('inspection.inspectionExpired')->with('inspections',$inspections);
    }
}
