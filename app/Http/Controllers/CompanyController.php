<?php

namespace App\Http\Controllers;
use App\Categorys;
use App\Comments;
use App\Districts;
use App\Inspections;
use App\Ratings;
use App\Companies;
use App\company_quality_types;
use App\Divisions;

use App\Upazilas;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
    public function AddCompany(){
        $quality_types=	company_quality_types::all();
        $division=Divisions::all();


        return view('Company.addCompany',['quality'=>$quality_types,'divisions'=>$division]);
    }

    public function AddCompanyPost(Request $request){
        $date=date('ymdhms');
        $company_id="BFSA".$date;

        $title_english=$request->input('title_english');
        $title_bangla=$request->input('title_bangla');
        $location_english=$request->input('location_english');
        $location_bangla=$request->input('location_bangla');
        $division_id=$request->input('division_id');
        $district_id=$request->input('district_id');
        $upazila_id=$request->input('upazila_id');
        $zip_code=$request->input('zip_code');
        $owner_name=$request->input('owner_name');
        $owner_contact_number=$request->input('owner_contact_number');
        $latitude=$request->input('latitude');
        $longitude=$request->input('longitude');


        $this
            ->validate($request,[
                'company_id'       =>'unique:Companies,company_id',
            ],
                [

                    'company_id.unique'          => 'Company ID already exist',
                ]);

       // return $company_id;
        $added_by=session()->get('admin.admin_id');

        $company=new Companies();
        $company->company_id  =   $company_id;
        $company->title_english  =   $title_english;
        $company->title_bangla  =   $title_bangla;
        $company->location_english  =   $location_english;
        $company->location_bangla  =   $location_bangla;
        $company->division_id  =   $division_id;
        $company->district_id  =   $district_id;
        $company->upazila_id  =   $upazila_id;
        $company->zip_code  =   $zip_code;
        $company->owner_name  =   $owner_name;
        $company->owner_contact_number  =   $owner_contact_number;
        $company->latitude = $latitude;
        $company->longitude = $longitude;
        $company->added_by  =   $added_by;

        //File Upload Code Start
        $file = $request->file('compnay_image');
        $file_name = $company_id. '.' . $file->getClientOriginalExtension();
        $file->move(public_path('/uploads/company/images'), $file_name);
        //File Upload Code End
        $company->image = '/public/uploads/company/images/'.$file_name;
        $company->save();

        return redirect()->route('admin.companyDetails')->with('id',$company_id);

    }

    public function CompanyList(){
       $companies=Companies::CompaniesList();

       return view('Company.CompanyList')->with('companys',$companies);
    }
    public function ClosedCompanyList(){
        $companys=Companies::where('status',0)->get();

        return view('Company.closedCompanyList')->with('Companies',$companys);
    }


    public function CompanyStatusChange(Request $request){
        $company = Companies::find($request->id);
        $updated_by=session()->get('admin');
        if($company->status==0){
            $company->status=1;
        }
        else if($company->status==1){
            $company->status=0;
        }
$company->updated_by=$updated_by;
        $company->save();

        return "Status Changed";
    }


    public function CompanyDetails($id){
        //complain, rating, inspection history, details
        $companys=Companies:: CompanyDetails($id);

        $comments=Comments::where('company_id',$id)->orderBy('comment_id', 'desc')->get();
        $ratings=Ratings::where('company_id',$id)->orderBy('rating_id', 'desc')->get();
        $inspections=Inspections::GetInspectionListByID($id);
        $categorys=company_quality_types::all();
        return view('Company.CompanyDetails',['companys'=>$companys,'comments'=>$comments,
            'inspections'=>$inspections,'ratings'=>$ratings,'categorys'=>$categorys]);
    }

    public function EditCompany($id){

        $company=Companies::find($id);

        $divisions=Divisions::all();
        $districts=Districts::all();
        $upazilas=Upazilas::all();
        return view('Company.editCompany',['company'=>$company,'divisions'=>$divisions,'districts'=>$districts,'upazilas'=>$upazilas]);
    }
    public function EditCompanyPost(Request $request){
        $company_id=$request->input('company_id');
        $title_english=$request->input('title_english');
        $title_bangla=$request->input('title_bangla');
        $location_english=$request->input('location_english');
        $location_bangla=$request->input('location_bangla');
        $division_id=$request->input('division_id');
        $district_id=$request->input('district_id');
        $upazila_id=$request->input('upazila_id');
        $zip_code=$request->input('zip_code');
        $owner_name=$request->input('owner_name');
        $owner_contact_number=$request->input('owner_contact_number');
        $latitude=$request->input('latitude');
        $longitude=$request->input('longitude');

        $file=$request->file('compnay_image');



        if($file !=null){
            //File replace Code Start
            $file_name = $company_id. '.' . $file->getClientOriginalExtension();
            if(file_exists(public_path('/uploads/company/image/'.$file_name))){
                //delete existing file
                File::delete(public_path('/uploads/company/images'.$file_name));

            }

            $file->move(public_path('/uploads/company/images'), $file_name);

            //File Upload Code End
        }






        $updated_by=session()->get('admin.admin_id');

        $id=$request->input('id');
        $company=Companies::find($id);
        $company->company_id  =   $company_id;
        $company->title_english  =   $title_english;
        $company->title_bangla  =   $title_bangla;
        $company->location_english  =   $location_english;
        $company->location_bangla  =   $location_bangla;
        $company->division_id  =   $division_id;
        $company->district_id  =   $district_id;
        $company->upazila_id  =   $upazila_id;
        $company->zip_code  =   $zip_code;
        $company->owner_name  =   $owner_name;
        $company->owner_contact_number  =   $owner_contact_number;
        $company->updated_by=$updated_by;
        $company->latitude = $latitude;
        $company->longitude = $longitude;

        $company->save();
        return redirect()->route('admin.companyDetails',[$company_id]);

    }
}
