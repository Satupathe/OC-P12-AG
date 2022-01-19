import pytest
from ..models import Employee
from django.contrib.auth import get_user_model
from django.test import TestCase


"""@pytest.mark.django_db
def test_superuser_create():
    user = Employee.objects.create_superuser('test_user_creation', 'creation@test.com', password='foo')
    assert Employee.objects.count() == 1
    assert user.email == 'creation@test.com'
    assert user.is_staff == True
    assert user.is_superuser == True

@pytest.mark.django_db
def test_superuser_create_no_username():
    with pytest.raises(TypeError):
        user = Employee.objects.create_superuser(email='creation@test.com', password='foo')


@pytest.mark.django_db
def test_user_create():
    user = Employee.objects.create_user('test_user_creation',
                                        'test1',
                                        'user1',
                                        'creation@test.com',
                                        'managment',
                                        password='foo'
                                        )
    assert Employee.objects.count() == 1
    assert user.email == 'creation@test.com'
    assert user.is_staff == False
    assert user.is_superuser == False

@pytest.mark.django_db
def test_user_create_no_username():
    with pytest.raises(TypeError):
        user = Employee.objects.create_superuser(first_name='test1',
                                                 last_name='user1',
                                                 department='managment',
                                                 email='creation@test.com',
                                                 password='foo')"""
