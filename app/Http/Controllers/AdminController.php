<?php

namespace App\Http\Controllers;

use App\Admin;
use App\Categorys;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function AddAdmin(Request $request){

            return view('admin.addAdmin')->with('request',$request);
    }

    public function AddAdminPost(Request $request){
        $name=$request->input('name');
        $contact_number=$request->input('contact_number');
        $email=$request->input('email');
        $password=$request->input('password');
        $cpassword=$request->input('cnpassword');


        $this
            ->validate($request,[
                'name'       =>'required',
                'email'      =>'required|email|unique:users,email',
                'password'   =>'required|min:5|max:15',
                'cnpassword' =>'required|min:5|max:15|same:password'
            ],
                [
                    'name.required'         => 'Please provide name',
                    'email.required'        => 'You must Provide an email address',
                    'email.email'           => 'You must Provide an email address',
                    'email.unique'          => 'This email already exist ',
                    'password.required'     => 'Please provide your Password',
                    'cnpassword.required'   => 'Please provide your Password again',
                    'cnpassword.same'       => 'Password and confirm password does not match',
                ]);
        $addedBy=session()->get('admin.id');
        $admin=new Admin();

        $admin->name                =$name;
        $admin->email               =$email;
        $admin->password            =$password;
        $admin->contact_number      =$contact_number;
        $admin->added_by            =$addedBy;



        if($admin->save()){

            return redirect()->route('admin.adminList');
        }else{
            return 'Sorry! Registration failed.';
        }
    }

public function AdminList(){
    $admins= Admin::GetAllAdmins();

    return view('admin.adminList')->with('admins',$admins);
}
}
