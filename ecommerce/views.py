from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response

from ecommerce.serializers import UserSerializer
from ecommerce.services.book_service import BookService
from ecommerce.services.laptop_service import LaptopService


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
    laptop_service = LaptopService.get_instance()
    laptops = laptop_service.find_all()
    context = {'laptops': laptops}
    return render(request, 'laptop.html', context)


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
