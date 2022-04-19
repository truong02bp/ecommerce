from django.db import models

from .item import Item
from .producer import Producer


class Laptop(models.Model):
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    producer = models.ForeignKey(Producer, on_delete=models.CASCADE)
    year_model = models.IntegerField()

    def __str__(self):
        return "".join([str(self.id) + " - " + str(self.item.name)])
