# serializers.py
from rest_framework import serializers
from .models import admin,user_db,text_mood,type_mood,Face_detect

class AdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = admin
        fields = ['id', 'Username', 'Password', 'Name', 'Role']

class UserSeriallizer(serializers.ModelSerializer):
    class Meta:
        model = user_db
        fields = ['id','TH_name','Eng_name','Folder_img_path']

class Text_moodSeriallizer(serializers.ModelSerializer):
    class Meta:
        model = text_mood
        fields = ['id','mood_text','mood_type']

class Text_typeSeriallizer(serializers.ModelSerializer):
    class Meta:
        model = type_mood 
        fields = ['id','mood_type','mood_type_path']

class face_detectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Face_detect
        fields = ['id','Eng_name','mood_type','big_img_path','small_img_path','date','time']