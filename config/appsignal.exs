use Mix.Config

config :appsignal, :config,
  otp_app: :fatman_go,
  name: "FatmanGo",
  push_api_key: "8a62ed3c-6c53-4c3d-b5fc-4cf3943d5290",
  env: Mix.env,
  active: true
