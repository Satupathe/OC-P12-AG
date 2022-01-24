from rest_framework.permissions import BasePermission
from clients.models import Client
from employeeApp.models import Employee

class IsAuthenticatedSalesEmployee(BasePermission):
    """
    Allow access to the Clients view if user is Authenticated
    and if user is a sales employee
    Sales employee can create, get, modify or delete clients
    """
    message = "Only Authenticated sales employee can create new client and modify their already existing clients and prospects"
    sales_methods = ['GET', 'POST', 'PUT', 'DELETE']
    
    def has_permission(self, request, view):
        print(request.user.first_name)
        print(request.user.last_name)
        print(request.user.email)
        print(request.user.department)
        if request.user.is_authenticated:
            if request.user.department == "Sales":
                return True
            else:
                return False

    def has_object_permission(self, request, view, obj):
        if request.user.is_authenticated:
            print('request.user.department', request.user.department)
            if obj.sales_employee == request.user:
                return True
