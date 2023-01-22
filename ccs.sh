#!bin/zsh
for f in "$@"
do
  pics=$( /bin/ls -1U "$f"/* | wc -l )
  n=$( echo "scale=4; $pics/144" | /usr/bin/bc )
  cols=$( echo "scale=0; sqrt($n) * 16" | /usr/bin/bc )
  thedir="$(/usr/bin/basename "$f")"
  nice -n 10 /opt/homebrew/bin/magick montage -auto-orient "$f/*.(jpg|jpeg|tif|tiff|png)" -tile "$cols"x -geometry 240x240+4+4 -set label "%t" "$f/../$thedir.jpg"
done
