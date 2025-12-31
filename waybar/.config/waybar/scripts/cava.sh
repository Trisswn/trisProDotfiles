#!/bin/bash

bar=" ▂▃▄▅▆▇█"
dict="s/;//g;"

# Crea un diccionario para reemplazar números por barras
bar_len=${#bar}
i=0
while [ $i -lt $bar_len ]; do
  dict="${dict}s/$i/${bar:$i:1}/g;"
  i=$((i = i + 1))
done

# Hacemos una copia temporal de tu config real
config_file="/tmp/waybar_cava_config"
cp ~/.config/cava/config $config_file

# Forzamos la salida RAW al final del archivo temporal
# Esto permite usar TU config visual pero enviando texto a Waybar
echo "
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
" >>$config_file

# Ejecutamos cava con la config modificada
cava -p $config_file | sed -u "$dict"
