function round = playDreidel(coinsPerPlayer, numPlayers)
  gameOver = 0;
  playerCoins = coinsPerPlayer * ones(1, numPlayers);
  players = [playerCoins; flip(1:numPlayers)];
  pot = 0;
  round = 0;
  playerTurn = 0;
  turn = 0;
  
  while(!gameOver)
    round++;
    players(1,:) -= 1;
    
    killedPlayers = flip(find(players(1,:) < 0));
    for i=killedPlayers
      players = [players(:,1:i-1), players(:, i+1:end)];      
    endfor
    
    if(size(players)(2) <= 1)
      round--;
    endif
    
    [t, playerTurn] =  max(players(2,:));
    players(2, playerTurn) = 0;
    players(2, :) += 1;
    
    pot += length(players);
    
    roll = ceil(rand() * 4);
    switch(roll)
      case 1
        %"gimel\n"
        players(1, playerTurn) += pot;
        pot = 0;
      case 2
        %"hei\n"
        players(1, playerTurn) += ceil(pot/2);
        pot -= ceil(pot/2);
      case 3
        %"shin\n"
        if(players(1, playerTurn) > 0)
          players(1, playerTurn) -= 1;
          pot += 1;
        else
          players = [players(:, 1:playerTurn-1), players(:,playerTurn+1:end)];
        endif
      case 4
        %"nun\n"
    endswitch
    
    gameOver = size(players)(2) <= 1;
  endwhile
  
endfunction
