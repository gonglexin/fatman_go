# FatmanGo
![snake_zhangjiajie](https://github.com/gonglexin/fatman_go/raw/master/assets/static/images/snake_zhangjiajie.gif)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Deploy

### Build a docker image

```shell
docker build -t elixir-ubuntu:1_7_4-otp21 .
```

### Build releases

> Make sure bin/build is marked executable, with chmod +x bin/build

build our release and output it to rel/artifacts

```shell
docker run -v $PWD:/opt/build --rm -it elixir-ubuntu:1_7_4-otp21 /opt/build/bin/build
```
