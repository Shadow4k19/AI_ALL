from django.db import models

class admin(models.Model):
    Username = models.CharField(max_length = 50)
    Password = models.CharField(max_length = 50)
    Name = models.CharField(max_length = 50, default='unknown') 
    Role = models.CharField(max_length = 50, default='admin')

    def __str__(self):
        return self.name
    class Meta:
        db_table = 'admin'

class user_db(models.Model):
    TH_name = models.CharField(max_length = 255, default = 'unknow')
    Eng_name = models.CharField(max_length = 255, default = 'unknow')
    Folder_img_path = models.CharField(max_length = 255, default = '/')
    def __str__(self):
        return self.name
    class Meta:
        db_table = 'user'

class text_mood(models.Model):
    mood_text = models.CharField(max_length = 255, default = 'unknow')
    mood_type = models.CharField(max_length = 255, default = 'Happy')
    def __str__(self):
        return self.name
    class Meta:
        db_table = 'Text_mood'

class type_mood(models.Model):
    mood_type = models.CharField(max_length = 255 , default = 'Happy')
    mood_type_path = models.CharField(max_length = 255, default = '')
    def __str__(self):
        return self.name
    class Meta:
        db_table = 'Type_mood'

class Face_detect(models.Model):
    big_img_path = models.CharField(max_length = 255 , default = './big_img/')
    small_img_path = models.CharField(max_length = 255 , default = './small_img/')
    date = models.DateField(default=None, null=True)
    time = models.TimeField(default=None, null=True)
    Eng_name = models.CharField(max_length = 255, default = '')
    mood_type = models.CharField(max_length = 255 , default = '')
    def __str__(self):
        return self.name
    class Meta:
        db_table = 'Face_detect'

