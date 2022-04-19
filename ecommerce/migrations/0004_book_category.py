# Generated by Django 4.0.2 on 2022-04-19 14:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0003_author_publisher_book'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='category',
            field=models.ForeignKey(default=3, on_delete=django.db.models.deletion.CASCADE, to='ecommerce.category'),
            preserve_default=False,
        ),
    ]
