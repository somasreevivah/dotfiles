
#watch(1) is a very useful little tool when you want to see the results of a
#command changing over time.

#Unfortunately it seems that it doesn't support Unicode or colours in its
#output. This is a short bash function that does much of what watch can do, but
#with no trouble handling Unicode or coloured output.

while true; do
  (echo -en '\033[H'
    CMD="$@"
    bash -c "$CMD" | while read LINE; do 
      echo -n "$LINE"
      echo -e '\033[0K' 
    done
    echo -en '\033[J') | tac | tac 
  sleep 2 
done
