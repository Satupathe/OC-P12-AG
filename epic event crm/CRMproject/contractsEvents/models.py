import datetime
from tkinter import CASCADE
from django.db import models
from django.conf import settings
from django.db.models.deletion import CASCADE, PROTECT
from clients.models import Client


class Event(models.Model):
    CHOICES = [("Pending", "Pending"),
               ("Finished", "Finished")
               ]
    name = models.CharField(max_length=100)
    description = models.TextField()
    event_beginning = models.DateTimeField()
    event_end = models.DateTimeField()
    status = models.CharField(choices=CHOICES, max_length=50)
    created_time = models.DateTimeField(verbose_name='contract_created time', auto_now_add=True)
    uptaded_time = models.DateTimeField(verbose_name='contract_updated_time', auto_now=True)
    support_employee = models.ForeignKey(settings.AUTH_USER_MODEL, related_name="support_employee", on_delete=PROTECT)

    def __str__(self):
        return self.name


class Contract(models.Model):

    CHOICES = [("Pending", "Pending"),
               ("Signed", "Signed")
               ]
    name = models.CharField(max_length=100)
    description = models.TextField()
    value = models.CharField(max_length=100)
    deadline = models.DateField()
    status = models.CharField(choices=CHOICES, max_length=50)
    created_time = models.DateTimeField(verbose_name='contract_created time', auto_now_add=True)
    uptaded_time = models.DateTimeField(verbose_name='contract_updated_time', auto_now=True)
    client = models.ForeignKey(Client, related_name="related_client", on_delete=CASCADE)
    sales_administrator = models.ForeignKey(settings.AUTH_USER_MODEL, related_name="sales_administrator", on_delete=PROTECT)
    event = models.ForeignKey(Event, related_name="relatedevent", on_delete=CASCADE, null=True, blank=True)

    def __str__(self):
        return self.name


