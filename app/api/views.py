from django.shortcuts import render

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from django.views import View


@csrf_exempt
def home(request):
    return JsonResponse({"message": "Hello, World!"})


@csrf_exempt
def greet(request):
    name = request.GET.get('name', 'Guest')
    return JsonResponse({"message": f"Hello, {name}!"})
