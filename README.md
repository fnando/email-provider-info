# email-provider-info

Find email provider service based on the email address.

[![Tests](https://github.com/fnando/email-provider-info/workflows/js-tests/badge.svg)](https://github.com/fnando/email-provider-info)
[![NPM](https://img.shields.io/npm/v/@fnando/email-provider-info.svg)](https://npmjs.org/package/@fnando/email-provider-info)
[![NPM](https://img.shields.io/npm/dt/@fnando/email-provider-info.svg)](https://npmjs.org/package/@fnando/email-provider-info)

## Installation

This package is available as a NPM package. To install it, use the following
command:

```bash
npm install @fnando/email-provider-info --save
```

If you're using Yarn (and you should):

```bash
yarn add @fnando/email-provider-info
```

## Usage

```js
import { getEmailProvider } from "@fnando/email-provider-info";

const { name, url } = getEmailProvider("example@gmail.com");

if (url) {
  // Do something
}
```

The idea behind this package is enabling something like this, where users can go
to their email service provider with just one click.

![Example: Show button that goes straight to Gmail](https://raw.githubusercontent.com/fnando/email-provider-info/main/sample.png)

## Maintainer

- [Nando Vieira](https://github.com/fnando)

## Contributors

- https://github.com/fnando/email-provider-info/contributors

## Contributing

For more details about how to contribute, please read
https://github.com/fnando/email-provider-info/blob/main/CONTRIBUTING.md.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT). A copy of the license can be
found at https://github.com/fnando/email-provider-info/blob/main/LICENSE.md.

## Code of Conduct

Everyone interacting in the email-provider-info project's codebases, issue
trackers, chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/fnando/email-provider-info/blob/main/CODE_OF_CONDUCT.md).
