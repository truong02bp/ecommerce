from django.db import models


class Shipment(models.Model):
    status_list = [('pending', 'Pending'), ('shipping', 'Shipping'), ('processing', 'Processing')]
    price = models.FloatField()
    address = models.CharField(max_length=128)
    status = models.CharField(max_length=128, choices=status_list)
