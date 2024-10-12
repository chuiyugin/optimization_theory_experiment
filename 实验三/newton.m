clc,clear;
% 定义符号变量
syms x
% 定义目标函数 f(x) 及其一阶和二阶导数
f = x^4 - 4*x^3 - 6*x^2 - 16*x + 4;  % 目标函数 f(x)
df = diff(f, x);
ddf = diff(df, x);
% 将符号表达式转换为匿名函数
f = matlabFunction(f);
df = matlabFunction(df);
ddf = matlabFunction(ddf);
% 定义目标函数 f(x) 及其一阶和二阶导数
% f = @(x) x^4 - 4*x^3 - 6*x^2 - 16*x + 4;  % 目标函数 f(x)
% df = @(x) 4*x^3 - 12*x^2 - 12*x - 16;       % 一阶导数 f'(x)
% ddf = @(x) 12*x^2 - 24*x -12;            % 二阶导数 f''(x)

% 初始猜测值
x0 = 3.0;

% 精度要求
tolerance = 1e-3;
max_iterations = 100;

% 牛顿法迭代
x = x0;
for i = 1:max_iterations
    numerator = df(x);%分子
    denominator = ddf(x);%分母
    x_new = x - df(x)/ddf(x);
    
    % 检查是否满足收敛条件
    if abs(df(x)) < tolerance 
        break;
    end
    
    x = x_new;
end

% 输出结果
fprintf('在牛顿法%d次迭代后:\n',i);
fprintf('最小值点的近似值为: %.6f\n', x);
fprintf('函数最小值约为: %.6f\n', f(x));