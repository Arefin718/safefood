@extends('layouts.admin-layout')


@section('title', 'BFSA | Admin')


@section('content')

    <h1>Admin List</h1>




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
                                        <th>Admin Name</th>
                                        <th>Email</th>
                                        <th>Contact</th>
                                        <th>Join Date</th>
                                        <th>Last Login</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    @foreach($admins as $admin)

                                        <tr>
                                            <td class="txt-dark">{{$admin->name}}</td>
                                            <td class="txt-dark">{{$admin->email}}</td>
                                            <td class="txt-dark">{{$admin->contact_number}}</td>

                                            <td>{{$admin->created_at}}</td>
                                            <td>{{$admin->last_login}}</td>
                                            <td><a href="#">Details</a></td>
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
    <script src="{{asset('/assets/js/admin/adminList.js')}}"></script>

    @endsection