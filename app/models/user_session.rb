class UserSession < Authlogic::Session::Base
	remember_me(true)
	remember_me_for 4.days
end
