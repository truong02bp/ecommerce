import math
from pyexpat.errors import messages

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import AnonymousUser
from django.shortcuts import render, redirect
from rest_framework.decorators import api_view
from rest_framework.response import Response

from ecommerce.serializers import UserRegisterSerializer, UserLoginSerializer
from ecommerce.services.book_service import BookService
from ecommerce.services.laptop_service import LaptopService
from ecommerce.services.producer_service import ProducerService


def home(request):
    book_service = BookService.get_instance()
    books = book_service.find_limit(8)
    laptop_service = LaptopService.get_instance()
    laptops = laptop_service.find_limit(8)
    context = {'books': books, 'laptops': laptops}
    return render(request, 'index.html', context)


def laptop_detail(request, id=None):
    laptop_service = LaptopService.get_instance()
    laptop = laptop_service.find_by_id(id)
    laptops = laptop_service.find_limit(4)
    context = {'laptop': laptop, 'laptops': laptops}
    return render(request, 'laptop.html', context)


def laptop_page(request):
    sort = request.GET.get('sort')
    page = int(request.GET.get('page'))
    limit = int(request.GET.get('limit'))
    producer = request.GET.get('producer')
    name = request.GET.get('name')
    if sort is None:
        sort = ''
    laptop_service = LaptopService.get_instance()
    laptops = laptop_service.find_by_producer_and_name(producer, name, page, limit, sort)
    most_products = laptop_service.find_limit(5)
    producers = ProducerService.get_instance().find_all()
    total_page = int(math.ceil(laptop_service.count() / limit))
    model = {'sort': sort, 'page': page, 'limit': limit, 'total_page': total_page}
    if producer is not None:
        model['producer'] = producer
    if name is not None:
        model['name'] = name
    print(total_page)
    context = {'laptops': laptops, 'producers': producers, 'most_products': most_products, 'model': model}
    return render(request, 'item.html', context)


def book_detail(request, id=None):
    book_service = BookService.get_instance()
    book = book_service.find_by_id(id)
    books = book_service.find_limit(4)
    context = {'book': book, 'books': books}
    return render(request, 'laptop.html', context)


def book_page(request):
    book_service = BookService.get_instance()
    books = book_service.find_all()
    context = {'books': books}
    return render(request, 'laptop.html', context)


def login_page(request):
    context = {}
    return render(request, 'login.html', context)


def register(request):
    context = {}
    return render(request, 'register.html', context)


def cart(request):
    user = request.user
    if not user.is_authenticated:
        return redirect('login')
    context = {}
    return render(request, 'cart.html', context)


@api_view(['POST'])
def create_user(request):
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
    return redirect('home')


def logout_request(request):
    logout(request)
    return redirect('home')
