class User < ApplicationRecord
    has_secure_password

    validates :username, uniqueness: { case_sensitive: false }
    validates :password, presence: true, confirmation: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true


    has_many :stats
    has_many :action_infos

    # self referencing relationship
    has_many :followers, foreign_key: :follower_id , class_name: "Friendship"
    has_many :followed, through: :followers
    has_many :followed, foreign_key: :followed_id, class_name: "Friendship"
    has_many :followers, through: :followed


    # Helper Methods 

    def total
        total = 0
        if self.stats.length <= 0
            return total
        else
            self.stats.each do |stat|
                total += stat.action_amount
            end
                return total
        end
    end

    def daily_total
        total = 0
        if self.stats.length <= 0
            return total
        else
            self.stats.each do |stat|
                if stat.logged_time == Date.today.strftime("%m-%d-%Y")
                    total += stat.action_amount
                else
                    total = 0
            end
        end
                return total
    end
end
end
