
m = 7;
inicial = 2;
P = [2.134141, 0.864141];
sigma = 1.04655891;
iter = 4;

%apartado b;
[ x, err] = Whittaker(inicial, m, iter, P );
display(x);

%Apartado c;
FAC = abs(1 - derivada(sigma, P)/m);
display(FAC);

%Apartado e;