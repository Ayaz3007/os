#!/bin/bash
RED='\e [31m'
GREEN="\e [32m"
RESET='\e [0m'
declare -i counter=1
declare -i hit=0
declare -i miss=0
declare -a numbers
while :
do
  ans=${RANDOM: -1}
  echo "Step: ${counter}"
  counter+=1
  read -p "Please enter number from 0 to 9(q-quit): " input
  case "${input}" in
    [0-9])
      if [[ ${ans} == ${input} ]];
        then
          echo "Hit! My number: ${ans})"
          hit+=1
          str="${GREEN}${input}${RESET}"
          numbers+=(${str})
        else
          echo "Miss! My number: ${ans}"
          miss+=1
          str="${RED}${input}${RESET}"
          numbers+=(${str})
      fi
      total=$(( hit+miss ))
      let hit_percent=hit*100/total
      let miss_percent=miss*100/total
      echo "Hit: ${hit_percent}%" "Miss: ${miss_percent}%"
      echo -e "Last 10 items: ${numbers[@]: -10}"
      ;;
    q)
      echo "Bye"
      break
    ;;
    *)
      echo "Not valid input"
  esac
done
exit 0