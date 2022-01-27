from datetime import timezone
import datetime
from django.shortcuts import render
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet

from clients.models import Client
from clients.permissions import IsAuthenticatedSalesEmployee
from .serializers import ClientSerializer, DetailClientSerializer


class ClientViewset(ModelViewSet):
    """
    Only authenticated users can access this view
    Allow to get whole client list, authenticated user related_list or one specific client
    If user is in charge of the selected client, he can mangage its informations
    """

    serializer_class = ClientSerializer
    permission_classes = [IsAuthenticated]

    
    def get_queryset(self):
        return Client.objects.all()

class DetailClientViewset(ModelViewSet):
    """
    Only authenticated users can access this view
    Allow to get  the authenticated user related_list of clients or one specific client
    If user is in charge of the selected client, he can mangage its informations
    """

    serializer_class = DetailClientSerializer
    permission_classes = [IsAuthenticatedSalesEmployee]

    
    def get_queryset(self):
        return Client.objects.filter(sales_employee=self.request.user)

    def create(self, request, *args, **kwargs):
        request.POST._mutable = True
        request.data["sales_employee"] = request.user.id
        request.POST._mutable = False
        return super(DetailClientViewset, self).create(request, *args, *kwargs)

    
    def modify(self, request, pk=None, *args, **kwargs):
        return super(DetailClientViewset, self).uptade(request, *args, **kwargs)

    
    def delete(self, request):
        return super(DetailClientViewset, self).delete()