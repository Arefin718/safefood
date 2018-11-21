@extends('layouts.admin-layout')

@section('title', 'BFSA | Category')


@section('content')

    <h1>Inspection List</h1>

    <br>
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default card-view">
                <div class="panel-wrapper collapse in">
                    <div class="panel-body row">
                        <div class="table-wrap">
                            <div class="table-responsive">
                                <table class="inspection_table table display responsive product-overview mb-30" id="myTable">
                                    <thead>
                                    <tr>
                                        <th>Inspection Date</th>
                                        <th>Restaurant ID</th>
                                        <th>Restaurant Category</th>
                                        <th>Inspected By</th>
                                    </tr>
                                    </thead>
                                    <tbody id="p_body">
                                    <div id="type_list">
                                        @foreach($inspections as $inspection)

                                            <tr>
                                                <td class="txt-dark">{{$inspection->inspection_date}}</td>
                                                <td class="txt-dark">{{$inspection->restaurant_id}}</td>
                                                <td class="txt-dark">{{$inspection->current_category}}</td>
                                                <td class="txt-dark">{{$inspection->inspected_by}}</td>


                                                <td><a href="#" class="btn btn-danger a-btn-slide-text">
                                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                        <span><strong>Remove</strong></span>
                                                    </a></td>




                                        @endforeach
                                    </div>
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
<script>
    $(document).ready(function(){
        $('.inspection_table').dataTable();
    });
</script>

@endsection
