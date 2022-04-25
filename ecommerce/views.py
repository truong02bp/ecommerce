import math

from django.shortcuts import render, redirect
from rest_framework.decorators import api_view
from rest_framework.response import Response

from ecommerce.services.book_service import BookService
from ecommerce.services.cart_service import CartService
from ecommerce.services.laptop_service import LaptopService
from ecommerce.services.producer_service import ProducerService


def home(request):
    book_service = BookService.get_instance()
    books = book_service.find_limit(8)
    laptop_service = LaptopService.get_instance()
    laptops = laptop_service.find_limit(8)
    context = {'books': books, 'laptops': laptops}
    if request.user.is_authenticated:
        cart_service = CartService.getInstance()
        quantity_item = cart_service.count_item(request.user.id)
        context['quantity_item'] = quantity_item

    return render(request, 'index.html', context)


def laptop_detail(request, id=None):
    laptop_service = LaptopService.get_instance()
    laptop = laptop_service.find_by_id(id)
    laptops = laptop_service.find_limit(4)
    comments = laptop.item.comment_set
    context = {'laptop': laptop, 'laptops': laptops, 'comments': comments}
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

def cart(request):
    user = request.user
    if not user.is_authenticated:
        return redirect('login')
    cart_service = CartService.getInstance()
    cart = cart_service.find_by_user_id(user.id)
    context = {'cart': cart, 'cart_items': cart.cartitem_set.all(), 'quantity_item': cart.cartitem_set.count()}
    return render(request, 'cart.html', context)

@api_view(['POST'])
def add_to_cart(request):
    user = request.user
    if not user.is_authenticated:
        return Response(403)
    cart_service = CartService.getInstance()
    count = cart_service.add_to_cart(user.id, request.data['id'])
    return Response(count)


@api_view(['DELETE'])
def remove_from_cart(request):
    user = request.user
    cart_service = CartService.getInstance()
    count = cart_service.remove_from_cart(user.id, request.data['id'])
    return Response(count)


@api_view(['PUT'])
def update_quantity(request):
    cart_item_id = request.data['id']
    quantity = request.data['quantity']
    cart_service = CartService.getInstance()
    total_price = cart_service.update_quantity(cart_item_id, quantity)
    return Response(total_price)
