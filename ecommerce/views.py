from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response

from ecommerce.models import user
from ecommerce.serializers import UserSerializer


def home(request):
    context = {}
    return render(request, 'index.html', context)


def products(request):
    context = {}
    return render(request, 'products.html', context)


def about(request):
    context = {}
    return render(request, 'about.html', context)


def contact(request):
    context = {}
    return render(request, 'contact.html', context)


def login(request):
    context = {}
    return render(request, 'login.html', context)


def register(request):
    context = {}
    return render(request, 'register.html', context)


@api_view(['GET'])
def get_user(request):
    users = User.objects.all()
    serializer = UserSerializer(users, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def create_user(request):
    serializer = UserSerializer(data=request.data)
    if serializer.is_valid():
        serializer.set_password(serializer.password)
        serializer.save()
    return Response(serializer.data)
