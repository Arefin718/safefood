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
                        <h2 class="form-title text-center">Update Food Company</h2>
                    </div>
                </div>
<input hidden type="text" name="id" value="{{$company->id}}"/>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">company id<span> </span></label>
                        <input readonly required  type="text" name="company_id" id="company_id"  value="{{$company->company_id}}"  placeholder="Please Enter company Title" required>
                        <label style="color: #fff;">{{$errors->first('title')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Title (in English)<span>* </span></label>
                        <input required  type="text" name="title_english" id="title_english"  value="{{$company->title_english}}"  placeholder="Please Enter company Title" required>
                        <label style="color: #fff;">{{$errors->first('title')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Title (in Bangla)<span>* </span></label>
                        <input  type="text" name="title_bangla" id="title_bangla" value="{{$company->title_bangla}}"   placeholder="Please Enter company Title" >

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Address (in English)<span>* </span></label>
                        <input required  type="text" name="location_english" id="location_english" value="{{$company->location_english}}"   placeholder="Please Enter company Address" required >
                        <label style="color: #fff;">{{$errors->first('location_english')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Address (in Bangla)<span>* </span></label>
                        <input   type="text" name="location_bangla" id="location_bangla" value="{{$company->location_bangla}}"   placeholder="Please Enter company Address (in Bangla)" required >

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="p_type">Division</label>
                        <select required name="division" id="division">

                            <option value="barishal">Barishal</option>
                            <option value="Chittagong">Chittagong</option>
                            <option value="Dhaka" selected >Dhaka</option>
                            <option value="Khulna">Khulna</option>
                            <option value="Mymensingh">Mymensingh</option>
                            <option value="Rajshahi">Rajshahi</option>
                            <option value="Rangpur">Rangpur</option>
                            <option value="Sylhet">Sylhet</option>

                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="city">City</label>
                        <select  required name="city" id="city">
                            <option value=""></option>
                            <option value="Dhaka">Dhaka</option>

                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="city">Thana/Upazila</label>
                        <select  required name="thana_upazila" id="thana_upazila">
                            <option value=""></option>
                            <option value="Uttara">Uttara</option>
                            <option value="Badda">Badda</option>
                            <option value="Banani">Banani</option>
                            <option value="Gulshan">Gulshan</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Zip Code<span>* </span></label>
                        <input required  type="text" name="zip_code" id="zip_code" value="{{$company->zip_code}}"  placeholder="Please Enter Zip Code">
                        <label style="color: #fff;">{{$errors->first('zip_code')}}</label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Owner Name<span>* </span></label>
                        <input required  type="text" name="owner_name" id="owner_name" value="{{$company->owner_name}}"  placeholder="Please Enter Owner Name">
                        <label style="color: #fff;">{{$errors->first('owner_name')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Owner Contact<span>* </span></label>
                        <input required  type="text" name="owner_contact_number" id="owner_contact_number" value="{{$company->owner_contact_number}}"  placeholder="Please Enter Owner Number">
                        <label style="color: #fff;">{{$errors->first('owner_contact_number')}}</label>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <button name="register-submit" type="submit" class="button green">Update company</button>
                    </div>
                </div>
            </form><!-- END OF REGISTER FORM -->
        </div><!-- END OF WRAPPER DIV -->

    </div>





@endsection