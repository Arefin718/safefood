@extends('layouts.admin-layout')
@section('content')



    <div class="container-fluid" style="background-color: seashell">
        <div class="form-wrapper">


            <!-- BEGIN REGISTER FORM -->
            <form class="form-content" id="register-form" action="#" method="post" enctype="multipart/form-data">
                {{ csrf_field() }}

                <div class="row">
                    <div class="col-md-12">
                        <h2 class="form-title text-center">Edit Category</h2>
                    </div>
                </div>


                <input hidden  value="{{$category->id}}" type="text" name="category_id" id="category_id">


                <div class="row">
                    <div class="col-sm-12">
                        <label for="p_name">Title<span>* </span></label>
                        <input required value="{{$category->title}}" type="text" name="title" id="title"   placeholder="Title" required title="It must contain only letters and a length of minimum 2 characters">
                        <label style="color: #fff;">{{$errors->first('title')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="address">Title Description<span>* </span></label>
                        <textarea class="form-control" name="description" rows="4"  id="description">{{$category->description}}</textarea>

                    </div>

                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <button name="register-submit" type="submit" class="button green">Update category</button>
                    </div>
                </div>
            </form><!-- END OF REGISTER FORM -->
        </div><!-- END OF WRAPPER DIV -->

    </div>


@endsection
