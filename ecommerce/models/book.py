from django.db import models

from ecommerce.models import Item, Category
from ecommerce.models.author import Author
from ecommerce.models.publisher import Publisher


class Book(models.Model):
    languages = [('en', 'English'), ('vn', 'Vietnamese')]
    author = models.ForeignKey(Author, on_delete=models.CASCADE)
    publisher = models.ForeignKey(Publisher, on_delete=models.CASCADE)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    page = models.IntegerField()
    language = models.CharField(max_length=3, choices=languages)
    title = models.CharField(max_length=512)

    def __str__(self):
        return "".join([str(self.id), " - ", str(self.title)])
