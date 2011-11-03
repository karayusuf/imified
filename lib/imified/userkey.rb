class Imified::Userkey

  def self.find(recipient)
    Imified.user_list ||= Imified.get_all_users

    if recipient.include?('@')
      Imified.user_list.xpath("//user/screenname[text() = '#{recipient}']/../userkey/text()").map(&:to_s).join(',')
    else
      recipient
    end
  end

end
