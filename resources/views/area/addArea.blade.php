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
                        <h2 class="form-title text-center">Add New Area</h2>
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
                            <option value=""></option>
                            <option value="City 1"></option>
                            <option value="City 2">City 2</option>
                            <option value="City 3">City 3</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <label for="city">Thana/Upazila</label>
                        <select  required name="thana_upazila" id="thana_upazila">
                            <option value=""></option>
                            <option value="TU 1">TU 1</option>
                            <option value="TU 2">TU 2</option>
                            <option value="TU 3">TU 3</option>
                        </select>
                    </div>
                </div>




                <div class="row">
                    <div class="col-sm-12">
                        <button name="register-submit" type="submit" class="button green">Add Area</button>
                    </div>
                </div>
            </form><!-- END OF REGISTER FORM -->
        </div><!-- END OF WRAPPER DIV -->

    </div>





@endsection