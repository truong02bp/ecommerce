from django.db import models

from ecommerce.models import User


class Information(models.Model):
    address = models.CharField(max_length=1024)
    phone = models.CharField(max_length=20)
    name = models.CharField(max_length=256)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return "".join([self.name, ' - ', self.phone, " - ", self.address])
