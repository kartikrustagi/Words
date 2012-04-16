class User < Sequel::Model(:users)

	User.unrestrict_primary_key

	def User.signup(username, password)
		User.create({
			:username => username,
			:password => OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), "", password),
			:created_at => Time.now
		})
	end

	def User.authenticate(username, password)
		user = self.first(:username => username) 
		user if user && (user.password == OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), "", password))
	end

end
