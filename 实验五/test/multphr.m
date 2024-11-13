function [x, mu, lam, output] = multphr(fun, hf, gf, dfun, dhf, dgf, x0)
    % ���ܣ����ӷ����һ��Լ���Ż����⣺
    %        min f(x), s.t. h(x)=0, g(x)��0
    % ���룺fun, dfun�ֱ���Ŀ�꺯�������ݶȣ�
    %       hf, dhf�ֱ��ǵ�ʽԼ������������������Jacobi�����ת�ã�
    %       gf, dgf�ֱ��ǲ���ʽԼ������������������Jacobi�����ת�ã�
    %       x0�ǳ�ʼ�㣬
    % �����x�ǽ������Ž⣬
    %       mu, lam�ֱ�����Ӧ�ڵ�ʽԼ���Ͳ���ʽԼ���ĳ���������
    %       output�ǽṹ������������Ƽ�Сֵf, ��������k, �ڵ�������ink��

    maxk = 1000; % ����������
    sigma = 2.0; % �ͷ�����
    theta = 0.8; eta = 2.0; % PHR�㷨�е�ʵ����
    k = 0; ink = 0; % k, ink�ֱ�����������ڵ�������
    epsilon = 1e-5; % ��ֹ���ֵ
    x = x0; he = feval(hf, x); gi = feval(gf, x);
    n = length(x); l = length(he); m = length(gi);
    %disp(x);
    
    % ѡȡ���������ĳ�ʼֵ
    mu = 0.1 * ones(l, 1); lam = 0.1 * ones(m, 1);
    betak = 10; betalo = 10; % ���������ֹ����������ֵ
    
while (betak > epsilon && k < maxk)
    % ����BFGS�㷨���������Լ��������
    [x,val,ik] = bfgs('mpsi','dmpsi',x0,fun,hf,gf,dfun,dhf,dgf,mu,lam,sigma);
    ink = ink + ik;
    he = feval(hf, x); gi = feval(gf, x);
    % ����betak
    betak = sqrt(norm(he, 2)^2 + norm(min(gi, lam / sigma), 2)^2);
    if betak > epsilon
        % ���³�������
        mu = mu - sigma * he;
        lam = max(0.0, lam - sigma * gi);
        if(k >= 2 && betak > theta * betaold)
            sigma = eta * sigma;
        end
    end
    k = k + 1;
    betaold = betak;
    x0 = x;
end
f = feval(fun, x);
output.fval = f;
output.iter = k;
output.inner_iter = ink;
output.beta = betak;
