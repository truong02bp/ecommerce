from django.urls import path
from account import views
urlpatterns = [
    path('login', views.login_page, name = 'login'),
    path('api/authenticate', views.check_login, name = 'authenticate'),
    path('api/user/create', views.create_user, name = 'create'),
    path('logout', views.logout_request, name = 'logout'),
    path('register', views.register, name = 'register')
]