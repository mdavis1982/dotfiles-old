@extends('_layouts.app')

@section('content')
    <div class="h-screen flex flex-col items-center justify-center bg-gray-200">
        <h1 class="text-gray-800 font-thin text-2xl">{{ __('Verify Your Email Address') }}</h1>

        <div class="mt-4 px-4 py-4 w-5/6 lg:w-1/4 bg-white border-t-8 border-teal-500 rounded-lg shadow-lg">
            @if (session('resent'))
                <div class="px-4 py-4 mb-4 text-center text-sm text-teal-900 font-semibold bg-teal-100 rounded-lg border border-teal-200" role="alert">
                    {{ __('A fresh verification link has been sent to your email address.') }}
                </div>
            @endif

            <div class="mb-4 text-center text-sm text-gray-900 font-semibold">
                {{ __('Before proceeding, please check your email for a verification link.') }}
                {{ __('If you did not receive the email') }},
            </div>

            <form method="POST" action="{{ route('verification.resend') }}">
                @csrf

                <div class="flex items-center justify-center">
                    <button type="submit" class="px-4 py-2 bg-teal-500 text-teal-100 rounded-lg font-semibold text-sm hover:bg-teal-600">
                        {{ __('click here to request another') }}
                    </button>
                </div>
            </form>
        </div>
    </div>
@endsection
