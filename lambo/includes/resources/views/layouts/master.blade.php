<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>@yield('title', config('app.name'))</title>

        @stack('meta')
        @stack('stylesheets')
        @stack('head-scripts')
    </head>

    <body @hasSection('body-classes')class="@yield('body-classes')"@endif>
        <div id="app">
            @stack('pre-content')
            @yield('content')
            @stack('post-content')
        </div>

        @stack('pre-scripts')
        @stack('scripts')
        @stack('post-scripts')
    </body>
</html>
