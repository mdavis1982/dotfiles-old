@extends('_layouts.admin')

@section('content')
    <div class="h-screen flex flex-col">
        <header class="bg-gray-800 px-8 py-6 text-white text-sm flex justify-end">
            <form id="logout-form" action="{{ route('logout') }}" method="POST">
                @csrf

                <button type="submit" class="font-semibold">{{ __('Logout') }}</button>
            </form>
        </header>

        <div class="flex-1 flex flex-col items-center justify-center">
            <h1 class="font-thin text-2xl">Dashboard</h1>
            <p class="text-sm font-thin">You are logged in.</p>
        </div>
    </div>
@endsection
