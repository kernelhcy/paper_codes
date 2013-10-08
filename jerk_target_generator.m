function target = target_generator()
%
% ����Ŀ����˶����ݡ�ģ���״�����
% Ŀ���˶��������׶Σ���һ���׶�Ϊ�����˶����ڶ����׶�Ϊ�ȼ����˶����������׶�Ϊ�����.
%
% ����size��ʾĿ���˶�����Ĵ�С����λ���ס�Ŀ����һ��size*size*size��С�����������˶���
% ����ֵ��һ��9�еľ��󣬷ֱ��Ӧxyz�������ϵ�λ���ٶȺͼ��ٶ�

target = [];
total_time = 500;       % Ŀ���˶�����ʱ��
first_part_time = 200;   % ��һ�׶��˶���ʱ��
second_part_time = 150;  % �ڶ��׶��˶���ʱ��
third_part_time = 150;   % �����׶��˶���ʱ��
now = 1;
% Ŀ���λ�ã��ٶȺͼ��ٶ�����
sx = zeros(1, total_time); sy = zeros(1, total_time); sz = zeros(1, total_time);
vx = zeros(1, total_time); vy = zeros(1, total_time); vz = zeros(1, total_time);
ax = zeros(1, total_time); ay = zeros(1, total_time); az = zeros(1, total_time);

% ��һ���׶��˶���Ŀ�������˶����ٶ�(500, 0, 0)m/s����ʼλ��(4000,4000, 200)��
for t = 1:first_part_time
    sx(now) = 4000 + 200 * t; sy(now) = 4000; sz(now) = 200;
    vx(now) = 50 ; vy(now) = 0; vz(now) = 0;
    ax(now) = 0; ay(now) = 0; az(now) = 0;
    now = now + 1;
end

% 
% �ڶ��׶Σ�Ŀ���ȼ����˶���
%
% x�᷽��Ŀ������˶������ٶ�Ϊ15m/ss,
% y�᷽��Ŀ������˶������ٶ�Ϊ8m/ss��
% z�᷽��Ŀ������˶������ٶ�Ϊ10m/ss
aax = -3;
aay = 2;
aaz = 2.5;
s0x = sx(now - 1);
s0y = sy(now - 1);
s0z = sz(now - 1);
v0x = vx(now - 1);
v0y = vy(now - 1);
v0z = vz(now - 1);
for t = 1:second_part_time
    sx(now) = s0x + v0x * t + aax * (t ^ 2) / 2; 
    sy(now) = s0y + v0y * t + aay * (t ^ 2) / 2; 
    sz(now) = s0z + v0z * t + aaz * (t ^ 2) / 2;
    vx(now) = v0x  + aax * t; 
    vy(now) = v0y  + aay * t; 
    vz(now) = v0z  + aaz * t;
    ax(now) = aax; ay(now) = aay; az(now) = aaz;
    now = now + 1;
end

%
% �����׶Σ�Ŀ�������˶�
%
% ��ʼ���ٶȷֱ�Ϊ��-15,8,10��m/ss��
% 
% x�᷽��Ŀ��Ӽ��ٶ�Ϊ2m/sss,
% y�᷽��Ŀ��Ӽ��ٶ�Ϊ-1m/sss��
% z�᷽��Ŀ��Ӽ��ٶ�Ϊ-2m/sss
jerkx = 0.05;
jerky = -0.03;
jerkz = -0.02;
s0x = sx(now - 1);
s0y = sy(now - 1);
s0z = sz(now - 1);
v0x = vx(now - 1);
v0y = vy(now - 1);
v0z = vz(now - 1);
a0x = ax(now - 1);
a0y = ay(now - 1);
a0z = az(now - 1);
for t = 1:third_part_time
    sx(now) = s0x + v0x * t + a0x * (t ^ 2) / 2 + jerkx * (t ^ 3) / 6;
    sy(now) = s0y + v0y * t + a0x * (t ^ 2) / 2 + jerky * (t ^ 3) / 6;
    sz(now) = s0z + v0z * t + a0x * (t ^ 2) / 2 + jerkz * (t ^ 3) / 6;
    vx(now) = v0x + a0x * t + jerkx * (t ^ 2) / 2;
    vy(now) = v0y + a0y * t + jerky*  (t ^ 2) / 2;
    vz(now) = v0z + a0z * t + jerkz * (t ^ 2) / 2;
    ax(now) = a0x + jerkx * t;
    ay(now) = a0y + jerky * t;
    az(now) = a0z + jerkz * t;
    now = now + 1;
end

target(1, :) = sx;
target(2, :) = sy;
target(3, :) = sz;
target(4, :) = vx;
target(5, :) = vy;
target(6, :) = vz;
target(7, :) = ax;
target(8, :) = ay;
target(9, :) = az;
end

