export type EmailProvider = {
    name: string;
    url: string;
    hosts: string[];
};
export declare const providers: EmailProvider[];
export declare function getEmailProvider(email: string): EmailProvider;
