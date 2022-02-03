from django.urls import path, include
from rest_framework_nested import routers
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

from employeeApp.views import ListViewset

lists_router = routers.SimpleRouter(trailing_slash=False)
lists_router.register(r"all/?", ListViewset, basename='lists')

urlpatterns = [
    path('api-auth/', include('rest_framework.urls')),
    path('', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    #path('lists/', ListViewset.as_view({'get': 'querylist'}), name='multiple_lists'),
    path('lists/', include(lists_router.urls)),
    path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]



"""Without the r'^stuffs/(?P<owner_id>.+)$' route, the filtering doesn't work anymore. 


urlpatterns = format_suffix_patterns([
    path('stuffs/', stuffs_views.StuffList.as_view()),
    path('stuffs/<int:pk>/', stuffs_views.StuffDetail.as_view()),
    re_path(r'^stuffs/(?P<owner_id>.+)$', stuffs_views.StuffsList.as_view())
])"""