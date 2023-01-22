#!/bin/zsh
for f in "$@"
do
  filenames=( $f/*.(jpg|jpeg|tif|tiff|png )
  thedir="$(/usr/bin/basename "$f")"
  pics=${#filenames[@]}
  sheets=$( echo "scale=0; $pics/144+1" | /usr/bin/bc )
  offset=0
  for i in {1..$sheets}
  do
    if [ $i -lt $sheets ]; then
      count=144
      cols=16
    else;
      count=$( echo "scale=0; $pics%144" | /usr/bin/bc )
      temp=$( echo "scale=4; $count/144" | /usr/bin/bc )
      cols=$( echo "scale=0; sqrt($temp) * 16" | /usr/bin/bc )
    fi
    suffix=$(printf "%02d" "$i")
    nice -n 10 /opt/homebrew/bin/magick montage -auto-orient "${filenames[@]:$offset:$count}" -tile "$cols"x -geometry 240x240+4+4 -set label "%t" "$f/../$thedir-$suffix.jpg"
    offset=$offset+144
  done
done
