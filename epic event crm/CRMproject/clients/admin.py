from django import forms
from django.contrib import admin

from clients.models import Client


class ClientCreationForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = ('first_name',
                  'last_name',
                  'status',
                  'email',
                  'phone',
                  'mobile',
                  'company_name',
                  'sales_employee',
                  )


class ClientChangeForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = ('first_name',
                  'last_name',
                  'status',
                  'email',
                  'phone',
                  'mobile',
                  'company_name',
                  'sales_employee',
                  )


class ClientAdmin(admin.ModelAdmin):

    form = ClientChangeForm
    add_form = ClientCreationForm

    list_display = ('first_name',
                    'last_name',
                    'status',
                    'email',
                    'mobile',
                    'phone',
                    'company_name',
                    'sales_employee')

    list_filter = ('status', 'created_time', 'sales_employee')

    fieldsets = (('Personal information', {'fields': ('first_name',
                                                      'last_name',
                                                      'email',
                                                      'company_name',
                                                      'mobile',
                                                      'phone')}),
                 ('Internal information', {'fields': ('status', 'sales_employee')})
                 )
    search_fields = ('email', 'name')
    ordering = ('created_time',)


admin.site.register(Client, ClientAdmin)
