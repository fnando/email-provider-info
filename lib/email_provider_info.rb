# frozen_string_literal: true

module EmailProviderInfo
  require "email_provider_info/version"

  class Value
    attr_reader :email, :name, :url, :hosts

    def initialize(name:, email:, url:, search:, hosts:)
      @name = name
      @email = email
      @url = url
      @search = search
      @hosts = hosts
    end

    def search_url(sender: nil)
      @search
        .gsub("%{sender}", CGI.escapeURIComponent(sender.to_s))
        .gsub("%{email}", CGI.escapeURIComponent(email.to_s))
        .gsub("%{timestamp}", (Time.now.to_i - 3600).to_s)
    end
  end

  def self.providers
    @providers ||= JSON.parse(
      File.read(File.join(__dir__, "../data/providers.json")),
      symbolize_names: true
    )
  end

  def self.call(email)
    host = email.to_s.downcase.split("@").last

    info = providers.find {|provider| provider[:hosts].include?(host) }

    Value.new(**info, email: email) if info
  end
end
