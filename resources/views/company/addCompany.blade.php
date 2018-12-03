@extends('layouts.admin-layout')


@section('title', 'BFSA | Admin')
<link rel="stylesheet" href="{{ URL::asset('assets/css/normalize.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assets/css/form-styles.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assets/css/datepicker.css') }}">
@section('styles')
    <style>
        #geomap {
            width: 70%;
            height: 400px;
        }
    </style>
    @endsection
@section('content')

    <div class="container-fluid" style="background-color: seashell">
        <div class="form-wrapper">

            <div class="container">
                <div class="col-md-12 text-center">
                    <div id="geomap"></div>
                </div>
            </div>
            <!-- BEGIN REGISTER FORM -->
            <form class="form-content" id="register-form" action="#" method="post" enctype="multipart/form-data">
                {{ csrf_field() }}

                <div class="row">
                    <div class="col-md-12">
                        <h2 class="form-title text-center">Add New Food Company</h2>
                    </div>
                </div>



                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Title (in English)<span>* </span></label>
                        <input   type="text" name="title_english" id="title_english"   placeholder="Please Enter Restaurant Title" required>
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
                        <input    type="text" name="location_english" id="search_location"   placeholder="Please Enter Restaurant Address" required >
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
                                <select required name="division_id" id="division">

                                    @foreach($divisions as $division)
                                        <option  value="{{$division->division_id}}">{{$division->title_english}}</option>
                                        @endforeach

                                </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="district">District</label>
                        <select   name="district_id" id="district">


                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="city">Thana/Upazila</label>
                        <select   name="upazila_id" id="thana_upazila">


                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Zip Code<span>* </span></label>
                        <input   type="text" name="zip_code" id="zip_code"   placeholder="Please Enter Zip Code">
                        <label style="color: #fff;">{{$errors->first('zip_code')}}</label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Owner Name<span>* </span></label>
                        <input   type="text" name="owner_name" id="owner_name"   placeholder="Please Enter Owner Name">
                        <label style="color: #fff;">{{$errors->first('owner_name')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="title">Owner Contact<span>* </span></label>
                        <input   type="text" name="owner_contact_number" id="owner_contact_number"   placeholder="Please Enter Owner Number">
                        <label style="color: #fff;">{{$errors->first('owner_contact_number')}}</label>
                    </div>
                </div>

                <div class="file-tab panel-body">
                    <label class="btn btn-default btn-file">
                        <span>Browse</span>
                        <!-- The file is stored here. -->
                        <input  type="file" name="compnay_image" id="company_image">
                    </label>
                    <button type="button" class="btn btn-default" style="display: none;">Remove</button>
                </div>
               {{-- <div class="row">
                    <div class="col-sm-12">
                        <label for="p_type">Inspection Date</label>
                        <div class="input-group date" data-provide="datepicker">
                            <input id="last_inspection_date" name="last_inspection_date" type="text" class="form-control"  placeholder="Please enter inspection date">
                            <div class="input-group-addon">
                                <span class="glyphicon glyphicon-th"></span>
                            </div>
                        </div>
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
                        <label for="title">Inspected By<span>* </span></label>
                        <input required  type="text" name="inspected_by" id="inspected_by"   placeholder="Please enter inspected_by">
                        <label style="color: #fff;">{{$errors->first('inspected_by')}}</label>
                    </div>
                </div>--}}
                <input name="latitude" type="hidden" class="search_latitude">
                <input name="longitude" type="hidden" class="search_longitude">
                <div class="row">
                    <div class="col-sm-12">
                        <button name="register-submit" type="submit" class="button green">Add Restaurant</button>
                    </div>
                </div>
            </form><!-- END OF REGISTER FORM -->
        </div><!-- END OF WRAPPER DIV -->

    </div>





@endsection
@section('scripts')
    <script src="{{ URL::asset('assets/js/datepicker.js') }}"></script>
    <script src="{{ URL::asset('assets/js/jquery-ui.js') }}"></script>
    <script src="{{ URL::asset('assets/js/company/addCompany.js') }}"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqEJeUG6el1uAtNYRLvMBWr3tLasd2GhA"></script>


@endsection