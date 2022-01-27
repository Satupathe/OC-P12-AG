from django import forms
from django.contrib import admin
from django.contrib.auth.models import Group, Permission
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.forms import ReadOnlyPasswordHashField

from clients.models import Client
from .models import Employee


class UserCreationForm(forms.ModelForm):
    """A form for creating new users. Includes all the required
    fields, plus a repeated password."""
    password1 = forms.CharField(label='Password', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Password confirmation', widget=forms.PasswordInput)

    class Meta:
        model = Employee
        fields = ('email',
                  'username',
                  'first_name',
                  'last_name',
                  'phone',
                  'mobile',
                  'department',
                  'groups')

    def clean_password2(self):
        # Check that the two password entries match
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords don't match")
        return password2

    def save(self, commit=True):
        # Save the provided password in hashed format
        user = super().save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user


class UserChangeForm(forms.ModelForm):
    """A form for updating users. Includes all the fields on
    the user, but replaces the password field with admin's
    password hash display field.
    """
    password = ReadOnlyPasswordHashField()

    class Meta:
        model = Employee
        fields = ('email',
                  'username',
                  'first_name',
                  'last_name',
                  'phone',
                  'mobile',
                  'department',
                  'groups',
                  'password',
                  'is_active',
                  'is_admin',
                  'is_staff',
                  'is_superuser')

    def clean_password(self):
        return self.initial["password"]


class UserAdmin(BaseUserAdmin):
    # The forms to add and change user instances
    form = UserChangeForm
    add_form = UserCreationForm

    list_display = ('email',
                  'username',
                  'first_name',
                  'last_name',
                  'phone',
                  'mobile',
                  'department',
                  'groups')
    list_filter = ('is_staff', "department")
    fieldsets = (
        (None, {'fields': ('email', 'username', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'phone', 'mobile',)}),
        ('Permissions', {'fields': ('department', 'groups', 'is_admin', 'is_staff', 'is_active')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2')}
        ),
    )
    search_fields = ('email',)
    ordering = ('email',)
    filter_horizontal = ()

admin.site.register(Employee, UserAdmin)
admin.site.register(Permission)
#admin.site.unregister(Group)