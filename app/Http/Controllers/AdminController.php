<?php

namespace App\Http\Controllers;

use App\Categorys;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function AddAdmin(){
            return view('admin.addAdmin');
    }

    public function AddAdminPost(Request $request){

    }


}
