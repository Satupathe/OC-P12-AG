import email
from django.db.models import Q
from rest_framework.permissions import IsAuthenticated
from clients.filters import ClientFilter
from clients.models import Client
from clients.serializers import ClientSerializer
from contractsEvents.filters import ContractFilter, EventFilter
from contractsEvents.models import Contract, Event
from drf_multiple_model.viewsets import ObjectMultipleModelAPIViewSet

from contractsEvents.serializers import ContractSerializer, EventSerializer


class ListViewset(ObjectMultipleModelAPIViewSet):
    permission_classes = [IsAuthenticated]

    
    def get_querylist(self):
        
        clients = Client.objects.all() 
        client_last_name = self.request.query_params.get('last_name', None)
        client_email = self.request.query_params.get('email', None)
        if client_last_name is not None:
            clients = clients.filter(last_name__icontains=client_last_name)
        if client_email is not None:
            clients = clients.filter(email__icontains=client_email)

        contracts = Contract.objects.all()
        contract_client_name = self.request.query_params.get('contract_client_name', None)
        contract_client_email = self.request.query_params.get('contract_client_email', None)
        contract_minvalue = self.request.query_params.get('contract_min', None)
        contract_maxvalue = self.request.query_params.get('contract_max', None)
        contract_deadline = self.request.query_params.get('deadline', None)
        if contract_client_name is not None:
            contracts = contracts.filter(client__last_name__icontains=contract_client_name)
        if contract_client_email is not None:
            contracts = contracts.filter(client__email__icontains=contract_client_email)
        if contract_minvalue is not None:
            print (type(contract_minvalue))
            contracts = contracts.filter(value__gte=int(contract_minvalue))
        if contract_maxvalue is not None:
            contracts = contracts.filter(value__lte=int(contract_maxvalue))
        if contract_deadline is not None:
            contracts = contracts.filter(deadline__icontains=contract_deadline)

        events = Event.objects.all()
        event_client_name = self.request.query_params.get('event_client_name', None)
        event_client_email = self.request.query_params.get('event_client_email', None)
        event_beginning = self.request.query_params.get('event_start', None)
        if event_client_name is not None:
            events = events.filter(relatedevent__client__last_name__icontains=event_client_name)
        if event_client_email is not None:
            events = events.filter(relatedevent__client__email__icontains=event_client_email)
        if event_beginning is not None:
            events = events.filter(event_beginning__icontains=event_beginning)
        
        querylist = [
            {
                'queryset': clients,
                'serializer_class': ClientSerializer,
            },
            {
                'queryset': contracts,
                'serializer_class': ContractSerializer,
            },
            {
                'queryset': events,
                'serializer_class': EventSerializer,
            },
        ]
        return querylist

