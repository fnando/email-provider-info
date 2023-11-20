# frozen_string_literal: true

require "test_helper"

class EmailProviderInfoTest < Minitest::Test
  test "returns info for gmail" do
    provider = EmailProviderInfo.call("john@gmail.com")

    assert_equal "Gmail", provider.name
    assert_equal "https://mail.google.com/", provider.url
    assert_equal "https://mail.google.com/mail/u/john%40gmail.com/#search/from%3Asender%40example.com+in%3Aanywhere+newer_than%3A1h",
                 provider.search_url(sender: "sender@example.com")
  end

  test "returns info for googlemail" do
    provider = EmailProviderInfo.call("john@googlemail.com")

    assert_equal "Gmail", provider.name
    assert_equal "https://mail.google.com/", provider.url
    assert_equal "https://mail.google.com/mail/u/john%40googlemail.com/#search/from%3Asender%40example.com+in%3Aanywhere+newer_than%3A1h",
                 provider.search_url(sender: "sender@example.com")
  end

  test "returns info for yahoo" do
    provider = EmailProviderInfo.call("john@yahoo.com.br")

    assert_equal "Yahoo!", provider.name
    assert_equal "https://mail.yahoo.com/", provider.url
    assert_equal "https://mail.yahoo.com/d/search/keyword=from%253Asender%40example.com",
                 provider.search_url(sender: "sender@example.com")

    provider = EmailProviderInfo.call("john@yahoo.com")

    assert_equal "Yahoo!", provider.name
    assert_equal "https://mail.yahoo.com/", provider.url
    assert_equal "https://mail.yahoo.com/d/search/keyword=from%253Asender%40example.com",
                 provider.search_url(sender: "sender@example.com")
  end

  test "returns info for protonmail" do
    now = Time.parse("2023-01-01T00:00:00Z")
    Time.stubs(:now).returns(now)

    provider = EmailProviderInfo.call("john@protonmail.com")

    assert_equal "ProtonMail", provider.name
    assert_equal "https://mail.protonmail.com/", provider.url
    assert_equal "https://mail.proton.me/u/0/all-mail#from=sender%40example.com&begin=1672527600",
                 provider.search_url(sender: "sender@example.com")
  end

  test "returns info for apple email" do
    provider = EmailProviderInfo.call("john@icloud.com")

    assert_equal "Apple iCloud", provider.name
    assert_equal "https://www.icloud.com/mail/", provider.url
    assert_equal "https://www.icloud.com/mail/", provider.search_url

    provider = EmailProviderInfo.call("john@me.com")

    assert_equal "Apple iCloud", provider.name
    assert_equal "https://www.icloud.com/mail/", provider.url
    assert_equal "https://www.icloud.com/mail/", provider.search_url
  end

  test "returns info for mail.ru" do
    provider = EmailProviderInfo.call("john@mail.ru")

    assert_equal "Mail.ru", provider.name
    assert_equal "https://mail.ru/", provider.url
    assert_equal "https://mail.ru/", provider.search_url
  end

  test "returns info for aol" do
    provider = EmailProviderInfo.call("john@aol.com")

    assert_equal "AOL", provider.name
    assert_equal "https://aol.com/", provider.url
    assert_equal "https://aol.com/", provider.search_url
  end

  test "returns info for zoho" do
    provider = EmailProviderInfo.call("john@zoho.com")

    assert_equal "Zoho", provider.name
    assert_equal "https://mail.zoho.com/", provider.url
    assert_equal "https://mail.zoho.com/", provider.search_url
  end

  test "returns info for outlook" do
    provider = EmailProviderInfo.call("john@outlook.com")

    assert_equal "Outlook", provider.name
    assert_equal "https://outlook.live.com/mail/", provider.url
    assert_equal "https://outlook.live.com/mail/?login_hint=john%40outlook.com",
                 provider.search_url

    provider = EmailProviderInfo.call("john@hotmail.com")

    assert_equal "Outlook", provider.name
    assert_equal "https://outlook.live.com/mail/", provider.url
    assert_equal "https://outlook.live.com/mail/?login_hint=john%40hotmail.com",
                 provider.search_url
  end

  test "returns info for hey" do
    provider = EmailProviderInfo.call("john@hey.com")

    assert_equal "Hey", provider.name
    assert_equal "https://app.hey.com/", provider.url
    assert_equal "https://app.hey.com/", provider.search_url
  end

  test "returns info for yandex" do
    provider = EmailProviderInfo.call("john@yandex.com")

    assert_equal "Yandex", provider.name
    assert_equal "https://mail.yandex.com/", provider.url
    assert_equal "https://mail.yandex.com/", provider.search_url
  end

  test "returns info for tuta" do
    now = Time.parse("2023-01-01T00:00:00Z")
    Time.stubs(:now).returns(now)

    provider = EmailProviderInfo.call("john@tutanota.com")

    assert_equal "Tuta", provider.name
    assert_equal "https://app.tuta.com/", provider.url
    assert_equal "https://app.tuta.com/search/mail?query=sender%40example.com&end=1672527600",
                 provider.search_url(sender: "sender@example.com")
  end

  test "returns info for gmx" do
    provider = EmailProviderInfo.call("john@gmx.com")

    assert_equal "GMX", provider.name
    assert_equal "https://navigator-bs.gmx.com/mail", provider.url
  end

  test "returns info for uol" do
    provider = EmailProviderInfo.call("john@uol.com.br")

    assert_equal "UOL", provider.name
    assert_equal "https://email.uol.com.br/", provider.url
    assert_equal "https://email.uol.com.br/", provider.search_url
  end

  test "returns info for bol" do
    provider = EmailProviderInfo.call("john@bol.com.br")

    assert_equal "BOL", provider.name
    assert_equal "https://email.bol.uol.com.br/", provider.url
    assert_equal "https://email.bol.uol.com.br/", provider.search_url
  end

  test "returns nil for unknown provider" do
    provider = EmailProviderInfo.call("john@unknown.com")

    assert_nil provider
  end
end
