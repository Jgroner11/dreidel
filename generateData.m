function data1 = generateData(numCoins, numPlayers, runAmount)
  data1 = zeros(runAmount, 3); 
  result = [];
  
  for i=1:runAmount
     result = playDreidel(numCoins, numPlayers);
     data1(i, :) = [numCoins, numPlayers, result];
  end
  
  save data1.mat data1;

endfunction
