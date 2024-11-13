% 定义符号变量
syms t s;

% 定义目标函数
f = t^2 + (s-3)^2;

% 初始点
x0 = [-2 6];

% 自变量向量
var = [t s];

% 精度
eps = 1e-5;

% 调用 minNT 函数
[x, minf] = minGETD(f, x0, var, eps);
%x = Funval(f,var,x0);

% 显示结果
disp('The minimum point is:');
disp(x);
disp('The minimum value of the function is:');
disp(minf);