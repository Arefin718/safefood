<?php

namespace App\Http\Controllers;

use App\Area;
use App\Districts;
use App\Upazilas;
use Illuminate\Http\Request;

class AreaController extends Controller
{
    public function AddArea(){
        return view('area.addArea');
    }

   // public function AddArea(Request $request){
      /*  $division_english=$request->input('division');
        $district_english=$request->input('district');
        $thana_upazila_english=$request->input('thana_upazila');

        $this
            ->validate($request,[
                'thana_upazila_english'       =>'required|unique:areas,thana_upazila_english',
                'district_english'       =>'required',
            ],
                [
                    'title.required'         => 'Please provide title',
                    'title.unique'          => 'This thana or upazila already exist ',
                ]);


        $area=new Area();
        $area->division_english=$division_english;
        $area->district_english=$district_english;
        $area->thana_upazila_english=$thana_upazila_english;*/


   // }

    public function GetDistrictList(Request $request){
        $districts=Districts::where('division_id','=',$request->division_id)->get();
        return $districts;

    }
    public function GetThanaList(Request $request){
        $thana_upazilas=Upazilas::where('district_id','=',$request->district_id)->get();
        return $thana_upazilas;

    }
}
