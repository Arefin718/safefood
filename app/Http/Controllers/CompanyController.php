<?php

namespace App\Http\Controllers;
use App\Categorys;
use App\Comments;
use App\Inspections;
use App\Ratings;
use App\Companys;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
    public function AddCompany(){
        $categorys=Categorys::all();
        return view('Company.addCompany')->with('categorys',$categorys);
    }

    public function AddCompanyPost(Request $request){
        $date=date('ymdhms');
        $company_id="BFSA".$date;

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
                'company_id'       =>'unique:Companys,company_id',
            ],
                [

                    'company_id.unique'          => 'Company ID already exist',
                ]);

       // return $company_id;
        $added_by=session()->get('admin.id');
        $company=new Companys();
        $company->company_id  =   $company_id;
        $company->title_english  =   $title_english;
        $company->title_bangla  =   $title_bangla;
        $company->location_english  =   $location_english;
        $company->location_bangla  =   $location_bangla;
        $company->division_english  =   $division;
        $company->city_english  =   $city;
        $company->thana_upazila_english  =   $thana_upazila;
        $company->zip_code  =   $zip_code;
        $company->owner_name  =   $owner_name;
        $company->owner_contact_number  =   $owner_contact_number;
        $company->added_by  =   $added_by;

        $company->save();

        return redirect()->route('admin.companyList');

    }

    public function CompanyList(){
       $companys=Companys::where('status',1)->orderBy('id','desc')->get();

       return view('Company.CompanyList')->with('companys',$companys);
    }
    public function ClosedCompanyList(){
        $companys=Companys::where('status',0)->get();

        return view('Company.closedCompanyList')->with('Companys',$companys);
    }


    public function CompanyStatusChange(Request $request){
        $company = Companys::find($request->id);
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
        $companys=Companys:: CompanyDetails($id);

        $comments=Comments::where('company_id',$id)->orderBy('id', 'desc')->get();
        $ratings=Ratings::where('company_id',$id)->orderBy('id', 'desc')->get();
        $inspections=Inspections::where('company_id',$id)->orderBy('id', 'desc')->get();
        $categorys=Categorys::all();
        return view('Company.CompanyDetails',['companys'=>$companys,'comments'=>$comments,
            'inspections'=>$inspections,'ratings'=>$ratings,'categorys'=>$categorys]);
    }

    public function EditCompany($id){

        $company=Companys::find($id);
        $categorys=Categorys::all();
        return view('Company.editCompany',['Company'=>$company,'categorys'=>$categorys]);
    }
    public function EditCompanyPost(Request $request){
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
        $company_id=$request->input('company_id');
        $id=$request->input('id');
        $company=Companys::find($id);
        $company->company_id  =   $company_id;
        $company->title_english  =   $title_english;
        $company->title_bangla  =   $title_bangla;
        $company->location_english  =   $location_english;
        $company->location_bangla  =   $location_bangla;
        $company->division_english  =   $division;
        $company->city_english  =   $city;
        $company->thana_upazila_english  =   $thana_upazila;
        $company->zip_code  =   $zip_code;
        $company->owner_name  =   $owner_name;
        $company->owner_contact_number  =   $owner_contact_number;
        $company->updated_by=$updated_by;
        $company->save();
        return redirect()->route('admin.CompanyList');

    }
}
