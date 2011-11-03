class Imified::Userkey
  def self.find(recipient)
    if recipient.include?('@')
      find_userkey_by_email(recipient)
    else
      recipient
    end
  end

  private

  def self.find_userkey_by_email(email, attempt = 1)
    Imified.user_list ||= Imified.get_all_users
    recipient = Imified.user_list.xpath("//user/screenname[text() = '#{email}']/../userkey/text()").map(&:to_s).join(',')
    recipient = update_users_and_try_again(email) if recipient.nil? && attempt == 1
    recipient
  end

  def self.update_users_and_try_again(email)
    Imified.get_all_users
    self.find_userkey_by_email(email, 2)
  end

end
