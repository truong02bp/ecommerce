
from django.urls import path
from ecommerce import views

urlpatterns = [
    path('', views.home, name = 'home'),
    path('products', views.products, name = 'products'),
    path('contact', views.contact, name = 'contact'),
    path('about', views.about, name = 'about'),
    path('login', views.login, name = 'login'),
    path('register', views.register, name = 'register'),
    path('api/user/create', views.create_user, name = 'create'),
    path('api/user/get', views.get_user, name = 'get-user')
]