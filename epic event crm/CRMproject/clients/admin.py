from django import forms
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

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

    """def save(self, commit=True):
        # Save the provided password in hashed format
        user = super().save(commit=False)
        if commit:
            user.save()
        return user"""


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

    fieldsets = (
                 ('Personal info', {'fields': ('first_name', 'last_name', 'email', 'company_name', 'mobile', 'phone')}),
                 ('Internal infos', {'fields': ('status', 'sales_employee')})
                 )
    search_fields = ('email',)
    ordering = ('created_time',)
    filter_horizontal = ()

admin.site.register(Client, ClientAdmin)
