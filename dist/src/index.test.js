"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var index_1 = require("~/index");
describe("email-provider-info", function () {
    test("returns info for gmail", function () {
        var provider = (0, index_1.getEmailProvider)("john@gmail.com");
        expect(provider.name).toEqual("Gmail");
        expect(provider.url).toEqual("https://mail.google.com/");
    });
    test("returns info for googlemail", function () {
        var provider = (0, index_1.getEmailProvider)("john@googlemail.com");
        expect(provider.name).toEqual("Gmail");
        expect(provider.url).toEqual("https://mail.google.com/");
    });
    test("returns info for yahoo", function () {
        var provider = (0, index_1.getEmailProvider)("john@yahoo.com.br");
        expect(provider.name).toEqual("Yahoo!");
        expect(provider.url).toEqual("https://mail.yahoo.com/");
        provider = (0, index_1.getEmailProvider)("john@yahoo.com");
        expect(provider.name).toEqual("Yahoo!");
        expect(provider.url).toEqual("https://mail.yahoo.com/");
    });
    test("returns info for protonmail", function () {
        var provider = (0, index_1.getEmailProvider)("john@protonmail.com");
        expect(provider.name).toEqual("ProtonMail");
        expect(provider.url).toEqual("https://mail.protonmail.com/");
    });
    test("returns info for apple email", function () {
        var provider = (0, index_1.getEmailProvider)("john@icloud.com");
        expect(provider.name).toEqual("Apple iCloud");
        expect(provider.url).toEqual("https://www.icloud.com/mail/");
        provider = (0, index_1.getEmailProvider)("john@me.com");
        expect(provider.name).toEqual("Apple iCloud");
        expect(provider.url).toEqual("https://www.icloud.com/mail/");
    });
    test("returns info for mail.ru", function () {
        var provider = (0, index_1.getEmailProvider)("john@mail.ru");
        expect(provider.name).toEqual("Mail.ru");
        expect(provider.url).toEqual("https://mail.ru/");
    });
    test("returns info for aol", function () {
        var provider = (0, index_1.getEmailProvider)("john@aol.com");
        expect(provider.name).toEqual("AOL");
        expect(provider.url).toEqual("https://aol.com/");
    });
    test("returns info for zoho", function () {
        var provider = (0, index_1.getEmailProvider)("john@zoho.com");
        expect(provider.name).toEqual("Zoho");
        expect(provider.url).toEqual("https://mail.zoho.com/");
    });
    test("returns info for outlook", function () {
        var provider = (0, index_1.getEmailProvider)("john@outlook.com");
        expect(provider.name).toEqual("Outlook");
        expect(provider.url).toEqual("https://outlook.live.com/mail/");
        provider = (0, index_1.getEmailProvider)("john@hotmail.com");
        expect(provider.name).toEqual("Outlook");
        expect(provider.url).toEqual("https://outlook.live.com/mail/");
    });
    test("returns info for hey", function () {
        var provider = (0, index_1.getEmailProvider)("john@hey.com");
        expect(provider.name).toEqual("Hey");
        expect(provider.url).toEqual("https://app.hey.com/");
    });
    test("returns info for yandex", function () {
        var provider = (0, index_1.getEmailProvider)("john@yandex.com");
        expect(provider.name).toEqual("Yandex");
        expect(provider.url).toEqual("https://mail.yandex.com/");
    });
    test("returns info for tutanota", function () {
        var provider = (0, index_1.getEmailProvider)("john@tutanota.com");
        expect(provider.name).toEqual("Tutanota");
        expect(provider.url).toEqual("https://mail.tutanota.com/");
    });
    test("returns info for gmx", function () {
        var provider = (0, index_1.getEmailProvider)("john@gmx.com");
        expect(provider.name).toEqual("GMX");
        expect(provider.url).toEqual("https://navigator-bs.gmx.com/mail");
    });
    test("returns info for uol", function () {
        var provider = (0, index_1.getEmailProvider)("john@uol.com.br");
        expect(provider.name).toEqual("UOL");
        expect(provider.url).toEqual("https://email.uol.com.br/");
    });
    test("returns info for bol", function () {
        var provider = (0, index_1.getEmailProvider)("john@bol.com.br");
        expect(provider.name).toEqual("BOL");
        expect(provider.url).toEqual("https://email.bol.uol.com.br/");
    });
    test("returns empty object for unknown provider", function () {
        var provider = (0, index_1.getEmailProvider)("john@unknown.com");
        expect(provider.name).toEqual("");
        expect(provider.url).toEqual("");
    });
    test("extends provider list", function () {
        var customProvider = {
            name: "Custom",
            hosts: ["example.com"],
            url: "https://main.example.com",
        };
        index_1.providers.push(customProvider);
        var provider = (0, index_1.getEmailProvider)("john@example.com");
        index_1.providers.pop();
        expect(provider).toEqual(customProvider);
    });
});
//# sourceMappingURL=index.test.js.map