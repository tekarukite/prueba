function [ res, err, iter ] = NRmod( inicial )

eps = 1e-08;
x = inicial';
y = inicial';
err(1) = 1;
i = 1;
m = Jacobian(x);
aux = inv(Jacobian(x));

while err(i) > eps
    incr = -aux * residu(x);
    y = x + incr;
    err(i + 1) = norm(((y - x) / y), 2);
    i = i + 1;
    x = y;
end
res = y;
iter = i;

end
