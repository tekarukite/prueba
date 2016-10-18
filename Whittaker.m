function [ x, err] = Whittaker( x0, m, iter, p )

x(1) = x0;
eps = 1e-05;
err(1) = 1;

for i = 1:iter
    x(i + 1) = x(i) - cardioide(x(i), p)/m;
    err(i + 1) = abs((x(i) - x(i + 1))/x(i + 1));
end

end

