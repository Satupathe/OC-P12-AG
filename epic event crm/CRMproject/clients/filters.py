from django_filters import rest_framework as filters
from clients.models import Client


class ClientFilter(filters.FilterSet):
    client_name = filters.CharFilter(field_name="last_name", lookup_expr='icontains')
    client_email = filters.CharFilter(field_name="email", lookup_expr='icontains')

    class Meta:
        model = Client
        fields = ('client_name', 'client_email')
