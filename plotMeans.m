function plotMeans(meanData)
  x = -10:0.1:10;
  plot (x, sin (x));
  %pairedData = [meanData(:, 1), meanData(:, 3)];
  %figure;
  %hold on;
  %plot(pairedData(1:40, :), 'k+','LineWidth', 2, 'MarkerSize', 7);
  %pairedData(1:40, :)
  %xlim([0 50])
  %ylim([0 100])
endfunction
