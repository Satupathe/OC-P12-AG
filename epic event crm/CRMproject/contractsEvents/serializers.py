from attr import field
from rest_framework import serializers
from contractsEvents.models import Contract, Event


class EventSerializer(serializers.ModelSerializer):

    class Meta:
        model = Event
        fields = ('name',
                  'description',
                  'event_beginning',
                  'status',
                  'support_employee',
                  )


class ContractSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Contract
        fields = ('name',
                  'description',
                  'value',
                  'status',
                  'client',
                  'sales_administrator',
                  'event',
                  )


class DetailEventSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Event
        fields = "__all__"


class DetailContractSerializer(serializers.ModelSerializer):

    class Meta:
        model = Contract
        fields = "__all__"

