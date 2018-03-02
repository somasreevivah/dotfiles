#! /usr/bin/env bash
#vim-run: bash %

address=70:26:05:10:B2:C3
card=bluez_card.$(sed s/:/_/g <<<${address})
sink=bluez_sink.$(sed s/:/_/g <<<${address})

#sudo systemctl restart bluetooth.service
#pulseaudio -k
bluetoothctl <<EOF
power on
scan on
connect ${address}
quit
EOF

sleep 2
pacmd set-card-profile ${card} a2dp_sink
pacmd set-default-sink ${sink}
