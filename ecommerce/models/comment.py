
from django.db import models

from ecommerce.models import User, Item


class Comment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    content = models.CharField(max_length=5012)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    reply_to = models.ForeignKey("self", on_delete=models.CASCADE, null=True, blank=True)
    date = models.DateTimeField(auto_created=True, null=True, blank=True)
    image = models.ImageField(upload_to='uploads/images/', null=True, blank=True)

