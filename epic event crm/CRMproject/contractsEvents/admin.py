from django import forms
from django.contrib import admin

from contractsEvents.models import Contract, Event

class ContractCreationForm(forms.ModelForm):
    class Meta:
        model = Contract
        fields = ('name',
                  'description',
                  'value',
                  'deadline',
                  'status',
                  'client',
                  'sales_administrator',
                  'event',
        )


class ContractChangeForm(forms.ModelForm):
    class Meta:
        model = Contract
        fields = ('name',
                  'description',
                  'value',
                  'deadline',
                  'status',
                  'client',
                  'sales_administrator',
                  'event',
        )


class ContractAdmin(admin.ModelAdmin):
    
    form = ContractCreationForm
    add_form = ContractChangeForm
    
    list_display = ('name',
                  'description',
                  'value',
                  'deadline',
                  'status',
                  'client',
                  'sales_administrator',
                  'event',
                  'created_time',
    )

    list_filter = ('status', 'sales_administrator')

    fieldsets = (
                 ('Practical information', {'fields': ('name', 'description', 'value', 'deadline')}),
                 ('Internal information', {'fields': ('status', 'client', 'sales_administrator', 'event')})
                 )
    search_fields = ('client__last_name', 'status')
    ordering = ('created_time', 'status')


class EventCreationForm(forms.ModelForm):
    class Meta:
        model = Event
        fields = ('name',
                  'description',
                  'event_beginning',
                  'event_end',
                  'status',
                  'support_employee',
        )


class EventChangeForm(forms.ModelForm):
    class Meta:
        model = Event
        fields = ('name',
                  'description',
                  'event_beginning',
                  'event_end',
                  'status',
                  'support_employee',
        )


class EventAdmin(admin.ModelAdmin):
    
    form = EventCreationForm
    add_form = EventChangeForm
    
    list_display = ('name',
                    'description',
                    'event_beginning',
                    'event_end',
                    'created_time',
                    'uptaded_time',
                    'status',
                    'support_employee',
    )

    list_filter = ('status', 'support_employee')

    fieldsets = (
                 ('Practical information', {'fields': ('name', 'description', 'event_beginning', 'event_end')}),
                 ('Internal information', {'fields': ('status', 'support_employee')})
                 )
    search_fields = ('status', 'name')
    ordering = ('created_time', 'status')

admin.site.register(Contract, ContractAdmin)
admin.site.register(Event, EventAdmin)