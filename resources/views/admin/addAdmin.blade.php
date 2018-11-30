@extends('layouts.admin-layout')


@section('title', 'BFSA | Admin')

<link rel="stylesheet" href="{{ URL::asset('assets/css/normalize.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assets/css/form-styles.css') }}">

@section('content')


    <div class="container-fluid" style="background-color: seashell">
        <div class="form-wrapper">
        {{--@if ($errors->any())--}}
        {{--<div class="alert alert-danger">--}}
        {{--<ul>--}}
        {{--@foreach ($errors->all() as $error)--}}
        {{--<li>{{ $error }}</li>--}}
        {{--@endforeach--}}
        {{--</ul>--}}
        {{--</div>--}}
        {{--@endif--}}

        <!-- BEGIN REGISTER FORM -->
            <form class="form-content" id="register-form" action="#" method="post" enctype="multipart/form-data">
                {{ csrf_field() }}

                <div class="row">
                    <div class="col-md-12">
                        <h2 class="form-title text-center">Add New Admin</h2>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <label for="fname">Name<span>* </span></label>
                        <input value="{{$request->name}}"  type="text" name="name" id="name" pattern="[a-zA-Z ]{1,}"  placeholder="Please enter your full name" required title="It must contain only letters and a length of minimum 2 characters">
                        <label style="color: #fff;">{{$errors->first('name')}}</label>
                    </div>

                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <label for="fname">Contact Number<span></span></label>
                        <input  value="{{$request->contact_number}}" type="text" name="contact_number" id="contact_number"   placeholder="Please enter contact number">

                    </div>

                </div>




                <div class="row">
                    <div class="col-sm-12">
                        <label for="email_reg"><i class="glyphicon glyphicon-envelope"></i> Email<span>* </span></label>
                        <input value="{{$request->email}}" required type="email" name="email" id="email" placeholder="Please enter a valid email address" title="It must contain a valid email address e.g. someone@provider.com" required>
                        <label style="color: #fff;">{{$errors->first('email')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <label for="password_reg"><i class="glyphicon glyphicon-lock"></i> Password<span>* </span></label>
                        <input required type="password" name="password" id="password_reg" pattern=".{6,}"  placeholder="Please enter your password" title="It can contain all types of characters and a length of minimum 6 characters" required>
                        <label style="color: #fff;">{{$errors->first('password')}}</label>
                    </div>
                    <div class="col-sm-6">
                        <label for="rpassword"><i class="glyphicon glyphicon-lock"></i> Confirm Password<span>* </span></label>
                        <input required type="password" name="cnpassword" id="rpassword" pattern=".{6,}"  placeholder="Please enter your password" title="It can contain all types of characters and a length of minimum 6 characters" required>
                        <label style="color: #fff;">{{$errors->first('cnpassword')}}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <button name="register-submit" type="submit" class="button green">Create Account</button>
                    </div>
                </div>
            </form><!-- END OF REGISTER FORM -->
        </div><!-- END OF WRAPPER DIV -->

    </div>


@endsection

@section('scripts')
    <script src="{{ URL::asset('assets/js/jquery.validate.js') }}"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            // validate register form on submit
            $("#register-form").validate();
        });
    </script>
@endsection