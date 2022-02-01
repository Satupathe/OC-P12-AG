from attr import field
from rest_framework import serializers
from contractsEvents.models import Contract, Event


class DetailContractSerializer(serializers.ModelSerializer):

    class Meta:
        model = Contract
        fields = "__all__"

class DetailEventSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Event
        fields = "__all__"