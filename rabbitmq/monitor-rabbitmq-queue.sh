while true
do
  sample_data="$(rabbitmqctl list_queues name consumers messages | grep $1 | cut -f2- | sed 's/ /\t/')"
  echo -e "$(date '+%Y-%m-%d %H:%M:%S.%N')\t$sample_data"
done
