# Generated by Django 4.1.13 on 2024-02-11 16:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0007_text_mood_type_mood'),
    ]

    operations = [
        migrations.CreateModel(
            name='Face_detect',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('big_img_path', models.CharField(default='./big_img/', max_length=255)),
                ('small_img_path', models.CharField(default='./small_img/', max_length=255)),
                ('date', models.CharField(default='', max_length=255)),
                ('time', models.CharField(default='', max_length=255)),
                ('Eng_name', models.CharField(default='', max_length=255)),
                ('mood_type', models.CharField(default='', max_length=255)),
            ],
            options={
                'db_table': 'Face_detect',
            },
        ),
    ]