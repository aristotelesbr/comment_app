# Sinatra App

## To run

In directory

```bash
$ bundle install
```
```bash
$ rake db:create
```
```bash
$ rake db:migrate
```
```bash
$ shotgun config.ru
# Running on PORT => 9393
```
OR

```bash
$ puma -C config/puma.rb
# Running on PORT => 3000
```

Enjoy ☕️