class User < ActiveRecord::Base
	include BCrypt

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

	def self.authenticate(user_info)
		user = User.find_by(username: user_info[:username])
		if user && user.password == user_info[:password]
			return user
		else
			return nil
		end
	end
end
