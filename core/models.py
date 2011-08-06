from django.db import models

# Create your models here.
class entries(models.Model):
    id = models.IntegerField("id",primary_key=True)
    word = models.TextField("word")
    definition = models.TextField("definition")
    example = models.TextField("example")
    def __unicode__(self):
        return "Word: %s, \ndefinition: %s\nexample: %s\n"%(self.word,self.definition,self.example)
    class Meta:
        db_table = "entries"

