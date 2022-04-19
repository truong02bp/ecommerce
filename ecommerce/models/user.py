from django.db import models


class User(models.Model):
    name = models.CharField(max_length=512)
    email = models.EmailField(max_length=128)
    phone = models.CharField(max_length=12)
    address = models.CharField(max_length=128)
    username = models.CharField(max_length=128)
    password = models.CharField(max_length=128)
