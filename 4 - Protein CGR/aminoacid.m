% Creating CGRs for polypeptides

% Calculate the coordinates for the vertices
n = 20;
x = cos(2*pi*((0:n)/n));
y = sin(2*pi*((0:n)/n));
vertex = [x(1:end-1); y(1:end-1)];

% Calculate the dividing ratio
r = dividingrate(n);

% Map string of amino acids to vector of integers
S = readseq('FASTA files/cytochrome_c_human.fasta');
% S = readseq('FASTA files/ribonuclease_inhibitor.fasta');
% S = readseq('FASTA files/rattus_norvegicus.fasta');
% S = readseq('FASTA files/pertussis_toxin.fasta');
% S = readseq('FASTA files/cytochrome_c_mouse.fasta');
% S =  readseq('FASTA files/NADH_dehydrogenase.fasta');

% Initialize matrix to store points for CGR
CGR = zeros(2, length(S)+1);

for i = 1:length(S)
  CGR(:, i+1) = CGR(:, i) + (vertex(:, S(i)) - CGR(:, i))*r;
end

% Plot CGR
plot(x, y, 'k')
hold on
plot(CGR(1, :), CGR(2, :), 'k.')
hold off
axis('equal');
axis([-1.12, 1.12, -1.12, 1.12]);
set(gca, 'xtick', []);
set(gca, 'ytick', []);

% Label each vertex with corresponding amino acid
AA = 'ARNDCQEGHILKMFPSTWYVBZ';
for i = 1:n
  if vertex(1, i) < -0.2
    if vertex(2, i) < -0.2
      text(vertex(1, i)-0.05, vertex(2, i)-0.05, AA(i))
    elseif vertex(2, i) > 0.2
      text(vertex(1, i)-0.05, vertex(2, i)+0.05, AA(i))
    else
      text(vertex(1, i)-0.065, vertex(2, i), AA(i))
    end
  elseif vertex(1, i) > 0.2
    if vertex(2, i) < -0.2
      text(vertex(1, i)+0.0075, vertex(2, i)-0.04, AA(i))
    elseif vertex(2, i) > 0.2
      text(vertex(1, i)+0.0075, vertex(2, i)+0.04, AA(i))
    else
      text(vertex(1, i)+0.025, vertex(2, i), AA(i))
    end
  else
    if vertex(2, i) < -0.2
      text(vertex(1, i)-0.025, vertex(2, i)-0.05, AA(i))
    else
      text(vertex(1, i)-0.03, vertex(2, i)+0.05, AA(i))
    end
  end
end