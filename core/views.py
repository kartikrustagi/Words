# Create your views here.
from django.shortcuts import render_to_response
from django.template import RequestContext
from core.models import *

topic_list = ['Enter Word','Random Revision: Randomly picking up one word at a time','Revise the seen list','Revise the latest added words','Reverse revision of seen list','Exit']

def MainPage(request):
    return render_to_response("main.html",{'topic_list':topic_list});

def EnterWord(request):
    return render_to_response("enter_word.html",{},context_instance=RequestContext(request))

def StoreData(request):
    num_entries = len(entries.objects.all())
    entry = entries(id = (num_entries+1), word = request.POST["word"], definition = request.POST["definition"], example = request.POST["example"])
    entry.save()
    
