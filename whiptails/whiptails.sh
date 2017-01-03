#!/bin/bash
#################################################################################
#################################################################################
################################### WHIPTAILS ###################################
#################################################################################
## This script is used to provide whiptails functions for Nexway's softgallery ##
## tools container. It allow to easily make some whiptails boxes.              ##
#################################################################################
## Author: FREVILLE Titouan <tfreville@nexway.com>                             ##
#################################################################################
init_select()
{
  spe_lang="fr"
  if [ $# -lt 4 ]
    then
      echo -n "Illegal number of parameters, you broke me :'( "
      echo "-- usage: init_select BACKTITLE TITLE QUESTION OPTIONS (HEIGHT) (WIDTH) (SPACE_BEFORE_OPTION)"
      return 1
  fi
  # eval `resize` 2> /dev/null
  SPACE=10
  if [ $# -ge 5 ]
    then LINES=$5
  fi
  if [ $# -ge 6 ]
    then COLUMNS=$6
  fi
  if [ $# -ge 7 ]
    then SPACE=$7
  fi
  BACKTITLE="$1"
  TITLE="$2"
  MENU="$3"
  OPTIONS=$4

  whiptail --clear \
    --backtitle "$BACKTITLE" \
    --title "$TITLE" \
    --menu "$MENU" \
    $LINES $COLUMNS $(( $LINES - $SPACE )) \
    "${OPTIONS[@]}" \
     2>&1 >/dev/tty
}

init_inputbox()
{
  if [ $# -lt 3 ]
    then
      echo -n "Illegal number of parameters, you broke me :'( "
      echo "-- usage: init_inputbox BACKTITLE TITLE QUESTION (DEFAULT_TEXT) (HEIGHT) (WIDTH)"
      return 1
  fi
  # eval `resize` 2> /dev/null
  TEXT=""
  if [ $# -ge 4 ]
    then LINES=$4
  fi
  if [ $# -ge 5 ]
    then COLUMNS=$5
  fi
  if [ $# -ge 6 ]
    then TEXT=$6
  fi
  BACKTITLE="$1"
  TITLE="$2"
  MENU="$3"
  whiptail --clear \
    --backtitle "$BACKTITLE" \
    --title "$TITLE" \
    --inputbox "$MENU" \
    $LINES $COLUMNS $TEXT \
    2>&1 >/dev/tty
}

init_checklist()
{
  # ### ### ### BEFORE OPERING ### ### ### #
  if [ $# -lt 4 ]
    then
      echo -n "Illegal number of parameters, you broke me :'( "
      echo "-- usage: init_checklist BACKTITLE TITLE QUESTION OPTIONS_TABLE (HEIGHT) (WIDTH) (SPACE_BEFORE_OPTION) "
      return 1
  fi
  # eval `resize` 2> /dev/null
  SPACE=10
  BACKTITLE="$1"
  TITLE="$2"
  MENU="$3"
  OPTIONS_TABLE="$5"
  LINES=${LINES:-22}
  COLUMNS=${COLUMNS:-100}

  whiptail --clear \
    --topleft \
    --backtitle "$BACKTITLE" \
    --title "$TITLE" \
    --checklist "$MENU" \
    $LINES $COLUMNS $(($LINES - $SPACE)) \
    ${OPTIONS_TABLE[@]} \
    2>&1 >/dev/tty
}