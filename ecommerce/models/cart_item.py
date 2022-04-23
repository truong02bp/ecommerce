from django.db import models

from ecommerce.models import Item
from ecommerce.models.cart import Cart


class CartItem(models.Model):
    quantity = models.IntegerField()
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)

    def total_price(self):
        return int(self.quantity) * self.item.price

    class Meta:
        db_table = 'ecommerce_cart_item'
