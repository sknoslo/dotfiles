i3-msg 'workspace 3:term; append_layout /home/steffen/.i3/workspace-3.json'

urxvt -name left &
urxvt -name topright -e 'ranger' &
urxvt -name bottomright -e 'ncmpcpp'
