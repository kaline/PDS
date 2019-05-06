
%========================================================
% Processamento Digital de Sinais
% Data: 24/04/2019
% Atividade: Manipulação de eco em audio
%========================================================

%========================================================
% Eco:
% x[n]--[]---y[n]
% y[n] = x[n] + alfa*x[n-n0]
% h[n] = delta[n] + alfa*delta[n-n0]
% H(z) = 1 + alfa*z^(-n0)
%========================================================

%========================================================
% Parametros
%========================================================
% Váriaveis referentes a leitura do aúdio:
% caminho ...........Caminho de diretorios para o arquivo
% arquivo............Nome do arquivo
% extensao...........Extensão do arquivo de audio
% audio .............Nome do arquivo com caminho do diretorio 
%                    em que esta localizado e extensão
% x..................Amostras do áudio
% fs.................Frequência
% Nbits..............Número de bits
%
% Váriveis para a construção do sistema do Eco
%
% n0.................Números de amostras do atrasos 
% alfa...............Constante - Regula a intensidade do eco 
%                    (diretamente proporcional)
% b..................Vetor dos coeficientes do númerador da 
%                    função de transfêrencia
% coefDenominador....Coeficiente do denominador
% y..................Função eco - Adicionar eco
% g..................Função inversa (sistema inverso) - 
%                    Remover eco
%========================================================

caminho = '';
arquivo = 'pds-homer';
extensao = 'wav';
audio = sprintf('%s%s.%s', caminho, arquivo, extensao');
% Leitura do áudio
[x, fs, Nbits] = wavread(audio);
% Gráfico com amostras do áudio
%plot(x);
% Reprodução do áudio original
%sound(x, fs);

n0 = 500;
alfa = 0.8;
b = zeros(1, n0);
b(1) = 1; b(n0) = alfa;
coefDenominador = 1;

% Aplicando o eco
y = filter(b, coefDenominador, x);
sound(y, fs);

% Removendo o eco - Função inversa
g = filter(coefDenominador, b, y);
sound(g, fs);