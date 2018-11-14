@extends('layouts.admin-layout')

@section('title', 'BFSA | Category')


@section('content')

    <h1>Category List</h1>



    <br>
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

                                        <th>Restaurant Category</th>
                                        <th>Description</th>

                                    </tr>
                                    </thead>
                                    <tbody id="p_body">
                                    <div id="type_list">
                                        @foreach($categorys as $category)

                                            <tr>
                                                <td class="txt-dark">{{$category->title}}</td>
                                                <td class="txt-dark">{{$category->description}}</td>

                                                <td><a href="/category/edit/{{$category->id}}" class="btn btn-primary a-btn-slide-text">
                                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                        <span><strong>Edit</strong></span>
                                                    </a></td>
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



@endsection
