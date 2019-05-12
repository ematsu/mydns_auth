# DirectEdit for ruby users

Yet another script for MyDNS.JP users to renew let's encrypt certificate with manual authenticator

## Installation
Step1:

```bash
$ cd /your/domain/directory/
$ wget 'https://github.com/ematsu/mydns_auth/archive/master.zip' -O mydns_auth-master.zip
$ unzip ./mydns_auth-master.zip
$ cd /your/domain/directory/mydns_auth-master/
$ chmod 700 ./txtregist.rb ./txtdelete.rb
$ mv ./conf.yaml.template ./conf.yaml
$ chmod 600 ./conf.yaml
```

Step2:

```bash
edit "conf.yaml".

    MYDNSJP_MASTERID:  <Enter your masterid>
    MYDNSJP_MASTERPWD: <Enter your password>

```

## Usage

```bash
$ sudo certbot certonly --keep ¥
                        --no-eff-email ¥
                        --preferred-challenges dns ¥
                        --manual ¥
                        --manual-auth-hook /your/domain/directory/mydns_auth-master/txtregist.rb ¥
                        --manual-cleanup-hook /your/domain/directory/mydns_auth-master/txtdelete.rb ¥
                        --manual-public-ip-logging-ok ¥
                        --server https://acme-v02.api.letsencrypt.org/directory ¥
                        --agree-tos ¥
                        -m <your registered email address> ¥
                        -d <your domain> -d *.<your domain>
```

## Development

Nothing special.

## Contributing

Nothing special.

## License

This script is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

