class PagePolicy < Struct.new(:user, :page)
  def sign_out?
    user
  end
end