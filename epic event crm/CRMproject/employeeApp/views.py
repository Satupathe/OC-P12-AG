from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated
from clients.models import Client
from clients.serializers import ClientSerializer
from contractsEvents.models import Contract, Event
from drf_multiple_model.viewsets import ObjectMultipleModelAPIViewSet

from contractsEvents.serializers import DetailContractSerializer, DetailEventSerializer


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
            'serializer_class': DetailContractSerializer,
        },
        {
            'queryset': Event.objects.all(),
            'serializer_class': DetailEventSerializer,
        },
    ]
    
    


"""class TimelineViewSet(viewsets.ModelViewSet):
    def list(self, request):
        queryset = list(itertools.chain(Tweet.objects.all(), Article.objects.all()))
        serializer = TimelineSerializer(queryset, many=True)
        return Response(serializer.data)"""

"""result = {'serializer1': serializer1.data, 'serializer2': serializer2.data} 
return response(result)"""