@extends('layouts.master')

@push('stylesheets')
    <link href="{{ mix('/css/app.css') }}" rel="stylesheet">
@endpush

@push('scripts')
    <script src="{{ mix('/js/manifest.js') }}"></script>
    <script src="{{ mix('/js/vendor.js') }}"></script>
    <script src="{{ mix('/js/app.js') }}"></script>
@endpush

@section('body-classes', 'font-sans leading-normal antialiased')
