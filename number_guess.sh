#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

UPDATE_USER_DATA(){
  EXTRACT_GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_info WHERE username='$USERNAME'")
  GAMES_PLAYED=$[$EXTRACT_GAMES_PLAYED+1]
  EXTRACT_BEST_GAME=$($PSQL "SELECT best_game FROM user_info WHERE username='$USERNAME'")
  if [[ $EXTRACT_BEST_GAME -eq 0 ]]
  then
    BEST_GAME=$COUNT
  else
    if [[ $EXTRACT_BEST_GAME < $COUNT ]]
    then
      BEST_GAME=$EXTRACT_BEST_GAME
    else
      BEST_GAME=$COUNT
    fi
  fi
  UPDATE_USER_STATS=$($PSQL "UPDATE user_info SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username = '$USERNAME'")
}

GUESS_NUMBER(){
  COUNT=1
  NUMBER=$((RANDOM%1000))
  echo -e "\nGuess the secret number between 1 and 1000:"
  read GUESS
  while [[ $GUESS != $NUMBER ]]
  do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    COUNT=$[$COUNT+1]
    echo -e "\nThat is not an integer, guess again:"
    read GUESS
  else
    if [[ $GUESS -ge 1000 ]]
    then
      echo -e "\nIt's lower than that, guess again:"
      COUNT=$[$COUNT+1]
      read GUESS
    else
      if [[ $GUESS < $NUMBER ]]
      then
        echo -e "\nIt's higher than that, guess again:"
        COUNT=$[$COUNT+1]
        read GUESS
      else
        echo -e "\nIt's lower than that, guess again:"
        COUNT=$[$COUNT+1]
        read GUESS
      fi
    fi
  fi
  done
  echo -e "\nYou guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"
  UPDATE_USER_DATA
}  
  
echo "Enter your username:"
read USERNAME
SEARCH_USERNAME=$($PSQL "SELECT username FROM user_info WHERE username='$USERNAME' ")
if [[ -z $SEARCH_USERNAME ]]
then 
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO user_info(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
else
  SEARCH_USERNAME_DATA=$($PSQL "SELECT username, games_played, best_game FROM user_info WHERE username='$USERNAME' ")
  echo $SEARCH_USERNAME_DATA | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi
GUESS_NUMBER
