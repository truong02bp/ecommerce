
from django.urls import path
from ecommerce import views

urlpatterns = [
    path('', views.home, name = 'home'),
    path('login', views.login_page, name = 'login'),
    path('register', views.register, name = 'register'),
    path('laptop/<int:id>', views.laptop_detail, name = 'laptop'),
    path('laptop', views.laptop_page, name = 'laptop-page'),
    path('cart', views.cart, name = 'cart'),
    path('logout', views.logout_request, name = 'logout'),


    path('api/user/create', views.create_user, name = 'create'),
    path('api/authenticate', views.check_login, name = 'authenticate'),
    path('api/cart/add', views.add_to_cart, name = 'add-to-cart'),
    path('api/cart/remove', views.remove_from_cart, name = 'remove-from-cart'),
    path('api/cart/update', views.update_quantity, name = 'update-quantity')
]