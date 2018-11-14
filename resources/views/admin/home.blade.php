@extends('layouts.admin-layout')


@section('title', 'BFSA | Admin')


@section('content')

    <h1>Welcome {{ session()->get('admin.name')}}</h1>





@endsection