from django.db import models


class Author(models.Model):
    name = models.CharField(max_length=256)
    description = models.CharField(max_length=512, null=True)

    def __str__(self):
        return "".join([str(self.id), " - ", str(self.name)])
