from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated
from clients.models import Client
from clients.serializers import ClientSerializer
from contractsEvents.models import Contract, Event
from drf_multiple_model.viewsets import ObjectMultipleModelAPIViewSet

from contractsEvents.serializers import ContractSerializer, EventSerializer


class ListViewset(ObjectMultipleModelAPIViewSet):
    permission_classes = [IsAuthenticated]
    serializer_class = []

    querylist = [
        {
            'queryset': Client.objects.all(),
            'serializer_class': ClientSerializer,
        },
        {
            'queryset': Contract.objects.all(),
            'serializer_class': ContractSerializer,
        },
        {
            'queryset': Event.objects.all(),
            'serializer_class': EventSerializer,
        },
    ]
