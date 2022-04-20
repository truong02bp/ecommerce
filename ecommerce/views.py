import math

from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response

from ecommerce.serializers import UserSerializer
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
