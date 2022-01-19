import pytest
from ..admin import UserCreationForm


class TestPasswordAndSave:
    def setup(self):
        self.right_password = 'testpassword'
        self.wrong_password = 'wrongpassword'
    
    @pytest.mark.django_db
    def test_matching_password2(self, mocker):
        user_creation_instance = UserCreationForm()
        user_creation_instance.password1 = self.right_password
        user_creation_instance.password2 = self.right_password

        
        with pytest.raises(Exception) as e_info:
            UserCreationForm.clean_password2(self)

        assert "Passwords don't match" in str(e_info.value)
