from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import AdminSerializer, UserSeriallizer, Text_moodSeriallizer, Text_typeSeriallizer, face_detectSerializer
from .models import admin, user_db, text_mood, type_mood, Face_detect
import cv2
import numpy as np
from keras.models import model_from_json, load_model
from keras_facenet import FaceNet
from django.http import HttpResponse
from tensorflow.keras.models import load_model
from sklearn.preprocessing import LabelEncoder
from django.shortcuts import get_object_or_404
from django.conf import settings
import os
from django.core.files.storage import default_storage
import random
from datetime import datetime
import shutil



class LoginView(APIView):
    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')

        if username and password:
            try:
                user = admin.objects.get(Username=username)
                if user.Password == password:
                    return JsonResponse({'message': 'Login successful'}, status = status.HTTP_200_OK)
                else:
                    return JsonResponse({'message': 'Wrong password'}, status = status.HTTP_400_BAD_REQUEST)
            except admin.DoesNotExist:
                return JsonResponse({'message': 'Wrong username'}, status = status.HTTP_404_NOT_FOUND)
        else:
            return JsonResponse({'message': 'Both username and password are required and cannot be empty'}, status = status.HTTP_404_NOT_FOUND)

class Adminconfig(APIView):
    def get(self, request,format=None):
        username = request.data.get('Username')
        if(not username):
            username = request.query_params.get('user')
        name = request.data.get('Name')
        if not username and not name:
            users = admin.objects.all()
        elif not username and name:
            users = admin.objects.filter(Name = name)
        elif username and not name:
            users = admin.objects.filter(Username = username)
        else:
            users = admin.objects.filter(Username = username, Name = name)

        serializer = AdminSerializer(users, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        username = request.data.get('username')
        data = request.data.get('data')
        if admin.objects.filter(Username=username).exists():
            return Response({'error': 'Username already exists.'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            data_to_save = {
                'Username':username,
                **data
            }
            print(data_to_save)
            serializer = AdminSerializer(data=data_to_save)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, format=None):
        username = request.data.get('Username')
        print(username)
        data = request.data.get('data')
        try:
            user = admin.objects.get(id = data['id'])
            data_to_save = {
                'Username':username,
                **data
            }
            print(data_to_save)
            serializer = AdminSerializer(user,data=data_to_save)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except admin.DoesNotExist:
            return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)

    def delete(self, request, format=None):
        id = request.data.get('id')
        try:
            user = admin.objects.get(id=id)
            user.delete()
            return Response({"message":"Delete Complete"},status=status.HTTP_200_OK)
        except admin.DoesNotExist:
                return Response("User not found", status=status.HTTP_404_NOT_FOUND)

class UserConfig(APIView):
    def get(self,request,format = None):
        eng_name = request.query_params.get("Eng_name")
        id = request.query_params.get("id")
        if eng_name is not None:
            try:
                if eng_name == "":    
                    User = user_db.objects.all()
                else:
                    User = user_db.objects.filter(Eng_name = eng_name)
                User_serializer = UserSeriallizer(User,many = True)
                return Response(User_serializer.data)
            except Exception as e:
                return Response(massage = str(e) , status = status.HTTP_400_BAD_REQUEST)
        elif id is not None:
            try:
                User = user_db.objects.filter(id = id)
                User_serializer = UserSeriallizer(User,many = True)
                return Response(User_serializer.data)
            except Exception as e:
                return Response(massage = str(e) , status = status.HTTP_400_BAD_REQUEST)
    def post(self, request, format=None):
        TH_name = request.data.get('TH_name')
        EN_name = request.data.get('Eng_name')
        save_path = f'/img/{EN_name}/'
        folder_path = f'{settings.STATICFILES_DIRS[1]}/{EN_name}/'
        try:
            User = user_db.objects.filter(TH_name = TH_name , Eng_name = EN_name)
            if not User:
                if not os.path.exists(folder_path):
                    os.makedirs(folder_path)     
                
                image_file = request.FILES.get('img')
                image_name = EN_name + "_1.jpg"
                print(image_name)
                if image_file:
                    file_path = os.path.join(folder_path, image_name)
                    with default_storage.open(file_path, 'wb') as destination:
                        for chunk in image_file.chunks():
                            destination.write(chunk)

                data_to_save = {
                    'TH_name': TH_name,
                    'Eng_name': EN_name,
                    'Folder_img_path': save_path,
                }
                User_seriallizer = UserSeriallizer(data=data_to_save)
                
                if User_seriallizer.is_valid():
                    User_seriallizer.save()
                    return Response({'message': 'User created successfully'}, status=status.HTTP_201_CREATED)
                else:
                    return Response({'error': 'Invalid request method'}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({'error':'User already exist'},status = status.HTTP_400_BAD_REQUEST)       
        except BrokenPipeError:
            print("Broken Pipe Error: Client disconnected unexpectedly.")
            return Response({'error': 'Client disconnected unexpectedly'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        
        except Exception as e:
            print(f"Error: {e}")
            return Response({'error': 'Internal server error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    def put(self,request,format = None):
        idx = request.data.get('id')
        image = request.FILES.get('image')
        EN_name = request.data.get('Eng_name')
        path = request.data.get('Folder_img_path')
        try:
            users = user_db.objects.get(id = idx)
            User_serializer = UserSeriallizer(users, data=request.data)
            if User_serializer.is_valid():
                User_serializer.save()
                if image is not None:
                    count_file_path = str(settings.STATICFILES_DIRS[0] + path.replace('/', '\\'))
                    file_count = len(os.listdir(count_file_path)) + 1
                    image_name = EN_name + "_" + str(file_count) + ".jpg"
                    img_path = str(count_file_path + image_name)
                    with open(img_path, 'wb') as destination:
                        for chunk in image.chunks():
                            destination.write(chunk)   
                return Response(User_serializer.data)
            else:
                return Response(User_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except user_db.DoesNotExist:
            return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)

        
    def delete(self, request, format=None):
        id = request.data.get('id')
        EN_name = request.data.get('Eng_name')
        try:
            users = user_db.objects.get(id=id)
            users.delete()
            folder_path = f'{settings.STATICFILES_DIRS[0]}/img/{EN_name}/'
            if os.path.exists(folder_path):
                shutil.rmtree(folder_path)
            return Response({"message":"Delete Complete"}, status=status.HTTP_200_OK)
        except user_db.DoesNotExist:
                return Response("User not found", status=status.HTTP_404_NOT_FOUND)
        
class Text_moodConfig(APIView):
    def get(self,request, format = None):
        id = request.query_params.get('id')
        mood_text = request.query_params.get('mood_text')
        mood_type = request.query_params.get('mood_type')
        if(id is None):
            if mood_text == "" and mood_type == "All":
                text = text_mood.objects.all()
            elif mood_text != "" and mood_type != "" and mood_type != "All":
                text = text_mood.objects.filter(mood_text=mood_text, mood_type=mood_type)
            elif mood_text != "" and (mood_type == "" or mood_type == "All"):
                text = text_mood.objects.filter(mood_text=mood_text)
            else:
                text = text_mood.objects.filter(mood_type=mood_type)
        else:
            text = text_mood.objects.filter(id = id)

        text_serializer = Text_moodSeriallizer(text, many=True)
        return Response(text_serializer.data)   

    def post(self,request,format = None):
        try:
            text_seriallizer = Text_moodSeriallizer(data = request.data)
            if text_seriallizer.is_valid():
                text_seriallizer.save()
                return Response(text_seriallizer.data, status=status.HTTP_201_CREATED)
            else:
                return Response(text_seriallizer.errors, status=status.HTTP_400_BAD_REQUEST)
        except request.data is None:
            return Response(massage = "Don't have data", status = status.HTTP_404_NOT_FOUND)
    def put(self,request,format = None):
        idx = request.data.get('id')
        try:
            text = text_mood.objects.get(id=idx)
        except text_mood.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        text_serializer = Text_moodSeriallizer(text, data=request.data)
        if text_serializer.is_valid():
            text_serializer.save()
            return Response(text_serializer.data)
        else:
            return Response(text_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def delete(self,request,format = None):
        idx = request.data.get('id')
        try:
            texts = text_mood.objects.filter(id = idx)
            texts.delete()
            print("DELETE")
            return Response({"Message":"Delete Complete" },status=status.HTTP_200_OK)
        except text_mood.DoesNotExist:
            print("CAN'T DELETE")
            return Response("Text not found", status=status.HTTP_404_NOT_FOUND)
        
class Text_typeConfig(APIView):
    def get(self,request,format = None):
        type = request.data.get('mood_type')
        try:
            if type is None:
                types = type_mood.objects.all()
            else:
                types = type_mood.objects.filter(mood_type = type)
            type_seriallizer = Text_typeSeriallizer(types,many = True)
            return Response(type_seriallizer.data)
        except Exception as e:
            return Response(str(e) , status=status.HTTP_404_NOT_FOUND)
    def post(self, request, format=None):
        print(request.data)
        try:
            mood_serializer = Text_typeSeriallizer(data=request.data)
            if mood_serializer.is_valid():
                mood_serializer.save()
                return Response(mood_serializer.data, status=status.HTTP_201_CREATED)
            else:
                return Response(mood_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    def put(self, request, format=None):
        idx = request.data.get('id')
        try:
            type_data = get_object_or_404(type_mood, id = idx)
            type_serializer = Text_typeSeriallizer(type_data, data=request.data)
            if type_serializer.is_valid():
                type_serializer.save()
                return Response(type_serializer.data)
            else:
                return Response(type_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except type_mood.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
    def delete(self,request,format = None):
        idx = request.data.get('id')
        try:
            mood_type = type_mood.objects.filter(id = idx)
            mood_type.delete()
            return Response(status = status.HTTP_204_NO_CONTENT)
        except type_mood.DoesNotExist:
            return Response(status = status.HTTP_404_NOT_FOUND)

class face_detect(APIView):
    def get(self, request, format=None):
        try:
            eng_name = request.query_params.get("Eng_name")
            date_search = request.query_params.get("date")
            time_start = request.query_params.get("time_start")
            time_end = request.query_params.get("time_end")
            if eng_name == "" and date_search == "" and time_start == "" and time_end == "":
                data = Face_detect.objects.all()
            elif eng_name != "":
                data = Face_detect.objects.filter(Eng_name = eng_name)
            elif  date_search != "":
                data = Face_detect.objects.filter(date = date_search)
            elif time_start != "" and time_end  != "":
                data = Face_detect.objects.filter(time__gte=time_start, time__lte=time_end)
            else:
                data = Face_detect.objects.filter(Eng_name = eng_name,date = date_search,time__gte=time_start, time__lte=time_end)
            data_serializer = face_detectSerializer(data , many = True)
            return Response(data_serializer.data, status = status.HTTP_200_OK)
        except Exception as e:
            return Response(str(e) , status = status.HTTP_404_NOT_FOUND)

    def post(self,request,format = None):
        try:
            image_file = request.FILES.get("image")
            if image_file is None:
                try:
                    eng_name = request.data.get("Eng_name")
                    date_search = request.data.get("date")
                    time_start = request.data.get("time_start")
                    time_end = request.data.get("time_end")
                    if eng_name == "" and date_search == "" and time_start == "" and time_end == "":
                        data = Face_detect.objects.all()
                    elif eng_name != "" and date_search != "" and time_start != "" and time_end != "":
                        data = Face_detect.objects.filter(Eng_name = eng_name,date = date_search,time__gte=time_start, time__lte=time_end)
                    elif  date_search != "" and eng_name != "":
                        data = Face_detect.objects.filter(date = date_search,Eng_name = eng_name)
                    elif time_start != "" and time_end  != ""and date_search != "" and eng_name == "":
                        data = Face_detect.objects.filter(time__gte=time_start, time__lte=time_end, date = date_search)
                    elif eng_name != "" and time_start != "" and time_end != "":
                        data = Face_detect.objects.filter(Eng_name = eng_name,time__gte=time_start, time__lte=time_end)
                    elif date_search != "":
                        data = Face_detect.objects.filter(date = date_search)
                    elif time_start != "" and time_end  != "":
                        data = Face_detect.objects.filter(time__gte=time_start, time__lte=time_end)
                    elif eng_name != "":
                        data = Face_detect.objects.filter(Eng_name = eng_name)
                    data_serializer = face_detectSerializer(data , many = True)
                    return Response(data_serializer.data, status = status.HTTP_200_OK)
                except Exception as e:
                    return Response(str(e) , status = status.HTTP_404_NOT_FOUND)
            else:
                def setPath(path):
                    end_path = os.path.join(settings.STATICFILES_DIRS[0], path)
                    return end_path

                try:
                    json_file = open(setPath('emotiondetector.json'), "r")
                    model_json = json_file.read()
                    json_file.close()
                    facenet = FaceNet()
                    faces_embeddings = np.load(setPath('Faces_embeddings_done_anyclasses.npz'))
                    Y = faces_embeddings['arr_1']
                    encoder = LabelEncoder()
                    encoder.fit(Y)
                    face_recognition_model = load_model(setPath('Facenet_model.h5'))
                    haarcascade = cv2.CascadeClassifier(setPath('haarcascade_frontalface_default.xml'))
                    if image_file is not None:
                        try:
                            try:
                                image = cv2.imdecode(np.frombuffer(image_file.read(), np.uint8), cv2.IMREAD_COLOR)
                                rgb_img = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
                                gray_img = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
                                faces = haarcascade.detectMultiScale(gray_img, 1.3, 5)
                            except Exception as e:
                                return JsonResponse({"error": "Image is black"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                            
                            result_data = []
                            print(faces)
                            if faces:
                                for x, y, w, h in faces:
                                    img = rgb_img[y:y + h, x:x + w]
                                    img_crop = img
                                    img = cv2.resize(img, (160, 160))
                                    img = np.expand_dims(img, axis=0)
                                    ypred = facenet.embeddings(img)
                                    ypred = ypred.reshape(-1, 1, 1, 512)

                                    face_name = face_recognition_model.predict(ypred)
                                    max_values = np.max(face_name, axis=1)
                                    argmax_indices = np.argmax(face_name, axis=1)
                                    Eng_name = encoder.inverse_transform(argmax_indices)[0]

                                    threshold = 0.8
                                    if np.all(max_values < threshold):
                                        Eng_name = "unknown"
                                    try:
                                        date_search = request.data.get("date")
                                        time_start = request.data.get("time_start")
                                        time_end = request.data.get("time_end")
                                        if Eng_name == "" and date_search == "" and time_start == "" and time_end == "":
                                            data = Face_detect.objects.all()
                                        elif Eng_name != "" and date_search != "" and time_start != "" and time_end != "":
                                            data = Face_detect.objects.filter(Eng_name = Eng_name,date = date_search,time__gte=time_start, time__lte=time_end)
                                        elif  date_search != "" and Eng_name != "":
                                            data = Face_detect.objects.filter(date = date_search,Eng_name = Eng_name)
                                        elif time_start != "" and time_end  != ""and date_search != "" and Eng_name == "":
                                            data = Face_detect.objects.filter(time__gte=time_start, time__lte=time_end, date = date_search)
                                        elif Eng_name != "" and time_start != "" and time_end != "":
                                            data = Face_detect.objects.filter(Eng_name = Eng_name,time__gte=time_start, time__lte=time_end)
                                        elif date_search != "":
                                            data = Face_detect.objects.filter(date = date_search)
                                        elif time_start != "" and time_end  != "":
                                            data = Face_detect.objects.filter(time__gte=time_start, time__lte=time_end)
                                        elif Eng_name != "":
                                            data = Face_detect.objects.filter(Eng_name = Eng_name)
                                        data_serializer = face_detectSerializer(data , many = True)
                                        return Response(data_serializer.data, status = status.HTTP_200_OK)
                                    except Exception as e:
                                        return Response(str(e) , status = status.HTTP_404_NOT_FOUND)
                            else:
                                return JsonResponse({'error':'Not face detect'},status = status.HTTP_404_NOT_FOUND)
                        except Exception as e:
                                print(str(e))
                                return JsonResponse({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                    else:
                        print("img is null")
                        return JsonResponse({'error': 'img is null'}, status=status.HTTP_404_NOT_FOUND)
                except Exception as e:
                    print("error 2")
                    return JsonResponse({'error': 'Internal Server Error2'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        except Exception as e:
            print(str(e))
            return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    def put(self,request,format = None):
        try:
            idx = request.data.get("id")
            if idx is None:
                return Response("Id is None.", status=status.HTTP_400_BAD_REQUEST)
            try:
                data_db = Face_detect.objects.get(id = idx) 
            except Face_detect.DoesNotExist as e:
                return Response(str(e), status = status.HTTP_404_NOT_FOUND)
            data_serializer = face_detectSerializer(data_db , data = request.data)
            if data_serializer.is_valid():
                data_serializer.save()
                return Response(data_serializer.data , status = status.HTTP_200_OK)
            else:
                return Response(data_serializer.errors , status = status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            return Response(str(e) , status = status.HTTP_400_BAD_REQUEST)
    def delete(self,request,format = None):
        try:
            idx = request.data.get("id")

            if idx is None:
                return Response("Id is None.", status=status.HTTP_400_BAD_REQUEST)

            try:
                data = Face_detect.objects.get(id=idx)
            except Face_detect.DoesNotExist as e:
                return Response(str(e), status=status.HTTP_404_NOT_FOUND)

            data.delete()
            return Response(status=status.HTTP_200_OK)

        except Exception as e:
            return Response(str(e), status=status.HTTP_400_BAD_REQUEST)

class face_recognition(APIView):
    def post(self,request,format = None):
        def setPath(path):
            end_path = os.path.join(settings.STATICFILES_DIRS[0], path)
            return end_path

        def extract_features(image):
            resized_image = cv2.resize(image, (48, 48))
            feature = np.array(resized_image)
            feature = feature.reshape(1, 48, 48, 1)
            return feature / 255.0

        def settext(name, emotion):
            try:
                texts = text_mood.objects.filter(mood_type=emotion)
                text_serializer = Text_moodSeriallizer(texts, many=True)
                if not texts:
                    return {"message": "text is null"}

                text_random = random.choice(text_serializer.data)
                name_set = text_random['mood_text'].replace('x', name)
                return name_set

            except Exception as e:
                return {"message": str(e)}
        try:
            json_file = open(setPath('emotiondetector.json'), "r")
            model_json = json_file.read()
            json_file.close()
            emotion_model = model_from_json(model_json)
            emotion_model.load_weights(setPath('emotiondetector.h5'))
            emotion_labels = {0: 'Angry', 1: 'Disgust', 2: 'Fear', 3: 'Happy', 4: 'Neutral', 5: 'Sad', 6: 'Surprise'}

            facenet = FaceNet()
            faces_embeddings = np.load(setPath('Faces_embeddings_done_anyclasses.npz'))
            Y = faces_embeddings['arr_1']
            encoder = LabelEncoder()
            encoder.fit(Y)
            face_recognition_model = load_model(setPath('Facenet_model.h5'))
            haarcascade = cv2.CascadeClassifier(setPath('haarcascade_frontalface_default.xml'))
            image_file = request.FILES.get("image")
            if image_file is not None:
                try:
                    image = cv2.imdecode(np.frombuffer(image_file.read(), np.uint8), cv2.IMREAD_COLOR)
                    rgb_img = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
                    gray_img = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
                    faces = haarcascade.detectMultiScale(gray_img, 1.3, 5)
                except Exception as e:
                    return JsonResponse({"error": "Image is black"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                
                result_data = []
                if isinstance(faces, tuple):
                    return Response({'error': 'No Detect face'}, status=status.HTTP_404_NOT_FOUND)
                if faces.any():
                    for x, y, w, h in faces:
                        img = rgb_img[y:y + h, x:x + w]
                        img_crop = img
                        img = cv2.resize(img, (160, 160))
                        img = np.expand_dims(img, axis=0)
                        ypred = facenet.embeddings(img)
                        ypred = ypred.reshape(-1, 1, 1, 512)

                        face_emotion_pred = emotion_model.predict(extract_features(gray_img[y:y + h, x:x + w]))
                        mood_type = emotion_labels[face_emotion_pred.argmax()]

                        face_name = face_recognition_model.predict(ypred)
                        max_values = np.max(face_name, axis=1)
                        argmax_indices = np.argmax(face_name, axis=1)
                        Eng_name = encoder.inverse_transform(argmax_indices)[0]

                        threshold = 0.8
                        if np.all(max_values < threshold):
                            Eng_name = "unknown"

                        if Eng_name and mood_type:
                            date = datetime.now().date()
                            time = datetime.now().time()
                            time_str = str(time).replace(":", "-").replace(".", "-")
                            Full_img = "b_" + Eng_name + "-" + str(date) + "-" + str(time_str) + ".png"
                            Face_img = "s_" + Eng_name + "-" + str(date) + "-" + str(time_str) + ".png"
                            big_img_path = os.path.join("/Full/", Full_img)
                            small_img_path = os.path.join("/Face/", Face_img)
                            save_data = {'Eng_name': Eng_name, 'mood_type': mood_type, 'big_img_path': big_img_path,
                                        'small_img_path': small_img_path, 'date': date, 'time': time}
                            print(save_data)
                            data_serializer = face_detectSerializer(data=save_data)

                            if data_serializer.is_valid():
                                data_serializer.save()
                            else:
                                print(data_serializer.errors)
                        if Eng_name != "unknown":   
                            res_name = Eng_name.replace('_',' ')
                            username = user_db.objects.filter(Eng_name = res_name)
                            user_ser = UserSeriallizer(username , many = True)
                            data = user_ser.data
                            set_text = settext(data[0]['TH_name'], mood_type)
                        else:
                            res_name = "บุคคลนิรนาม"
                            set_text = settext(res_name, mood_type)
                        result_data.append({'text': set_text, 'name': res_name, 'emotion': mood_type, 'path':small_img_path,'useTts':False})
                        b_file_path = os.path.join(settings.STATICFILES_DIRS[2], Full_img)
                        with open(b_file_path, 'wb') as f:
                            for chunk in image_file.chunks():
                                f.write(chunk)
                        s_img_path = os.path.join(settings.STATICFILES_DIRS[3], Face_img)
                        cv2.imwrite(s_img_path, cv2.cvtColor(img_crop, cv2.COLOR_RGB2BGR))

                if result_data:
                    return JsonResponse({'result': result_data})
                else:
                    return JsonResponse({'error': 'No faces detected'}, status=status.HTTP_404_NOT_FOUND)
            else:
                print("img is null")
                return JsonResponse({'error': 'img is null'}, status=status.HTTP_404_NOT_FOUND)

        except Exception as e:
            print(str(e))
            return JsonResponse({'error': 'Internal Server Error2'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
