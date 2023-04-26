flutter pub run easy_localization:generate  -O lib/core/init/localization -f keys -o locale_keys.g.dart --source-dir assets/lang

# Dosya adını ve içeriğini değişkenlere atayın
dosya="../lib/core/init/localization/locale_keys.g.dart"
icerik=$(cat "$dosya")

# Dosyanın tüm satırlarını silin
sed -i '1,$d' "$dosya"

# İlk satıra yeni bir yazı yazın
echo "// ignore_for_file: constant_identifier_names" > "$dosya"
echo "" >> "$dosya"

# Eski dosya içeriğini yeni satırın altına ekleyin
echo "$icerik" >> "$dosya"