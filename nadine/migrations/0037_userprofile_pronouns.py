# Generated by Django 2.2.1 on 2019-07-11 17:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nadine', '0036_remove_old_models'),
    ]

    operations = [
        migrations.AddField(
            model_name='userprofile',
            name='pronouns',
            field=models.CharField(blank=True, max_length=64, null=True),
        ),
    ]
