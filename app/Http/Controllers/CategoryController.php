<?php

namespace App\Http\Controllers;


use App\Categorys;
use Illuminate\Http\Request;

class CategoryController extends Controller
{

    public function AddCategory(){
        return view('category.addCategory');
    }

    public function AddCategoryPost(Request $request){

        $title=$request->input('title');
        $description=$request->input('description');

        $this
            ->validate($request,[
                'title'       =>'required|unique:categorys,title',
            ],
                [
                    'title.required'         => 'Please provide title',
                    'title.unique'          => 'This title exist ',
                ]);


        $category=New Categorys();
        $category->title          =$title;
        $category->description    =$description;

        $category->save();

        return redirect()->route('admin.categoryList');

    }

    public function CategoryList(){

        $categorys=Categorys::all();

        return view('category.categoryList')->with('categorys',$categorys);
    }



    public function EditCategory($id){
        $category=Categorys::find($id);

        return view('category.editCategory')->with('category',$category);
    }
    public function EditCategoryPost(Request $request){
        $category_id=$request->input('category_id');
        $title=$request->input('title');
        $description=$request->input('description');
        $this
            ->validate($request,[
                'title'       =>'required',
            ],
                [
                    'title.required'         => 'Please provide title',

                ]);
        $category=Categorys::find($category_id);

        $category->title  =$title;
        $category->description    =$description;
        $category->save();

        // return $type;
        $categorys=Categorys::all();
        return view('category.categoryList')->with('categorys',$categorys);

    }
}
