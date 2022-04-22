from django.db import models

from ecommerce.models import User


class Address(models.Model):
    number = models.CharField(null=True, max_length=128)
    street = models.CharField(null=True, max_length=128)
    distinct = models.CharField(null=True, max_length=128)
    city = models.CharField(null=True, max_length=128)
    description = models.CharField(max_length=1024)
    phone = models.CharField(max_length=20)
    name = models.CharField(max_length=256)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
