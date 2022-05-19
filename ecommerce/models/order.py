from django.db import models

from ecommerce.models import User, CartItem
from ecommerce.models.payment import Payment
from ecommerce.models.shipment import Shipment


class Order(models.Model):
    status_list = [('pending', 'Pending'), ('confirmed', 'Confirmed'), ('processing', 'Processing')]
    date_created = models.DateTimeField(auto_created=True, auto_now=True)
    status = models.CharField(max_length=128, choices=status_list)
    total_money = models.FloatField()
    shipment = models.ForeignKey(Shipment, on_delete=models.CASCADE)
    payment = models.ForeignKey(Payment, on_delete=models.CASCADE, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    cart_items = models.ManyToManyField(CartItem)
