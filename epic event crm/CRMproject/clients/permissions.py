from rest_framework.permissions import BasePermission


class ClientSalesSupportEmployee(BasePermission):
    """
    Allow access to the Clients view if user is Authenticated
    and if user is a sales employee
    Sales employee can create, get, modify or delete clients
    """
    message = """Only Authenticated sales employee can create new client
                and modify their already existing clients and prospects"""
    sales_methods = ['GET', 'POST', 'PUT', 'DELETE']
    support_methods = ['GET', ]

    def has_permission(self, request, view):
        if request.user.is_authenticated:
            if request.user.department == "Sales":
                return True
            if request.user.department == "Support":
                if request.method in self.support_methods:
                    return True
                else:
                    return False

    def has_object_permission(self, request, obj):
        if request.user.is_authenticated:
            if obj.sales_employee == request.user:
                return True
            else:
                self.message = "You can't modify or delete clients you are not assigned to"
                return False

    message = """Only Authenticated sales employee can create new client
                 and modify their already existing clients and prospects"""
