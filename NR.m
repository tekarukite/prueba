function [ res, err, iter ] = NR( inicial )

eps = 1e-08;
x = inicial';
y = inicial';
err(1) = 1;
i = 1;

while err(i) > eps
    aux = inv(Jacobian(x));
    incr = -aux * residu(x);
    y = x + incr;
    err(i + 1) = norm(((y - x) / y), 2);
    i = i + 1;
    x = y;
end

res = y;
iter = i;

end

