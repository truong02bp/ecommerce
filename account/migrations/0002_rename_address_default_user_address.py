# Generated by Django 4.0.2 on 2022-04-25 15:50

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='address_default',
            new_name='address',
        ),
    ]