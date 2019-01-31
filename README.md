# Intro :
Read the rules of the game their : https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life
This Implementation was developped with Ruby 2.2.1 by Rémi Meunier
1/ You can find the implementation of the game under `./app/game_of_life`
2/ The console ploting was not optimized, and the console interaction is not proofed.
   Please enter the input as specify, or it may break
3/ The univers is expendable, and we will always print the full known univer.
   The known univer is every point inbetween of the center of the univer (0,0) and when
   a cell was once alive
4/ You can change the rules of the game by changing const in `./app/utils/constants_rules`
5/ You can create basi patterns inside `./app/utils/basic_patterns`

## Get started :
Assuming you have ruby :
Install bundle : `gen bundle install`
install needed gem : `bundle install`

Start the game : `ruby ./main.rb`

## Run Test :
Only the file under `./app/game_of_life` are tested
run `rspec spec`
