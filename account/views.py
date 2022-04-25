from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect

# Create your views here.
from rest_framework.decorators import api_view
from rest_framework.response import Response

from account.serializers import UserRegisterSerializer


def login_page(request):
    context = {}
    return render(request, 'login.html', context)


@api_view(['POST'])
def create_user(request):
    print(request.data)
    serializer = UserRegisterSerializer(data=request.data)
    if serializer.is_valid():
        instance = serializer.save()
        instance.set_password(instance.password)
        instance.save()
    return Response(serializer.data)


def check_login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(request, username=username, password=password)
    if user is not None:
        login(request, user)
    else:
        context = {'message': "Login failure"}
        return render(request, 'login.html', context)
    return redirect('home')


def logout_request(request):
    logout(request)
    return redirect('home')


def register(request):
    context = {}
    return render(request, 'register.html', context)
