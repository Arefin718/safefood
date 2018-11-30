<?php

namespace App\Http\Controllers;

use App\Admin;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function AdminProfileView(){
        $admin_id=session()->get('admin.id');
       // return $admin;
        $admin=Admin::find($admin_id);
        return view('admin.profile')->with('admin',$admin);
    }

    public function AdminProfileViewPost(Request $request){
        $name=$request->input('name');
        $contact_number=$request->input('contact_number');
        $email=$request->input('email');

        $this
            ->validate($request,[
                'name'       =>'required',


            ],
                [
                    'name.required'         => 'Please provide name',

                ]);
        $updated_by=session()->get('admin.id');

        $admin=Admin::find($updated_by);
        $admin->name = $name;
        $admin->contact_number = $contact_number;
        $admin->updated_by = $updated_by;
        $admin->save();
        return redirect()->route('admin.profileView');
    }


    public function AdminPasswordChange(){

        $error="";
        return view('admin.changePassword')->with('error',$error);
    }

    public function AdminPasswordChangePost(Request $request)
    {

        $oldPass = $request->input('oldPass');
        $newPassword = $request->input('newPassword');
        $confirmPassword = $request->input('confirmPassword');

        $this->validate($request,[
            'oldPass'    =>'required',
            'newPassword'   =>'required',
            'confirmPassword'=>'required|same:newPassword'

        ]);
$admin_id= session()->get('admin.id');
        $admin=Admin::find($admin_id);

        if($oldPass == $admin->password){
            $newPass = $request->input('newPassword');
            $admin->password = $newPass;

            $admin->save();
            session(['user' => $admin]);
            return redirect()->route('home');
        }else{
            $error="Old Password is not correct";
            return view('admin.passwordChange')->with('error',$error);

        }

    }
    }
