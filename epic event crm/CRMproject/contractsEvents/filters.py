from django_filters import rest_framework as filters
from contractsEvents.models import Contract, Event


class ContractFilter(filters.FilterSet):
    minvalue = filters.NumberFilter(field_name="value", lookup_expr='gte')
    maxvalue = filters.NumberFilter(field_name="value", lookup_expr='lte')
    ccn = filters.CharFilter(field_name="client__last_name", lookup_expr='icontains')
    cce = filters.CharFilter(field_name="client__email", lookup_expr='icontains')
    ddate = filters.CharFilter(field_name="deadline", lookup_expr='icontains')
    
    class Meta:
        model = Contract
        fields = ('ccn', 'cce', 'minvalue', 'maxvalue', 'ddate')


class EventFilter(filters.FilterSet):
    eventbegin = filters.CharFilter(field_name="event_beginning", lookup_expr='icontains')
    ecn = filters.CharFilter(field_name="relatedevent__client__last_name", lookup_expr='icontains')
    ece = filters.CharFilter(field_name="relatedevent__client__email", lookup_expr='icontains')
    
    class Meta:
        model = Event
        fields = ('eventbegin', 'ecn', 'ece')