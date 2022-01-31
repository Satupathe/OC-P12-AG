from attr import field
from rest_framework import serializers
from contractsEvents.models import Contract, Event


class DetailContractSerializer(serializers.ModelSerializer):
    
    CHOICES = [("Pending", "Pending"),
               ("Signed", "Signed")
               ]
    status = serializers.MultipleChoiceField(choices=CHOICES)

    class Meta:
        model = Contract
        fields = "__all__"

class DetailEventSerializer(serializers.ModelSerializer):
    
    CHOICES = [("Pending", "Pending"),
               ("Finished", "Finished")
               ]
    status = serializers.MultipleChoiceField(choices=CHOICES)
    
    class Meta:
        model = Event
        fields = "__all__"