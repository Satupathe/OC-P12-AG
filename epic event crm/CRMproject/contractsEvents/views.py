from django.shortcuts import render
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet

from contractsEvents.models import Contract, Event
from contractsEvents.permissions import IsAuthenticatedSalesEmployee, EventSalesSupportEmployee
from contractsEvents.serializers import DetailContractSerializer, DetailEventSerializer


class ContractViewSet(ModelViewSet):

    serializer_class = DetailContractSerializer
    permission_classes = [IsAuthenticatedSalesEmployee]

    def get_queryset(self):
        return Contract.objects.filter(sales_administrator=self.request.user)

    def create(self, request, *args, **kwargs):
        request.POST._mutable = True
        request.data["sales_administrator"] = request.user.id
        request.POST._mutable = False
        return super(ContractViewSet, self).create(request, *args, *kwargs)
    
    def modify(self, request, pk=None, *args, **kwargs):
        return super(ContractViewSet, self).update(request, *args, **kwargs)
    
    def delete(self, request):
        return super(ContractViewSet, self).delete()


class EventViewSet(ModelViewSet):

    print("event1")
    serializer_class = DetailEventSerializer
    permission_classes = [EventSalesSupportEmployee]


    def get_queryset(self):
        if self.request.user.department == "Sales":
            return Event.objects.filter(relatedevent__sales_administrator=self.request.user)
        if self.request.user.department == "Support":
            return Event.objects.filter(support_employee=self.request.user)

    def create(self, request, *args, **kwargs):
        return super(EventViewSet, self).create(request, *args, *kwargs)

    
    def modify(self, request, pk=None, *args, **kwargs):
        print("modify1")
        return super(EventViewSet, self).update(request, *args, **kwargs)
    
    def delete(self, request):
        return super(EventViewSet, self).delete()