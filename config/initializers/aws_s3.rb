require 'aws-sdk-s3' # Certifique-se de carregar a biblioteca AWS SDK

Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new('u2X2OnLooKKUFKJL-8C7eF4vV2l9u0rk', 'LvSDYi3exqnf2MlTQDhSWwGR7X_o84nU'),
  endpoint: 'https://storage.seduc.ro.gov.br',
  force_path_style: true,
  ssl_ca_bundle: Rails.root.join('config/cert.pem').to_s # Use o certificado completo
})
