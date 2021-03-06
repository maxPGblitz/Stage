#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
source "/pg/stage/functions/core.sh"
emergency() {

  variable /pg/var/emergency.display "On"
if [[ $(ls /pg/var/emergency) != "" ]]; then

# If not on, do not display emergency logs
if [[ $(cat /pg/var/emergency.display) == "On" ]]; then

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  Emergency & Warning Log Generator | Visit - http://emlog.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
NOTE: This can be turned [On] or Off in Settings!

EOF

  countmessage=0
  while read p; do
    let countmessage++
    echo -n "${countmessage}. " && cat /pg/var/emergency/$p
  done <<< "$(ls /pg/var/emergency)"

  echo
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  read -n 1 -s -r -p "Acknowledge Info | Press [ENTER]"
  echo
else
  touch /pg/var/emergency.log
fi; fi
}
