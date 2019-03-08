@extends('layouts.master')

@push('stylesheets')
    <link href="{{ mix('/css/app.css') }}" rel="stylesheet">
@endpush

@push('scripts')
    <script src="{{ mix('/js/manifest.js', 'assets/build') }}"></script>
    <script src="{{ mix('/js/vendor.js', 'assets/build') }}"></script>
    <script src="{{ mix('/js/app.js', 'assets/build') }}"></script>
@endpush
