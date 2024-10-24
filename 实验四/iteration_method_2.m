%ţ�ٷ�
clc,clear;
%���庯������ز���
mf = @(x,y) 100*(y-x^2)^2+(1-x)^2;  % Ŀ�꺯�� f(x,y)
%�ݶȾ���
grad_mf = @(x,y) [-400*x.*(y - x.^2) - 2*(1 - x); 200*(y - x.^2)];
%��������
hesse_mf = @(x,y) [-400*y + 1200*x.^2 + 2, -400*x ; -400*x , 200];

% ��������
x0 = [0; 0]; % ��ʼ��
maxIter = 1000; % ����������
tolerance = 1e-3; % ����

%�����������鲢��ͼ
array = [];
figure; % ��һ����ͼ�δ���

% ��ʼ��
x = x0;
%��������
tic; % ��ʼ��ʱ
for iter = 1:maxIter
    % �����ݶȾ���
    gradient = grad_mf(x(1), x(2));
    %�����������
    hesse = hesse_mf(x(1), x(2));
    %������һ���㲢��¼��һ����
    x_old = x;
    x = x - hesse \ gradient;
    %�ж��Ƿ�����
    if(abs(x(1)-x_old(1))<tolerance && abs(x(2)-x_old(2))<tolerance) 
        break; 
    end
    %����������
    array = [array,mf(x(1), x(2))];
    % ������ս��
    fprintf('ţ�ٷ���%d�ε�����: x=%.4f, y=%.4f, f(x,y)=%.4f\n', iter,x(1), x(2), mf(x(1), x(2)));
end
%��ͼ
plot(1:iter-1,array,'r--o','LineWidth', 2);
grid on;
title('ţ�ٷ�', 'FontSize', 18); % ��ӱ���
xlabel('��������', 'FontSize', 18); % ��� x ���ǩ
ylabel('����ֵ', 'FontSize', 18); % ��� y ���ǩ

tElapsed = toc; % ������ʱ����ȡ������ʱ��
fprintf('����ִ��ʱ�䣺%.5f��\n', tElapsed);