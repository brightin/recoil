module Recoil
  Email = Struct.new(:email) do
    def blacklisted?
      Recoil.blacklist_threshold.call(scope)
    end

    def to_s
      email
    end

    private

    def scope
      Bounce.where(email: email)
    end
  end
end
