from django.db import models

from ecommerce.models.bank_info import BankInfo


class Payment(models.Model):
    status = models.CharField(max_length=128)
    time = models.IntegerField()
    bank_info = models.ForeignKey(BankInfo, on_delete=models.CASCADE)
