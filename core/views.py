# Create your views here.
from django.shortcuts import render_to_response

topic_list = ['Enter Word','Random Revision: Randomly picking up one word at a time','Revise the seen list','Revise the latest added words','Reverse revision of seen list','Exit']

def MainPage(request):
    return render_to_response("main.html",{'topic_list':topic_list});

def EnterWord(request):

