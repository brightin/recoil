module Recoil
  Email = Struct.new(:bounces) do
    def self.blacklisted?(email)
      new(Bounce.where(email: email).count).blacklisted?
    end

    def blacklisted?
      Recoil.blacklist_threshold.call(self)
    end
  end
end
