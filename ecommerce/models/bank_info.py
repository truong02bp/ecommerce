from django.db import models

from ecommerce.models import User


class BankInfo(models.Model):
    number = models.CharField(max_length=128)
    name = models.CharField(max_length=128)
    date = models.DateTimeField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
