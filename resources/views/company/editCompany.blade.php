@extends('layouts.admin-layout')


@section('title', 'BFSA | Admin')
<link rel="stylesheet" href="{{ URL::asset('assets/css/normalize.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assets/css/form-styles.css') }}">
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
                        <input required  type="text" name="title_english" id="title_english"  value="{{$company->title_english}}"  placeholder="Please Enter company Title">
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
                        <input required  type="text" name="location_english" id="search_location" value="{{$company->location_english}}"   placeholder="Please Enter company Address" required >
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
                        <select required name="division_id" id="division">

                            @foreach($divisions as $division)
                                @if($company->division_id == $division->division_id)
                                <option selected value="{{$division->division_id}}">{{$division->title_english}}</option>
                                @else
                                    <option  value="{{$division->division_id}}">{{$division->title_english}}</option>
                                @endif
                            @endforeach

                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="city">District</label>
                        <select  required name="district_id" id="district">
                            @foreach($districts as $district)
                                @if($company->division_id == $district->division_id)
                                @if($company->district_id == $district->district_id)
                                    <option selected value="{{$district->district_id}}">{{$district->title_english}}</option>
                                @else
                                    <option  value="{{$district->district_id}}">{{$district->title_english}}</option>
                                @endif
                                @endif
                            @endforeach

                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="city">Thana/Upazila</label>
                        <select  required name="upazila_id" id="upazila">
                            @foreach($upazilas as $upazila)
                                @if($company->district_id == $upazila->district_id)
                                @if($company->upazila_id == $upazila->upazila_id)
                                    <option selected value="{{$upazila->upazila_id}}">{{$upazila->title_english}}</option>
                                    @else
                                        <option selected value="{{$upazila->upazila_id}}">{{$upazila->title_english}}</option>
                                @endif
                                @endif
                            @endforeach
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
                <div class="file-tab panel-body">
                    <label class="btn btn-default btn-file">
                        <span>Browse</span>
                        <!-- The file is stored here. -->
                        <input  type="file" name="compnay_image" id="company_image">
                    </label>
                    <button type="button" class="btn btn-default" style="display: none;">Remove</button>
                </div>

                <input name="latitude" type="hidden" class="search_latitude" value="{{$company->latitude}}">
                <input name="longitude" type="hidden" class="search_longitude" value="{{$company->longitude}}">
                <div class="row">
                    <div class="col-sm-12">
                        <button name="register-submit" type="submit" class="button green">Update company</button>
                    </div>
                </div>
            </form><!-- END OF REGISTER FORM -->
        </div><!-- END OF WRAPPER DIV -->

    </div>





@endsection

@section('scripts')

    <script src="{{ URL::asset('assets/js/jquery-ui.js') }}"></script>
    <script src="{{ URL::asset('assets/js/company/editCompany.js') }}"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqEJeUG6el1uAtNYRLvMBWr3tLasd2GhA"></script>


@endsection