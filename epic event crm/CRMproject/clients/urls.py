from django.urls import path, include
from rest_framework_nested import routers
from django.contrib import admin

from clients.views import DetailClientViewset


clients_router = routers.SimpleRouter(trailing_slash=False)
clients_router.register(r"client/?", DetailClientViewset, basename='clients')


urlpatterns = [
    path('admin/', admin.site.urls),
    path('list/', include(clients_router.urls)),
]
