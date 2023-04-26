alias="upload_keystore"

# start - Generate key
keytool -genkey -v -keystore "$(pwd)/../android/app/$alias.jks" -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias $alias
# end - Generate key