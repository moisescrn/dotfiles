#!/bin/bash
# Script that creates lists of all installed packages
# differentiating between the official and inofficial

name_all=all_pcklst.txt
name_allnew=allnew_pcklst.txt # all after the initial set up
name_official=offi_pcklst.txt
name_rest=rest_pcklst.txt

/usr/bin/pacman -Q > ~/SystemMaintenance/Packages/$name_all
/usr/bin/pacman -Qe > ~/SystemMaintenance/Packages/$name_allnew
/usr/bin/pacman -Qen > ~/SystemMaintenance/Packages/$name_official
/usr/bin/pacman -Qm > ~/SystemMaintenance/Packages/$name_rest
