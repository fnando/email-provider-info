// eslint-disable-next-line @fnando/consistent-import/consistent-import
import { getEmailProvider } from "~/index";

describe("email-provider-info", () => {
  test("returns info for gmail", () => {
    const provider = getEmailProvider("john@gmail.com");

    expect(provider.name).toEqual("Gmail");
    expect(provider.url).toEqual("https://mail.google.com/");
  });

  test("returns info for googlemail", () => {
    const provider = getEmailProvider("john@googlemail.com");

    expect(provider.name).toEqual("Gmail");
    expect(provider.url).toEqual("https://mail.google.com/");
  });

  test("returns info for yahoo", () => {
    let provider = getEmailProvider("john@yahoo.com.br");

    expect(provider.name).toEqual("Yahoo!");
    expect(provider.url).toEqual("https://mail.yahoo.com/");

    provider = getEmailProvider("john@yahoo.com");

    expect(provider.name).toEqual("Yahoo!");
    expect(provider.url).toEqual("https://mail.yahoo.com/");
  });

  test("returns info for protonmail", () => {
    const provider = getEmailProvider("john@protonmail.com");

    expect(provider.name).toEqual("ProtonMail");
    expect(provider.url).toEqual("https://mail.protonmail.com/");
  });

  test("returns info for apple email", () => {
    let provider = getEmailProvider("john@icloud.com");

    expect(provider.name).toEqual("Apple iCloud");
    expect(provider.url).toEqual("https://www.icloud.com/mail/");

    provider = getEmailProvider("john@me.com");

    expect(provider.name).toEqual("Apple iCloud");
    expect(provider.url).toEqual("https://www.icloud.com/mail/");
  });

  test("returns info for mail.ru", () => {
    const provider = getEmailProvider("john@mail.ru");

    expect(provider.name).toEqual("Mail.ru");
    expect(provider.url).toEqual("https://mail.ru/");
  });

  test("returns info for aol", () => {
    const provider = getEmailProvider("john@aol.com");

    expect(provider.name).toEqual("AOL");
    expect(provider.url).toEqual("https://aol.com/");
  });

  test("returns info for zoho", () => {
    const provider = getEmailProvider("john@zoho.com");

    expect(provider.name).toEqual("Zoho");
    expect(provider.url).toEqual("https://mail.zoho.com/");
  });

  test("returns info for outlook", () => {
    let provider = getEmailProvider("john@outlook.com");

    expect(provider.name).toEqual("Outlook");
    expect(provider.url).toEqual("https://outlook.live.com/mail/");

    provider = getEmailProvider("john@hotmail.com");

    expect(provider.name).toEqual("Outlook");
    expect(provider.url).toEqual("https://outlook.live.com/mail/");
  });

  test("returns info for hey", () => {
    const provider = getEmailProvider("john@hey.com");

    expect(provider.name).toEqual("Hey");
    expect(provider.url).toEqual("https://app.hey.com/");
  });

  test("returns info for yandex", () => {
    const provider = getEmailProvider("john@yandex.com");

    expect(provider.name).toEqual("Yandex");
    expect(provider.url).toEqual("https://mail.yandex.com/");
  });

  test("returns info for tutanota", () => {
    const provider = getEmailProvider("john@tutanota.com");

    expect(provider.name).toEqual("Tutanota");
    expect(provider.url).toEqual("https://mail.tutanota.com/");
  });

  test("returns info for gmx", () => {
    const provider = getEmailProvider("john@gmx.com");

    expect(provider.name).toEqual("GMX");
    expect(provider.url).toEqual("https://navigator-bs.gmx.com/mail");
  });

  test("returns info for uol", () => {
    const provider = getEmailProvider("john@uol.com.br");

    expect(provider.name).toEqual("UOL");
    expect(provider.url).toEqual("https://email.uol.com.br/");
  });

  test("returns info for bol", () => {
    const provider = getEmailProvider("john@bol.com.br");

    expect(provider.name).toEqual("BOL");
    expect(provider.url).toEqual("https://email.bol.uol.com.br/");
  });

  test("returns empty objet for unknown provider", () => {
    const provider = getEmailProvider("john@unknown.com");

    expect(provider.name).toEqual("");
    expect(provider.url).toEqual("");
  });
});
