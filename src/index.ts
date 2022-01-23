// eslint-disable-next-line @fnando/consistent-import/consistent-import
import providersData from "../data/providers.json";

export type EmailProvider = {
  name: string;
  url: string;
  hosts: string[];
};

export const providers: EmailProvider[] = providersData as EmailProvider[];

export function getEmailProvider(email: string): EmailProvider {
  const [, host] = email.split("@");

  return (
    providers.find((provider) => provider.hosts.includes(host)) ?? {
      name: "",
      url: "",
      hosts: [],
    }
  );
}
