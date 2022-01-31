from django.urls import path, include
from rest_framework_nested import routers
from django.contrib import admin

from contractsEvents.views import ContractViewSet, EventViewSet


contracts_router = routers.SimpleRouter(trailing_slash=False)
contracts_router.register(r"details/?", ContractViewSet, basename='contracts')

events_router = routers.SimpleRouter(trailing_slash=False)
events_router.register(r"details/?", EventViewSet, basename='events')


urlpatterns = [
    path('admin/', admin.site.urls),
    path('contracts/', include(contracts_router.urls)),
    path('events/', include(events_router.urls)),
]
