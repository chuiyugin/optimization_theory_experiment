%牛顿法
clc,clear;
%定义函数和相关参数
mf = @(x,y) 100*(y-x^2)^2+(1-x)^2;  % 目标函数 f(x,y)
%梯度矩阵
grad_mf = @(x,y) [-400*x.*(y - x.^2) - 2*(1 - x); 200*(y - x.^2)];
%海赛矩阵
hesse_mf = @(x,y) [-400*y + 1200*x.^2 + 2, -400*x ; -400*x , 200];

% 参数设置
x0 = [0; 0]; % 初始点
maxIter = 1000; % 最大迭代次数
tolerance = 1e-3; % 精度

% 初始化
x = x0;
%迭代计算
tic; % 开始计时
for iter = 1:maxIter
    % 计算梯度矩阵
    gradient = grad_mf(x(1), x(2));
    %计算黑塞矩阵
    hesse = hesse_mf(x(1), x(2));
    %计算下一个点并记录上一个点
    x_old = x;
    x = x - hesse \ gradient;
    %判断是否收敛
    if(abs(x(1)-x_old(1))<tolerance && abs(x(2)-x_old(2))<tolerance) 
        break; 
    end
    % 输出最终结果
    fprintf('牛顿法第%d次迭代后: x=%.4f, y=%.4f, f(x,y)=%.4f\n', iter,x(1), x(2), mf(x(1), x(2)));
end
tElapsed = toc; % 结束计时并获取经过的时间
fprintf('程序执行时间：%.5f秒\n', tElapsed);