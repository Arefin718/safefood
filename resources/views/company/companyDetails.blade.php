@extends('layouts.admin-layout')


@section('title', 'BFSA | Admin')

<link rel="stylesheet" href="{{ URL::asset('assets/css/normalize.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assets/css/form-styles.css') }}">


@section('content')


    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
        <div id="qrcode"></div>
        <a onclick="makeCode()" type="button" class="btn btn-primary">Generate QR</a>
@foreach($companys as $company)
        <div class="panel panel-info">
            <div class="panel-heading">

                    <h3 class="panel-title">{{$company->title_english}}</h3>
            </div>
            <div class="panel-body">
                <div class="row">


                    <div class=" col-md-9 col-lg-9 ">
                        <table class="table table-user-information">
                            <tbody>

                            <tr>
                                <td>ID</td>
                                <td id="company_id">{{$company->company_id}}</td>
                            </tr>

                            <tr>
                                <td>Address</td>
                                <td>{{$company->location_english}}</td>
                            </tr>
                            <tr>
                                <td>District</td>
                                <td>{{$company->city_english}}</td>
                            </tr>
                            <tr>
                                <td>Zip Code</td>
                                <td>{{$company->zip_code}}</td>
                            </tr>

                            <tr>
                                <td>Owner Name</td>
                                <td>{{$company->owner_name}}</td>
                            </tr>

                            <tr>
                                <td>Owner Contact</td>
                                <td>{{$company->owner_contact_number}}</td>
                            </tr>
                            <tr>
                                <td>Category</td>
                                <td>{{$company->current_category}}</td>
                            </tr>
                            <tr>
                                <td>Last Inspection Date</td>
                                <td>{{$company->inspection_date}}</td>
                            </tr>
                            <td>Last Inspected By</td>
                            <td>{{$company->inspected_by}}</td>
                            </tr>
                            <td>Last Inspected By</td>
                            <td>{{$company->inspected_by_designation}}</td>
                            </tr>

                            </tbody>
                        </table>

                        <a href="/company/edit/{{$company->company_id}}}" class="btn btn-primary">Edit</a>
                        <td class="txt-dark">
                            <a type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Inspect</a>
                        </td>
                        <td class="txt-dark">

                        </td>
                        <a href="/companylist" class="btn btn-primary">Back to List</a>
                    </div>
                </div>
            </div>

        </div>
        {{-- Tab Selection--}}
        @endforeach
        <div class="row">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#inspections">Inspections</a></li>
                <li><a data-toggle="tab" href="#ratings">Ratings</a></li>
                <li><a data-toggle="tab" href="#comments">Comments</a></li>

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
                                                <th>Designation</th>
                                                <th>Inspected Category</th>
                                                <th>Notes</th>
                                                <th></th>

                                            </tr>
                                            </thead>
                                            <tbody id="inspections_list">

                                            @foreach($inspections as $inspection)

                                                <tr>
                                                    <td class="txt-dark">{{$inspection->inspection_date}}</td>
                                                    <td class="txt-dark">{{$inspection->inspected_by}}</td>
                                                    <td class="txt-dark">{{$inspection->inspected_by_designation}}</td>
                                                    <td class="txt-dark">{{$inspection->current_category}}</td>
                                                    <td class="txt-dark">{{$inspection->notes}}</td>


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
        {{-- comments Tab--}}
        <div id="comments" class="tab-pane fade in ">
            <div class="col-sm-12">
                <div class="panel panel-default card-view">
                    <div class="panel-wrapper collapse in">
                        <div class="panel-body row">

                            <div class="table-wrap">

                                <div class="table-responsive">

                                    <div id="comments_table">

                                        <table id="commentsTable" class="HTMLtoPDF table display responsive product-overview mb-30 myTable">
                                            <thead>
                                            <tr>
                                                <th>Comment By</th>
                                                <th>Note</th>


                                            </tr>
                                            </thead>
                                            <tbody id="comments_list">

                                            @foreach($comments as $comment)

                                                <tr>
                                                    <td class="txt-dark">{{$comment->rate}}</td>
                                                    <td class="txt-dark">{{$comment->user_id}}</td>

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
                        <form class="form-content" id="inspection-form" action="/company/addinspection" method="post" enctype="multipart/form-data">
                            {{ csrf_field() }}


                            <input hidden name="form_company_id" id="form_company_id" value="{{$company->company_id}}">
                            <input hidden name="form_id" id="form_id" value="{{$company->id}}">

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="p_type">Inspection Date</label>
                                    <div class="input-group " data-provide="">
                                        <input required  id="form_inspection_date" name="form_inspection_date" type="text" class="form-control" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"  placeholder="yyyy-mm-dd">
                                        <div class="input-group-addon">
                                            <span class="glyphicon glyphicon-th"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="p_type">Select Category</label>
                                    <select required name="form_category" id="form_category">

                                        @foreach($categorys as $category)
                                            <option value="{{$category->title}}">{{$category->title}}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="title">Inspected By<span>* </span></label>
                                    <input required  type="text" name="form_inspected_by" id="form_inspected_by"   placeholder="Please enter inspected by">
                                    <label style="color: #fff;">{{$errors->first('inspected_by')}}</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="title">Designation<span>* </span></label>
                                    <input required  type="text" name="form_designation" id="form_designation"   placeholder="Please enter designation">
                                    <label style="color: #fff;">{{$errors->first('form_designation')}}</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="title">Note<span> </span></label>
                                    <textarea  rows="4" cols="50" name="form_notes" id="form_notes" maxlength="200"></textarea>
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


            <script src="{{ URL::asset('assets/js/company/companyDetails.js') }}"></script>

            <script>
                $(document).ready(function(){



                        $('#inspectionTable').dataTable();
                        $('#ratingsTable').dataTable();
                        $('#commentsTable').dataTable();




                    $.fn.datepicker.defaults.format = "yyyy-mm-dd";









                });
            </script>
@endsection



