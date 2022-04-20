from django.db import models

from .category import Category


class Item(models.Model):
    name = models.CharField(max_length=512)
    description = models.TextField()
    price = models.FloatField()
    discount = models.FloatField()
    quantity = models.IntegerField()
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='uploads/images/')

    def __str__(self):
        return "".join([str(self.id) + " - " + str(self.name) + " - " + str(self.price)])

    def price_before(self):
        return self.price*(100 + self.discount)/100


