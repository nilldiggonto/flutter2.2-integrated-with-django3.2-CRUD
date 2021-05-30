from django.shortcuts import render
from .serializers import MyTaskSerializers
from .models import MyTask
# from rest_framework.views import APIView
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
# from rest_framework.viewsets import ModelViewSet
# Create your views here.

class MyTaskView(ListCreateAPIView):
    queryset = MyTask.objects.all().order_by('-id')
    serializer_class =MyTaskSerializers

class MyTaskViewDetail(RetrieveUpdateDestroyAPIView):
    queryset = MyTask.objects.all()
    serializer_class =MyTaskSerializers