from ast import Continue
from email import message
from rest_framework.permissions import BasePermission
from clients.models import Client
from contractsEvents.models import Contract, Event
from employeeApp.models import Employee

class IsAuthenticatedSalesEmployee(BasePermission):
    """
    Allow access to the Clients view if user is Authenticated
    and if user is a sales employee
    Sales employee can create, get, modify or delete clients
    """
    message = "Only Authenticated sales employee can create and modify their contracts"
    
    def has_permission(self, request, view):
        if request.user.is_authenticated:
            if request.user.department == "Sales":
                return True
            else:
                return False

    def has_object_permission(self, request, view, obj):
        if request.user.is_authenticated:    
            if obj.sales_administrator == request.user:
                return True
            else:
                self.message = "You can only modify or delete your own contracts"
                return False
    message = "Only Authenticated sales employee can create and modify their contracts"


class IsAuthenticatedSalesOrSupportEmployee(BasePermission):
    """
    Allow access to the Clients view if user is Authenticated
    and if user is a sales employee
    Sales employee can create, get, modify or delete clients
    """
    message = "Only Authenticated sales ou support employee can access this page"
    sales_methods = ['GET', 'POST', 'PUT', 'DELETE']
    support_methods = ['GET', 'PUT']
    
    def has_permission(self, request, view):
        if request.user.is_authenticated:
            if request.user.department == "Sales":
                return True
            if request.user.department == "Support":
                if request.method in self.support_methods:
                    return True
                else:
                    self.message = "You can't create or delete events with your access rights"
                    return False
            else:
                self.message = "Only Authenticated sales ou support employee can access this page"
                return False

    def has_object_permission(self, request, view, obj):
        self.item = None
        if request.user.is_authenticated:
            if request.user.department == "Sales":
                if isinstance(obj, Contract):
                    if obj.sales_administrator == request.user:
                        return True
                    else:
                        return False
                  
                if isinstance(obj, Event):
                    related_contract_admin = Contract.objects.get(event=obj.id)
                    if related_contract_admin.sales_administrator == request.user:
                        return True
                    else:
                        return False

            if request.user.department == "Support":
                if isinstance(obj, Event):
                    if obj.support_employee == request.user:
                        return True
        
        return False