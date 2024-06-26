# Generated by Django 4.1.13 on 2024-02-10 07:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0005_alter_user_table'),
    ]

    operations = [
        migrations.CreateModel(
            name='admin',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Username', models.CharField(max_length=50)),
                ('Password', models.CharField(max_length=50)),
                ('Name', models.CharField(default='unknown', max_length=50)),
                ('Role', models.CharField(default='admin', max_length=50)),
            ],
            options={
                'db_table': 'admin',
            },
        ),
        migrations.RemoveField(
            model_name='user',
            name='Name',
        ),
        migrations.RemoveField(
            model_name='user',
            name='Password',
        ),
        migrations.RemoveField(
            model_name='user',
            name='Role',
        ),
        migrations.RemoveField(
            model_name='user',
            name='Username',
        ),
        migrations.AddField(
            model_name='user',
            name='Eng_name',
            field=models.CharField(default='unknow', max_length=255),
        ),
        migrations.AddField(
            model_name='user',
            name='Folder_img_path',
            field=models.CharField(default='/', max_length=255),
        ),
        migrations.AddField(
            model_name='user',
            name='TH_name',
            field=models.CharField(default='unknow', max_length=255),
        ),
        migrations.AlterModelTable(
            name='user',
            table='user',
        ),
    ]
