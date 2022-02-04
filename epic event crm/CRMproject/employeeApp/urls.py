from django.urls import path, include
from rest_framework_nested import routers
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

from employeeApp.views import ListViewset

lists_router = routers.SimpleRouter(trailing_slash=False)
lists_router.register(r"all/?", ListViewset, basename='lists')

urlpatterns = [
    path('api-auth/', include('rest_framework.urls')),
    path('', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('lists/', include(lists_router.urls)),
    path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]
