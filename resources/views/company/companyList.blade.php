@extends('layouts.admin-layout')


@section('title', 'BFSA | Admin')
<link rel="stylesheet" href="{{ URL::asset('assets/css/normalize.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assets/css/form-styles.css') }}">

@section('content')

    <h1>Company List</h1>


    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default card-view">
                <div class="panel-wrapper collapse in">
                    <div class="panel-body row">
                        <div class="table-wrap">
                            <div class="table-responsive">
                                <table class="table display responsive product-overview mb-30" id="myTable">
                                    <thead>
                                    <tr>
                                        <th>Company ID</th>
                                        <th>Name</th>
                                        <th>Address</th>
                                        <th>Owner Name</th>
                                        <th>Owner Contact</th>
                                        <th>{{--Details--}}</th>
                                        <th>{{--Edit--}}</th>
                                        <th>{{--Block--}}</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    @foreach($companys as $company)

                                        <tr>
                                            <td class="txt-dark">{{$company->company_id}}</td>
                                            <td class="txt-dark" >{{$company->title_english}}</td>
                                            <td class="txt-dark">{{$company->location_english}}</td>

                                            <td class="txt-dark">{{$company->owner_name}}</td>

                                            <td class="txt-dark">{{$company->owner_contact_number}}</td>

                                            <td><a href="/company/details/{{$company->company_id}}" class="btn btn-primary a-btn-slide-text">
                                                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                                    <span><strong>View</strong></span>
                                                </a></td>

                                            <td><a href="/company/edit/{{$company->id}}" class="btn btn-primary a-btn-slide-text">
                                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                    <span><strong>Edit</strong></span>
                                                </a></td>



                                            <td>
                                                <div class="toggle">
                                                        <span class="mid">
                                                            <label class="switch">
                                                                @if($company->status==1)
                                                                    <input type="checkbox" checked id="feature" onclick="changeStatus({{$company->id}})">
                                                                @else
                                                                    <input type="checkbox" id="feature" onclick="changeStatus({{$company->id}})">

                                                                @endif
                                                                <span class="slider round"></span>
                                                            </label>
                                                        </span>
                                                </div>
                                            </td>
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

@endsection
@section('scripts')
    <script src="{{asset('vendors/bower_components/datatables/media/js/jquery.dataTables.min.js')}}"></script>
    <script src="{{ URL::asset('assets/js/company/companyList.js') }}"></script>

@endsection