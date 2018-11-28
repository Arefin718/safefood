@extends('layouts.admin-layout')


@section('title', 'BFSA | Admin')
<link rel="stylesheet" href="{{ URL::asset('assets/css/normalize.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assets/css/form-styles.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assets/css/datepicker.css') }}">
@section('content')

    <div class="container-fluid" style="background-color: seashell">
        <div class="form-wrapper">


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

                        <label for="city">District</label>
                        <select  required name="city" id="city">
                            <option value="">Select</option>
                            <option value="Dhaka">Dhaka</option>

                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="city">Thana/Upazila</label>
                        <select  required name="thana_upazila" id="thana_upazila">
                            <option value="">Select</option>
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


    <script type="text/javascript">
        $(document).ready(function() {
            $.fn.datepicker.defaults.format = "yyyy-mm-dd";

            $('.reg_date').datepicker({


            });
        });

    </script>
@endsection