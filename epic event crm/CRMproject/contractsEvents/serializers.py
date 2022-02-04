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


class DetailAllTeamsEventSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Event
        fields = ('name',
                  'description',
                  'event_beginning',
                  'event_end',
                  'status',
                  'created_time',
                  'updated_time',
                  'support_employee'
                  )


class DetailSalesSupportEventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ('name',
                  'description',
                  'event_beginning',
                  'event_end',
                  'status',
                  'created_time',
                  'updated_time',
                  )

class ManagementTeamEventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ("support_employee",)

class DetailContractSerializer(serializers.ModelSerializer):

    class Meta:
        model = Contract
        fields = "__all__"

