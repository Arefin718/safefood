@extends('layouts.admin-layout')


@section('title', 'BFSA | Admin')

<link rel="stylesheet" href="{{ URL::asset('assets/css/normalize.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assets/css/form-styles.css') }}">


@section('content')


    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
        <div id="qrcode"></div>

        <div class="panel panel-info">
            <div class="panel-heading">

                    <h3 class="panel-title">{{$restaurant->title_english}}</h3>
            </div>
            <div class="panel-body">
                <div class="row">


                    <div class=" col-md-9 col-lg-9 ">
                        <table class="table table-user-information">
                            <tbody>

                            <tr>
                                <td>ID</td>
                                <td id="restaurant_id">{{$restaurant->restaurant_id}}</td>
                            </tr>

                            <tr>
                                <td>Address</td>
                                <td>{{$restaurant->location_english}}</td>
                            </tr>
                            <tr>
                                <td>District</td>
                                <td>{{$restaurant->city_english}}</td>
                            </tr>
                            <tr>
                                <td>Zip Code</td>
                                <td>{{$restaurant->zip_code}}</td>
                            </tr>

                            <tr>
                                <td>Owner Name</td>
                                <td>{{$restaurant->owner_name}}</td>
                            </tr>

                            <tr>
                                <td>Owner Contact</td>
                                <td>{{$restaurant->owner_contact_number}}</td>
                            </tr>
                            <tr>
                                <td>Category</td>
                                <td>{{$restaurant->current_category}}</td>
                            </tr>
                            <tr>
                                <td>Last Inspection Date</td>
                                <td>{{$restaurant->last_inspection_date}}</td>
                            </tr>
                            <td>Last Inspected By</td>
                            <td>{{$restaurant->inspected_by}}</td>
                            </tr>
                            </tbody>
                        </table>

                        <a href="/restaurant/edit/{{$restaurant->restaurant_id}}}" class="btn btn-primary">Edit</a>
                        <td class="txt-dark">
                            <a type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Inspect</a>
                        </td>
                        <td class="txt-dark">
                            <a onclick="makeCode()" type="button" class="btn btn-primary">Print QR</a>
                        </td>
                        <a href="/restaurantlist" class="btn btn-primary">Back to List</a>
                    </div>
                </div>
            </div>

        </div>
        {{-- Tab Selection--}}
        <div class="row">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#inspections">Inspections</a></li>
                <li><a data-toggle="tab" href="#ratings">Ratings</a></li>
                <li><a data-toggle="tab" href="#complains">Comments</a></li>

            </ul>
        </div>
    </div>

    <div class="tab-content">
        {{-- Inspection Tab--}}
        <div id="inspections" class="tab-pane fade in active">
            <div class="col-sm-12">
                <div class="panel panel-default card-view">
                    <div class="panel-wrapper collapse in">
                        <div class="panel-body row">

                            <div class="table-wrap">

                                <div class="table-responsive">

                                    <div id="depositTable_print">

                                        <table id="inspectionTable" class="HTMLtoPDF table display responsive product-overview mb-30 myTable">
                                            <thead>
                                            <tr>
                                                <th>Inspection Date</th>
                                                <th>Inspected By</th>
                                                <th>Inspected Category</th>
                                                <th></th>

                                            </tr>
                                            </thead>
                                            <tbody id="inspections_list">

                                            @foreach($inspections as $inspection)

                                                <tr>
                                                    <td class="txt-dark">{{$inspection->inspection_date}}</td>
                                                    <td class="txt-dark">{{$inspection->inspected_by}}</td>
                                                    <td class="txt-dark">{{$inspection->current_category}}</td>
                                                    <td class="txt-dark"><a href="#">Edit</a></td>

                                                </tr>

                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        {{-- Ratings Tab--}}
        <div id="ratings" class="tab-pane fade in ">
            <div class="col-sm-12">
                <div class="panel panel-default card-view">
                    <div class="panel-wrapper collapse in">
                        <div class="panel-body row">

                            <div class="table-wrap">

                                <div class="table-responsive">

                                    <div id="depositTable_print">

                                        <table id="ratingsTable" class="HTMLtoPDF table display responsive product-overview mb-30 myTable">
                                            <thead>
                                            <tr>
                                                <th>Rate</th>
                                                <th>rating by</th>


                                            </tr>
                                            </thead>
                                            <tbody id="rating_list">

                                            @foreach($ratings as $rating)

                                                <tr>
                                                    <td class="txt-dark">{{$rating->rate}}</td>
                                                    <td class="txt-dark">{{$rating->user_id}}</td>

                                                </tr>

                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        {{-- Complains Tab--}}
        <div id="complains" class="tab-pane fade in ">
            <div class="col-sm-12">
                <div class="panel panel-default card-view">
                    <div class="panel-wrapper collapse in">
                        <div class="panel-body row">

                            <div class="table-wrap">

                                <div class="table-responsive">

                                    <div id="complains_table">

                                        <table id="complainsTable" class="HTMLtoPDF table display responsive product-overview mb-30 myTable">
                                            <thead>
                                            <tr>
                                                <th>Comment By</th>
                                                <th>Note</th>


                                            </tr>
                                            </thead>
                                            <tbody id="complains_list">

                                            @foreach($complains as $complain)

                                                <tr>
                                                    <td class="txt-dark">{{$complain->rate}}</td>
                                                    <td class="txt-dark">{{$complain->user_id}}</td>

                                                </tr>

                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>


    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Inspection</h4>
                </div>
                <div class="modal-body">
                    <div class="form-wrapper">


                        <!-- BEGIN REGISTER FORM -->
                        <form class="form-content" id="inspection-form" action="/restaurant/addinspection" method="post" enctype="multipart/form-data">
                            {{ csrf_field() }}


                            <input hidden name="form_restaurant_id" id="form_restaurant_id" value="{{$restaurant->restaurant_id}}">
                            <input hidden name="form_id" id="form_id" value="{{$restaurant->id}}">

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="p_type">Inspection Date</label>
                                    <div class="input-group date" data-provide="datepicker">
                                        <input required id="form_inspection_date" name="form_inspection_date" type="text" class="form-control"  placeholder="Please enter inspection date yyyy-mm-dd">
                                        <div class="input-group-addon">
                                            <span class="glyphicon glyphicon-th"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="p_type">Restaurant Category</label>
                                    <select required name="form_category" id="form_category">
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
                                    <input required  type="text" name="form_inspected_by" id="form_inspected_by"   placeholder="Please enter inspected_by">
                                    <label style="color: #fff;">{{$errors->first('inspected_by')}}</label>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-12">
                                    <button onclick="" name="register-submit" type="submit" class="button green">Add  Inspection</button>
                                </div>
                            </div>
                        </form><!-- END OF REGISTER FORM -->
                    </div><!-- END OF WRAPPER DIV -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
        {{--Purchase History Modal End--}}

        @endsection

@section('scripts')
            <script src="{{asset('vendors/bower_components/datatables/media/js/jquery.dataTables.min.js')}}"></script>
            <script src="{{ URL::asset('assets/js/datepicker.js') }}"></script>
            <script src="{{ URL::asset('assets/js/inspection/inspection.js') }}"></script>
            <script src="{{ URL::asset('assets/js/jquery-1.11.1.min.js') }}"></script>
            <script src="{{ URL::asset('assets/js/qrcode.min.js') }}"></script>



            <script src="{{ URL::asset('assets/js/restaurant/restaurantDetails.js') }}"></script>
            <script>
                $(document).ready(function(){
                    $('#inspectionTable').dataTable();
                    $('#ratingsTable').dataTable();
                    $('#complainsTable').dataTable();

                    $.fn.datepicker.defaults.format = "yyyy-mm-dd";

                    $('#form_inspection_date').datepicker({


                    });





                });
            </script>
@endsection



