from django.contrib import admin
from .models import User, Laptop, Category, Item, Producer, Publisher, Author, Book

admin.site.register(User)


class CategoryAdmin(admin.ModelAdmin):
    pass
    list_display = ['id', 'name', 'code']

    # pagination
    list_per_page = 10

    # search
    search_fields = ['name']

    # filter
    list_filter = ['code']


admin.site.register(Category, CategoryAdmin)


class ItemAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'description', 'price', 'discount', 'category', 'image']


admin.site.register(Item, ItemAdmin)


class LaptopAdmin(admin.ModelAdmin):
    list_display = ['id', 'item', 'producer', 'year_model']


admin.site.register(Laptop, LaptopAdmin)


class ProducerAdmin(admin.ModelAdmin):
    list_display = ['id', 'code', 'name']


admin.site.register(Producer, ProducerAdmin)


class PublisherAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'address']


admin.site.register(Publisher, PublisherAdmin)


class AuthorAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'description']


admin.site.register(Author, AuthorAdmin)


class BookAdmin(admin.ModelAdmin):
    list_display = ['id', 'author', 'publisher', 'item', 'category', 'page', 'language',
                    'title']


admin.site.register(Book, BookAdmin)
