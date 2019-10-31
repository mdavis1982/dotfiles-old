@extends('_layouts.app')

@section('content')
    <div class="h-screen flex flex-col items-center justify-center bg-gray-200">
        <h1 class="text-gray-800 font-thin text-2xl">{{ __('Confirm Password') }}</h1>

        <div class="mt-4 px-4 py-4 w-5/6 lg:w-1/4 bg-white border-t-8 border-teal-500 rounded-lg shadow-lg">
            <div class="mb-4 text-center text-sm text-gray-900 font-semibold">
                {{ __('Please confirm your password before continuing.') }}
            </div>

            <form method="POST" action="{{ route('password.confirm') }}">
                @csrf

                <input type="hidden" name="token" value="{{ $token }}">

                <div class="flex flex-col justify-center">
                    <label for="password" class="text-gray-800 font-semibold text-sm">{{ __('Password') }}</label>

                    <input id="password" type="password" class="mt-2 border rounded-lg px-2 py-2 bg-gray-100 focus:outline-none focus:border-teal-500 @error('password') border-red-200 bg-red-100 @enderror" name="password" required autocomplete="current-password">

                    @error('password')
                        <span class="mt-2 text-sm text-red-600" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="mt-4 flex items-center justify-center">
                    <button type="submit" class="px-4 py-2 bg-teal-500 text-teal-100 rounded-lg font-semibold text-sm hover:bg-teal-600">
                        {{ __('Confirm Password') }}
                    </button>
                </div>
            </form>
        </div>

        @if (Route::has('password.request'))
            <a class="mt-8 font-medium text-sm text-gray-800 hover:text-gray-600" href="{{ route('password.request') }}">
                {{ __('Forgot Your Password?') }}
            </a>
        @endif
    </div>
@endsection
