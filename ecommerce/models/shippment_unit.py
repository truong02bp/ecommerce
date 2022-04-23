from django.db import models


class ShipmentUnit(models.Model):
    name = models.CharField(max_length=128)
    status = models.CharField(max_length=128)

    class Meta:
        db_table = 'ecommerce_shipment_unit'
