function meanData1 = generateMeanData(maxCoins, maxPlayers)
  
  meanData1 = zeros(maxCoins * (maxPlayers - 1), 3); 
  mean = 0;
  runAmount = 1;
  for numPlayers = 2:maxPlayers
    results = zeros(runAmount, 1);
    for numCoins = 1:maxCoins
      if(numCoins <= 10)
        runAmount = 1000;
      elseif(numCoins <= 20)
        runAmount = 500;
      elseif(numCoins <= 30)
        runAmount = 100;
      elseif(numCoins <= 40)
        runAmount = 50;
      else
        runAmount = 10;
      end
      runAmount = ceil(runAmount / (numPlayers - 1)); 
      for i=1:runAmount
        results(i, 1) = playDreidel(numCoins, numPlayers);
      end
      [numCoins, numPlayers]
      
      mean = sum(results) / runAmount;
      meanData1((numPlayers - 2) * maxCoins + numCoins, :) = [numCoins, numPlayers, mean];
    endfor
  endfor
  
endfunction
