from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager, PermissionsMixin, AbstractBaseUser, Group
from django.db.models.deletion import CASCADE
from rest_framework_simplejwt.tokens import RefreshToken


class EmployeeManager(BaseUserManager):
    def create_user(self, username, first_name, last_name, email, department, password=None):
        if not username:
            raise ValueError('Users must have a username')
        if not first_name:
            raise ValueError('Users must have a first_name')
        if not last_name:
            raise ValueError('Users must have a last_name')
        if not email:
            raise ValueError('Users must have a Email')
        if not department:
            raise ValueError("Users must be assigned to a specific department")

        user = self.model(username=username,
                          first_name=first_name,
                          last_name=last_name,
                          email=self.normalize_email(email),
                          department = department,
                          )
        user.set_password(password)
        user.save(using=self.db)
        return user
    
    def create_superuser(self, username, email, password=None):
        user = self.model(username=username,
                          email=self.normalize_email(email),
                          )
        user.is_admin = True
        user.is_superuser = True
        user.is_active = True
        user.is_staff = True
        user.department = "1"
        user.set_password(password)
        user.save(using=self.db)
        return user


class Employee(AbstractBaseUser, PermissionsMixin):
    "Define employees informations and their respective company department"
    CHOICES = [("1", "Managment"),
               ("2", "Sales"),
               ("3", "Support")
               ]
    username = models.CharField(max_length=50, unique=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.EmailField(verbose_name = "email", max_length=60, unique=True)
    phone = models.CharField(max_length=25)
    mobile = models.CharField(max_length=25)
    department = models.CharField(choices=CHOICES, max_length=10)
    groups = models.ForeignKey(Group, on_delete=CASCADE, null=True, blank=True, default=None)
    created_time = models.DateTimeField(auto_now_add=True)
    modified_time = models.DateTimeField(auto_now_add=True)
    is_admin = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(verbose_name='date joined', auto_now_add=True)
    last_login = models.DateTimeField(verbose_name='last login', auto_now_add=True)


    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

    objects = EmployeeManager()

    def __str__(self):
        return self.email

    def tokens(self):
        refresh = RefreshToken.for_user(self)
        return {
            'refresh': str(refresh),
            'access': str(refresh.access_token)
        }
