from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    name = models.CharField(max_length=256)
    phone = models.CharField(max_length=12)
    address = models.CharField(max_length=128)
    image = models.ImageField(upload_to='uploads/images/', null=True)
