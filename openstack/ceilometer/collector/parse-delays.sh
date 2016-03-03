tail -f $1 | perl -ne '$| = 1; print "$1\t$2 $3$4\n" if /(.{23})[^@]+@ (.{10}).(.{8})(\.\d+)?/' | while read l
do
  d1=$(echo "$l" | cut -d$'\t' -f1)
  d2=$(echo "$l" | cut -d$'\t' -f2)
  echo -e $l'\t'$(( ( $(date -ud "$d1" +'%s') - $(date -ud "$d2" +'%s') ) ))
done
