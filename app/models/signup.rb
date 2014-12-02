class Signup
  include ActiveModel::Model

  attr_accessor :user_email, :company_name, :user

  validates :user_email, presence: true
  validates :company_name, presence: true

  def save
    if valid?
      @user = User.create(email: user_email)
      @user.create_company(name: company_name)
    end
  end
end
