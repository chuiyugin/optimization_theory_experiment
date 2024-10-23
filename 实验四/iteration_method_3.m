%变尺度法（拟牛顿法）
clc,clear;
%定义函数和相关参数
mf = @(x,y) 100*(y-x^2)^2+(1-x)^2;  % 目标函数 f(x,y)
%梯度矩阵
grad_mf = @(x,y) [-400*x.*(y - x.^2) - 2*(1 - x); 200*(y - x.^2)];

% 参数设置
H = eye(2);%单位矩阵
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
    k = 1;
    %计算搜索方向
    d = - H * gradient;
    %计算d的二范数
    mod_grad = norm(gradient);
    %判断是否结束循环
    if mod_grad < tolerance
        break;
    else
        if k==2
            k = 1;
            continue
        else
            %生成对应方向关于步长的一元函数
            lsf = @(lambda) mf(x(1)+lambda*d(1),x(2)+lambda*d(2));
            %得到lambda
            %lambda=fminunc(lsf);
            [lambda,~]=fminbnd(lsf,0,100);
            %记录旧值
            x_old = x;
            g_old = gradient;
            %更新初始点
            x(1) = x(1) + lambda * d(1);
            x(2) = x(2) + lambda * d(2);
            %计算p_k
            p_k = x - x_old;
            %计算q_k
            gradient = grad_mf(x(1), x(2));
            q_k = gradient - g_old;
            %更新矩阵H
            H = H + (p_k * p_k') /(p_k' * q_k) - (H * q_k * q_k' * H)/(q_k' * H * q_k);
            %更新k
            k = k+1;
        end 
    end
    % 输出最终结果
    fprintf('变尺度法第%d次迭代后: x=%.4f, y=%.4f, f(x,y)=%.4f\n', iter,x(1), x(2), mf(x(1), x(2)));
end
tElapsed = toc; % 结束计时并获取经过的时间
fprintf('程序执行时间：%.5f秒\n', tElapsed);