from rest_framework.viewsets import ModelViewSet

from clients.models import Client
from clients.permissions import IsAuthenticatedSalesEmployee
from .serializers import ClientSerializer, DetailClientSerializer
from rest_framework.exceptions import PermissionDenied


class DetailClientViewset(ModelViewSet):
    """
    Only authenticated users can access this view
    Allow to get  the authenticated user related_list of clients or one specific client
    If user is in charge of the selected client, he can mangage its informations
    """

    serializer_class = DetailClientSerializer
    permission_classes = [IsAuthenticatedSalesEmployee]

    def permission_denied(self, request, message=None, code=None):
        raise PermissionDenied(message)
    
    def get_queryset(self, request):
        return Client.objects.filter(sales_employee=self.request.user)

    def create(self, request, *args, **kwargs):
        request.POST._mutable = True
        request.data["sales_employee"] = request.user.id
        request.POST._mutable = False
        return super(DetailClientViewset, self).create(request, *args, *kwargs)

    
    def modify(self, request, pk=None, *args, **kwargs):
        return super(DetailClientViewset, self).update(request, *args, **kwargs)

    
    def delete(self, request):
        return super(DetailClientViewset, self).delete()