from rest_framework import serializers
from .models import MyTask

class MyTaskSerializers(serializers.ModelSerializer):
    class Meta:
        model = MyTask
        fields = ['id','title']