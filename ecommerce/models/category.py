from django.db import models


class Category(models.Model):
    code = models.CharField(max_length=128)
    name = models.CharField(max_length=512)

    def __str__(self):
        return "".join([str(self.id), " - ", str(self.code)])



