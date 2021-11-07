class Developer < ApplicationRecord
    # association
    has_one :team

    # validation
    validates :first_name, :last_name, :email_id, :github_id, :phone_number, presence: {message: "field is blank"}
    validates :first_name, :last_name , format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :first_name, :last_name, :profile, :email_id, :github_id, :phone_number, length: { minimum: 2,
    message: "should have minimum 2 letters"}

    # callback
    before_save :merge_country_code, :normalize_name
    after_destroy :update_log

    

    def merge_country_code
        self.phone_number = "+91 " + self.phone_number 
    end

    def normalize_name
      self.first_name = first_name.downcase.titleize
    end
    
    def update_log
        logger.info "A developer has been removed id = #{self.id} and name =  #{self.first_name} #{self.last_name}  "
    end
end
