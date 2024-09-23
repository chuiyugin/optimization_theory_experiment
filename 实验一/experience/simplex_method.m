%function [ X, z ] = simplex( A, b, C )
A=[ 1  1  1  1  0  0;
    2  1 -1  0  1  0;
   -1  3  0  0  0  1]; 
b=[12 6 9]'; 
c=[-1 2 -1 0  0  0];

% A=[ -1  2  1  0  0;
%     2  3   0  1  0;
%     1  -1  0  0  1]; 
% b=[4 12 3]'; 
% C=[-4  -1  0  0  0];

% �����η���ʵ��
% X: Ŀ�꺯�������Ž�
% z: Ŀ�꺯���ļ�Сֵ
% A: Լ��������ϵ������
% b: Լ�������ĳ���������
% C: Ŀ�꺯����ϵ������
[m, n] = size(A);
BIndex = n - m  + 1 : n;            % �������±꼯��
NIndex = 1 : n - m;                 % �ǻ������±꼯��
flag = 1;
if (n < m)
    disp('ϵ�����󲻷���Ҫ��')
else
    while flag
        B = A(:, BIndex);           % ������
        N = A(:, NIndex);           % �ǻ�����
        cb = C(BIndex);             % �������Ӧ��Ŀ��ֵcb
        cn = C(NIndex);             % �ǻ������Ӧ��Ŀ��ֵcn
        xb = B \ b;
        X = zeros(1, n); X(BIndex) = xb;
        z = cb * xb;                    % Ŀ�꺯��ֵ
        sigma = cn - cb / B * N;        % �б���
        [v, k] = min(sigma);            % k�ǽ��������±�
        if v > 1e-5
            flag = 0;
            disp('���ҵ����Ž⣺')
        else
            [~, l] = min((B \ b) ./ (B \ A(:, k))); l = BIndex(l);      % l�ǳ��������±�
            BIndex(BIndex == l) = k;                % ���»������±꼯��
            NIndex(NIndex == k) = l;                % ���·ǻ������±�
        end
    end
end
disp(X);
disp(z);
%end

