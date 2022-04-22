from django.db import models

from ecommerce.models import User


class Cart(models.Model):
    total_money = models.FloatField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
