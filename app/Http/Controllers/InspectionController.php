<?php

namespace App\Http\Controllers;

use App\Inspections;
use App\Companies;
use Illuminate\Http\Request;
use Carbon\Carbon;
class InspectionController extends Controller
{
    public function AddInspectionPost(Request $request){
        $id=$request->input('form_id');
        $company_id=$request->input('form_company_id');
        $inspection_date=$request->input('form_inspection_date');
        $inspected_by=$request->input('form_inspected_by');
        $inspected_by_designation=$request->input('form_designation');
        $notes=$request->input('form_notes');
        $quality_category=$request->input('form_category');
        $next_inspection = date('Y-m-d', strtotime("+3 months", strtotime($inspection_date)));

        $added_by=session()->get('admin.admin_id');

        $file=$request->file('compnay_image');


        $company=Companies::find($id);
        if($file !=null){
            //File replace Code Start
            $file_name = $company_id. '.' . $file->getClientOriginalExtension();
            if(file_exists(public_path('/uploads/company/image/'.$file_name))){
                //delete existing file
                File::delete(public_path('/uploads/company/images'.$file_name));

            }
            $company->image = '/public/uploads/company/images/'.$file_name;
            $file->move(public_path('/uploads/company/images'), $file_name);

            //File Upload Code End
        }


        $inspection=new Inspections();
        $inspection->company_id=$company->company_id;
        $inspection->quality_category=$quality_category;
        $inspection->inspection_date=$inspection_date;
        $inspection->inspected_by=$inspected_by;
        $inspection->inspected_by_designation=$inspected_by_designation;
        $inspection->next_inspection=$next_inspection;
        $inspection->notes=$notes;
        $inspection->added_by=$added_by;

        $inspection->save();



        $company->company_quality_type_id = $quality_category;
        $company->inspection_id = $inspection->id;



        $company->save();

        return redirect()->route('admin.companyDetails',[$company->company_id]);
    }

    public function InspectionList(){
$inspections=Inspections::all()->sortByDesc('id');
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
