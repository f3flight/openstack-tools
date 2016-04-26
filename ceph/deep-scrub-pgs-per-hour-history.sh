ceph pg dump --format json | json_pp | grep 'deep_scrub_stamp' | cut -c-50 | sort | uniq -c
