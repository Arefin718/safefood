@extends('layouts.admin-layout')


@section('title', 'BFSA | Admin')
<link rel="stylesheet" href="{{ URL::asset('assets/css/normalize.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assets/css/form-styles.css') }}">

@section('content')

    <div class="container-fluid" style="background-color: seashell">
        <div class="form-wrapper">


            <!-- BEGIN REGISTER FORM -->
            <form class="form-content" id="register-form" action="#" method="post" enctype="multipart/form-data">
                {{ csrf_field() }}

                <div class="row">
                    <div class="col-md-12">
                        <h2 class="form-title text-center">Add New Restaurant</h2>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Title (in English)<span>* </span></label>
                        <input required  type="text" name="title_english" id="title_english"   placeholder="Please Enter Restaurant Title" required>
                        <label style="color: #fff;">{{$errors->first('title')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Title (in Bangla)<span>* </span></label>
                        <input  type="text" name="title_bangla" id="title_bangla"   placeholder="Please Enter Restaurant Title" >

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Address (in English)<span>* </span></label>
                        <input required  type="text" name="location_english" id="location_english"   placeholder="Please Enter Restaurant Address" required >
                        <label style="color: #fff;">{{$errors->first('location_english')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Address (in Bangla)<span>* </span></label>
                        <input   type="text" name="location_bangla" id="location_bangla"   placeholder="Please Enter Restaurant Address (in Bangla)" required >

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                                <label for="p_type">Division</label>
                                <select required name="p_type" id="type">

                                    <option value="DHK">Barishal</option>
                                    <option value="DHK">Chittagong</option>
                                    <option value="DHK" selected >Dhaka</option>
                                    <option value="DHK">Khulna</option>
                                    <option value="DHK">Mymensingh</option>
                                    <option value="DHK">Rajshahi</option>
                                    <option value="DHK">Rangpur</option>
                                    <option value="DHK">Sylhet</option>

                                </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="city">City</label>
                        <select  required name="city" id="type">
                            <option value=""></option>
                            <option value="City 1">City 1</option>
                            <option value="City 2">City 2</option>
                            <option value="City 3">City 3</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="city">Thana/Upazila</label>
                        <select  required name="thana_upazila" id="type">
                            <option value=""></option>
                            <option value="TU 1">TU 1</option>
                            <option value="TU 2">TU 2</option>
                            <option value="TU 3">TU 3</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Zip Code<span>* </span></label>
                        <input required  type="text" name="zip_code" id="zip_code"   placeholder="Please Enter Zip Code">
                        <label style="color: #fff;">{{$errors->first('zip_code')}}</label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Owner Name<span>* </span></label>
                        <input required  type="text" name="owner_name" id="owner_name"   placeholder="Please Enter Owner Name">
                        <label style="color: #fff;">{{$errors->first('owner_name')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Owner Contact<span>* </span></label>
                        <input required  type="text" name="owner_contact_number" id="owner_contact_number"   placeholder="Please Enter Owner Number">
                        <label style="color: #fff;">{{$errors->first('owner_contact_number')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="p_type">Restaurant Category</label>
                        <select required name="category" id="category">
                            <option >Select Category</option>
                            @foreach($categorys as $category)
                                <option value="{{$category->title}}">{{$category->title}}</option>
                            @endforeach

                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <button name="register-submit" type="submit" class="button green">Add Restaurant</button>
                    </div>
                </div>
            </form><!-- END OF REGISTER FORM -->
        </div><!-- END OF WRAPPER DIV -->

    </div>





@endsection