from django.db import models


class Publisher(models.Model):
    name = models.CharField(max_length=512)
    address = models.CharField(max_length=512)

    def __str__(self):
        return "".join([str(self.id), " - ", self.name])


