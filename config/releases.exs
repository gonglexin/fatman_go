# config :fatman_go, FatmanGoWeb.Endpoint,
#   http: [ip: {0, 0, 0, 0}, port: {:system, "PORT"}],
#   url: [host: "localhost", port: {:system, "PORT"}],
#   check_origin: false,
#   server: true,
#   root: ".",
#   version: Application.spec(:fatman_go, :vsn),
#   secret_key_base: "JTyObHiSXVLtdSF0IANmkgYgl20MZt6RT6aaQUM9pUK1jir9bgNwfGIJITYwgzli"


# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :fatman_go, FatmanGoWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  check_origin: false,
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
config :fatman_go, FatmanGoWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.

