from django.db import models


class Producer(models.Model):
    name = models.CharField(max_length=128)
    code = models.CharField(max_length=128)

    def __str__(self):
        return "".join([str(self.id) + " - " + str(self.name)])
