function [x,minf] = minGETD(f,x0,var,eps)
% 目标函数: f;
% 初始点: x0;
% 自变量向量: var;
% 精度: eps;
% 目标函数取最小值时的自变量值: x;
% 目标函数的最小值: minf

format long;
if nargin == 3
    eps = 1.0e-6;
end
x0 = transpose(x0);
n = length(var);
syms l;
gradf = jacobian(f,var); % 梯度方向
v0 = Funval(gradf,var,x0);
p = -transpose(v0);
k = 0;

while 1
    v = Funval(gradf,var,x0);
    tol = norm(v);
if tol <= eps
    x = x0;
    break;
end
y = x0 + l * p;
yf = Funval(f, var, y);
[a, b] = minJT(yf, 0, 0.1);
xm = minHJ(yf, a, b);
x1 = x0 + xm * p;
vk = Funval(gradf, var, x1);
tol = norm(vk);
if tol <= eps
    x = x1;
    break;
end
if k + 1 == n
    x0 = x1;
    continue;
else
    lamda = dot(vk, vk) / dot(v, v);
    p = -transpose(vk) + lamda * p;
    k = k + 1;
    x0 = x1;
end
end
minf = Funval(f, var, x);
format short;

