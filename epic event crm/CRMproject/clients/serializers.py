from rest_framework import serializers
from clients.models import Client


class ClientSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Client
        fields = ['last_name',
                  'status',
                  'email',
                  'mobile',
                  'company_name',
                  ]


class DetailClientSerializer(serializers.ModelSerializer):

    CHOICES = [("Prospect", "Prospect"),
               ("Customer", "Customer"),
               ]
    status = serializers.MultipleChoiceField(choices=CHOICES)
    
    class Meta:
        model = Client

        fields = ['first_name',
                  'last_name',
                  'status',
                  'email',
                  'phone',
                  'mobile',
                  'company_name',
                  'created_time',
                  'uptaded_time',
                  'sales_employee'
                  ]