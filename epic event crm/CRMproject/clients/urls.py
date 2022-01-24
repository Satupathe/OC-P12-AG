from django.urls import path, include
from rest_framework_nested import routers

from clients.views import DetailClientViewset, ClientViewset

#prévoir les viewset


clients_router = routers.SimpleRouter(trailing_slash=False)
clients_router.register(r"details/?", DetailClientViewset, basename='clients')


urlpatterns = [
    path('list/', ClientViewset.as_view({"get": "list"}), name='clients list'),
    path('list/', include(clients_router.urls)),
]
