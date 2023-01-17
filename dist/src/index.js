"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getEmailProvider = exports.providers = void 0;
var providers_json_1 = __importDefault(require("../data/providers.json"));
exports.providers = providers_json_1.default;
function getEmailProvider(email) {
    var _a;
    var _b = email.split("@"), host = _b[1];
    return ((_a = exports.providers.find(function (provider) { return provider.hosts.includes(host); })) !== null && _a !== void 0 ? _a : {
        name: "",
        url: "",
        hosts: [],
    });
}
exports.getEmailProvider = getEmailProvider;
//# sourceMappingURL=index.js.map