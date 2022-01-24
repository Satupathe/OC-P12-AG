from django.conf import settings
from django.db import models
from django.db.models.deletion import PROTECT


class Client(models.Model):
    
    CHOICES = [("Prospect", "Prospect"),
               ("Customer", "Customer"),
               ]

    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    status = models.CharField(choices=CHOICES, max_length=30)
    email = models.EmailField(max_length=100, unique=True, db_index=True)
    phone = models.CharField(max_length=25)
    mobile = models.CharField(max_length=25)
    company_name = models.CharField(max_length=255, null=False, blank=False)
    created_time = models.DateTimeField(verbose_name='created time', auto_now_add=True)
    uptaded_time = models.DateTimeField(verbose_name='updated_time', auto_now_add=True)
    sales_employee = models.ForeignKey(settings.AUTH_USER_MODEL, related_name="sales_employee", on_delete=PROTECT)
    