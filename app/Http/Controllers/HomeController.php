<?php
namespace App\Http\Controllers;
use App\Admin;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Session;


class HomeController extends Controller
{
    public function Login(){
        $message="";
        if (session()->has('admin')) {
            return redirect()->route('login');
        }else{

            return view('login',['message'=>$message]);
        }
    }

    public function LoginPost(Request $request){


        $email_or_number= $request->input('email');
        $password=$request->input('password');

        $adminDB = Admin::where('email', '=', $email_or_number)->orwhere('contact_number','=',$email_or_number)->first();

        $message="";

        if($adminDB==null){
            $message="Email doesn't exist";
            return view('login',['message'=>$message]);
        }else {

            if($password == $adminDB->password){
                session(['admin' => $adminDB]);



                if($adminDB->status ==0){
                    $message = "Your account has been blocked. please contact with author";
                    // return $message;
                    return view('login', ['message' => $message]);
                }
              //  return "login";

                return redirect()->route('home');
            }else {
                $message = "Email or Password is wrong";
                return view('login', ['message' => $message]);
            }
        }

    }

    public function AdminHome(){

            return view('admin.home');
    }


    public function Logout(){
        session()->forget('admin');
        return redirect()->route('login');
    }


}
