from django.db import models

from ecommerce.models.shippment_unit import ShipmentUnit


class Shipment(models.Model):
    status_list = [('pending', 'Pending'), ('shipping', 'Shipping'), ('processing', 'Processing')]
    price = models.FloatField()
    address = models.CharField(max_length=128)
    status = models.CharField(max_length=128, choices=status_list)
    shipment_unit = models.ForeignKey(ShipmentUnit, on_delete=models.CASCADE)
