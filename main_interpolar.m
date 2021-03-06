%APARTAT 1

x = -1:0.01:1;
y = polRunge(x);
%plot(x, y, 'k');
%hold on;
%legend('show');
%interpol;

%APARTAT 2

x = -1:2/100:1;
axisx = -1:0.01:1;
%figure(2);
%plot(axisx,polRunge(axisx), 'k');

f = @(x) 1./(1 + 25 * (x.^2));
%hold on;
for i = 2:2:8
    y = polRunge(x);
    coef = polyfit(x, y, i)
    A = polyval(coef, axisx);
    B = @(x) polyval(coef, x);
    
    phi = @(x)((f(x)-B(x)).^2);
    norma = integral(phi,-1,1);
    %plot(axisx, A);
    %hold on;
    
end

% APARTAT 3
m = [2, 4, 6, 8];
xaxis = -1:0.01:1;
figure(3);
plot(xaxis, polRunge(xaxis), 'k');
hold on;

length(m);
leg = [];
for i = 1 : 9
    leg{i} = @(x) legendreP(i - 1, x);
end

xaxis = -1:0.01:1;
for j = 1 : length(m);
    c = [];
    for i = 1 : m(j)
        g = @(x)(leg{i}(x).*leg{i}(x));
        h = @(x)(leg{i}(x).*polRunge(x));
        a = integral(g, -1, 1);
        b = integral(h, -1, 1);
        c(i) = b / a;
    end
    display(c);
    A = polyval(c, xaxis);
    plot(xaxis, A);
    hold on;
end



