# Generated by Django 4.0.1 on 2022-01-24 15:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='client',
            old_name='compagny_name',
            new_name='company_name',
        ),
    ]
