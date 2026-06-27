

from django.urls import path


from . import views



urlpatterns = [

    # ---------------- PAGE D'ACCUEIL ----------------

    
    path('', views.home, name='home'),


    # ---------------- PAGE LOGIN ----------------




    # ---------------- PAGE LOGOUT ----------------


    path(
        'logout/',
        views.logout_user,
        name='logout'
    ),


    # ---------------- PAGE REGISTER ----------------

    path(
        'register/',
        views.register_user,
        name='register'
    ),
    path(
        'record/<int:pk>', views.customer_record,name='record'
    ),
    path(
        'delete_record/<int:pk>', views.delete_record,name='delete_record'
    )
    ,
    path('projets/', views.liste_projets, name='liste_projets'),
    path('projets/nouveau/', views.creer_projet, name='creer_projet'),
    path('projets/<int:pk>/', views.detail_projet, name='detail_projet'),
    path('projets/<int:pk>/editer/', views.editer_projet, name='editer_projet'),
    path('projets/<int:pk>/eliminer/', views.eliminer_projet, name='eliminer_projet'),
    path('chercheurs/', views.liste_chercheurs, name='liste_chercheurs'),
    path('chercheurs/nouveau/', views.creer_chercheur, name='creer_chercheur'),
    path('chercheurs/<int:pk>/supprimer/', views.supprimer_chercheur, name='supprimer_chercheur'),
    path('chercheurs/<int:pk>/editer/', views.editer_chercheur, name='editer_chercheur'),
    path('projets-dashboard/', views.projets_dashboard, name='projets_dashboard'),
    path('projets-dashboard/', views.projets_dashboard, name='projets_dashboard'),
    
]   