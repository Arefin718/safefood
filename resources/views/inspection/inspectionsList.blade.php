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
                                        <th>Next Inspection Date</th>
                                        <th>Company ID</th>
                                        <th>Company Category</th>
                                        <th>Inspected By</th>
                                        <th>Designation</th>
                                        <th>Note</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody id="p_body">
                                    <div id="type_list">
                                        @foreach($inspections as $inspection)

                                            <tr>
                                                <td class="txt-dark">{{$inspection->inspection_date}}</td>
                                                <td class="txt-dark">{{$inspection->next_inspection}}</td>
                                                <td class="txt-dark">{{$inspection->company_id}}</td>
                                                <td class="txt-dark">{{$inspection->company_quality}}</td>
                                                <td class="txt-dark">{{$inspection->inspected_by}}</td>
                                                <td class="txt-dark">{{$inspection->inspected_by_designation}}</td>
                                                <td class="txt-dark">{{$inspection->notes}}</td>

                                                <td><a href="/company/details/{{$inspection->company_id}}" class="btn btn-primary a-btn-slide-text">
                                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                        <span><strong>View Company</strong></span>
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
