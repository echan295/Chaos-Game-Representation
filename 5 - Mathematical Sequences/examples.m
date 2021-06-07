%% Examples with digits of pi
% Create vector of digits of pi
n = 10000;
S = creatingPiArray(n);

% Plot CGR of digits of pi using a 10-gon
CGR_10sides(S);

% Plot CGR of digits of pi mod 4 using 4-gon
CGR_4sides(mod(S, 4), 0:3);

%% Examples using Fibonacci sequence
n = 1000; % Note after Matlab update, can only go up to max n = 1477 for Fibonacci function (anything greater will give you Inf)

% % Incorrect way (due to floating point): Getting Fibonacci sequence then taking the modulo
F = Fibonacci(n);
CGR_10sides(mod(F, 10));

% Correct way: Getting the modulo of the Fibonacci while creating the
% sequence
Fmod10 = Fibonacci_mod10(n);
CGR_10sides(Fmod10);


%% Examples using sequence of prime numbers
% Create array of prime numbers
n = 1000000;
S = primes(n);

% All prime numbers less than 1000000 mod 10
CGR_10sides(mod(S, 10));

% Prime numbers between 7 and 1000000 mod 10; vertices are 1, 3, 7, 9
CGR_4sides(mod(S(4:end), 10), [1, 3, 7, 9])

% Prime numbers between 7 and 1000000 mod 8; vertices are 1, 3, 5, 7
CGR_4sides(mod(S(4:end), 8), [1, 3, 5, 7])

% 103 + kth prime number mod 4
CGR_4sides(mod(S(104:end), 4), 0:3)