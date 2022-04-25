from django.contrib import admin

# Register your models here.
from django.contrib import admin

from ecommerce.models import User


class UserAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'email']
    pass


admin.site.register(User, UserAdmin)
