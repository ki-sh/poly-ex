#!/bin/bash
shopt -s expand_aliases
source "$HOME/.kish/aliases.sh"

yr build apps/acme 
yr build apps/wakanda 
yr build apps/wayne-ind 
yr build packages/ui-components 

yr dev apps/acme &
yr dev apps/wakanda &
yr dev apps/wayne-ind &
yr dev packages/ui-components &&

    # cleanup
    killall node
# or wondows: taskkill /im node.exe
