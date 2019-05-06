
%========================================================
% Processamento Digital de Sinais
% Data: 24/04/2019
% Atividade: Manipula��o de eco em audio
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
% V�riaveis referentes a leitura do a�dio:
% caminho ...........Caminho de diretorios para o arquivo
% arquivo............Nome do arquivo
% extensao...........Extens�o do arquivo de audio
% audio .............Nome do arquivo com caminho do diretorio 
%                    em que esta localizado e extens�o
% x..................Amostras do �udio
% fs.................Frequ�ncia
% Nbits..............N�mero de bits
%
% V�riveis para a constru��o do sistema do Eco
%
% n0.................N�meros de amostras do atrasos 
% alfa...............Constante - Regula a intensidade do eco 
%                    (diretamente proporcional)
% b..................Vetor dos coeficientes do n�merador da 
%                    fun��o de transf�rencia
% coefDenominador....Coeficiente do denominador
% y..................Fun��o eco - Adicionar eco
% g..................Fun��o inversa (sistema inverso) - 
%                    Remover eco
%========================================================

caminho = '';
arquivo = 'pds-homer';
extensao = 'wav';
audio = sprintf('%s%s.%s', caminho, arquivo, extensao');
% Leitura do �udio
[x, fs, Nbits] = wavread(audio);
% Gr�fico com amostras do �udio
%plot(x);
% Reprodu��o do �udio original
%sound(x, fs);

n0 = 500;
alfa = 0.8;
b = zeros(1, n0);
b(1) = 1; b(n0) = alfa;
coefDenominador = 1;

% Aplicando o eco
y = filter(b, coefDenominador, x);
sound(y, fs);

% Removendo o eco - Fun��o inversa
g = filter(coefDenominador, b, y);
sound(g, fs);