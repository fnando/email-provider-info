# frozen_string_literal: true

require "test_helper"

class EmailProviderInfoTest < Minitest::Test
  test "returns info for gmail" do
    provider = EmailProviderInfo.call("john@gmail.com")

    assert_equal provider.name, "Gmail"
    assert_equal provider.url, "https://mail.google.com/"
  end

  test "returns info for googlemail" do
    provider = EmailProviderInfo.call("john@googlemail.com")

    assert_equal provider.name, "Gmail"
    assert_equal provider.url, "https://mail.google.com/"
  end

  test "returns info for yahoo" do
    provider = EmailProviderInfo.call("john@yahoo.com.br")

    assert_equal provider.name, "Yahoo!"
    assert_equal provider.url, "https://mail.yahoo.com/"

    provider = EmailProviderInfo.call("john@yahoo.com")

    assert_equal provider.name, "Yahoo!"
    assert_equal provider.url, "https://mail.yahoo.com/"
  end

  test "returns info for protonmail" do
    provider = EmailProviderInfo.call("john@protonmail.com")

    assert_equal provider.name, "ProtonMail"
    assert_equal provider.url, "https://mail.protonmail.com/"
  end

  test "returns info for apple email" do
    provider = EmailProviderInfo.call("john@icloud.com")

    assert_equal provider.name, "Apple iCloud"
    assert_equal provider.url, "https://www.icloud.com/mail/"

    provider = EmailProviderInfo.call("john@me.com")

    assert_equal provider.name, "Apple iCloud"
    assert_equal provider.url, "https://www.icloud.com/mail/"
  end

  test "returns info for mail.ru" do
    provider = EmailProviderInfo.call("john@mail.ru")

    assert_equal provider.name, "Mail.ru"
    assert_equal provider.url, "https://mail.ru/"
  end

  test "returns info for aol" do
    provider = EmailProviderInfo.call("john@aol.com")

    assert_equal provider.name, "AOL"
    assert_equal provider.url, "https://aol.com/"
  end

  test "returns info for zoho" do
    provider = EmailProviderInfo.call("john@zoho.com")

    assert_equal provider.name, "Zoho"
    assert_equal provider.url, "https://mail.zoho.com/"
  end

  test "returns info for outlook" do
    provider = EmailProviderInfo.call("john@outlook.com")

    assert_equal provider.name, "Outlook"
    assert_equal provider.url, "https://outlook.live.com/mail/"

    provider = EmailProviderInfo.call("john@hotmail.com")

    assert_equal provider.name, "Outlook"
    assert_equal provider.url, "https://outlook.live.com/mail/"
  end

  test "returns info for hey" do
    provider = EmailProviderInfo.call("john@hey.com")

    assert_equal provider.name, "Hey"
    assert_equal provider.url, "https://app.hey.com/"
  end

  test "returns info for yandex" do
    provider = EmailProviderInfo.call("john@yandex.com")

    assert_equal provider.name, "Yandex"
    assert_equal provider.url, "https://mail.yandex.com/"
  end

  test "returns info for tutanota" do
    provider = EmailProviderInfo.call("john@tutanota.com")

    assert_equal provider.name, "Tutanota"
    assert_equal provider.url, "https://mail.tutanota.com/"
  end

  test "returns info for gmx" do
    provider = EmailProviderInfo.call("john@gmx.com")

    assert_equal provider.name, "GMX"
    assert_equal provider.url, "https://navigator-bs.gmx.com/mail"
  end

  test "returns info for uol" do
    provider = EmailProviderInfo.call("john@uol.com.br")

    assert_equal provider.name, "UOL"
    assert_equal provider.url, "https://email.uol.com.br/"
  end

  test "returns info for bol" do
    provider = EmailProviderInfo.call("john@bol.com.br")

    assert_equal provider.name, "BOL"
    assert_equal provider.url, "https://email.bol.uol.com.br/"
  end

  test "returns nil for unknown provider" do
    provider = EmailProviderInfo.call("john@unknown.com")

    assert_nil provider
  end
end
