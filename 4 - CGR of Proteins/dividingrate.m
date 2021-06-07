function r = dividingrate(n)
% ------------------------------------------
% Calculate the dividing ratio based on the number of vertices in the
% n-gon. Formula is based on Almeida and Vinga (2009)
% 
% n: number of vertices in the n-gon
% ------------------------------------------
  k = round((n+2)/4);
  r = (2*cos(pi*(1/2 - k/n))-2*cos(pi*(1/2 - 1/(2*n)))*cos((2*k-1)*(pi/(2*n)))*(1 + (tan((2*k-1)*(pi/(2*n))))/(tan(pi - (n + 2*k - 2)*(pi/(2*n))))))/(2*cos(pi*(1/2 - k/n)));
end