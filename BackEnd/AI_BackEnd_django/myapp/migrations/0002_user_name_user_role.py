# Generated by Django 4.1.13 on 2024-02-07 16:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='name',
            field=models.CharField(default='unknown', max_length=50),
        ),
        migrations.AddField(
            model_name='user',
            name='role',
            field=models.CharField(default='admin', max_length=50),
        ),
    ]