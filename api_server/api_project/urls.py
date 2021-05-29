
from django.contrib import admin
from django.urls import path,include
# from rest_framework.routers import DefaultRouter
from mytask.views import MyTaskView,MyTaskViewDetail

# route = DefaultRouter('mytask',MyTaskView)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/',MyTaskView.as_view(),name='api-route'),
    path('api/v1/<int:pk>/',MyTaskViewDetail.as_view(),name='api-route'),

]
