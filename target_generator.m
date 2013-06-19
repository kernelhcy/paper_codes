function target = jerk_target_generator()
%
% ����Ŀ����˶����ݡ�ģ���״�����
% Ŀ���˶��������׶Σ���һ���׶�Ϊ�ͻ����˶����ڶ����׶�Ϊ�߻����˶�.
%
% ����size��ʾĿ���˶�����Ĵ�С����λ���ס�Ŀ����һ��size*size*size��С�����������˶���
% ����ֵ��һ��9�еľ��󣬷ֱ��Ӧxyz�������ϵ�λ���ٶȺͼ��ٶ�

target = [];
total_time = 100;       % Ŀ���˶�����ʱ��
first_part_time = 70;   % ��һ�׶��˶���ʱ��
second_part_time = 30;  % �ڶ��׶��˶���ʱ��
% Ŀ���λ�ã��ٶȺͼ��ٶ�����
sx = zeros(1, total_time); sy = zeros(1, total_time); sz = zeros(1, total_time);
vx = zeros(1, total_time); vy = zeros(1, total_time); vz = zeros(1, total_time);
ax = zeros(1, total_time); ay = zeros(1, total_time); az = zeros(1, total_time);

% ��һ���׶��˶���Ŀ���ȼ����˶������ٶ�(2, 0, 0)m/ss����ʼ�ٶ�(50, 0, 0)m/s����ʼλ��(0,2000, 200)���˶�ʱ��Ϊ30s��
for t = 1:first_part_time
    sx(t) = 50 * t + 2 * t ^ 2 / 2; sy(t) = 2000; sz(t) = 200;
    vx(t) = 50  + 2 * t; vy(t) = 0; vz(t) = 0;
    ax(t) = 2; ay(t) = 0; az(t) = 0;
end

% 
% �ڶ��׶Σ�Ŀ��߻����˶���
%
% x�᷽��Ŀ������˶������ٶ�Ϊ5m/ss,
% y�᷽��Ŀ������˶������ٶ�Ϊ8m/ss��
% z�᷽��Ŀ������˶������ٶ�Ϊ10m/ss
for t = 1:second_part_time
    sx(t + first_part_time) = sx(first_part_time) + vx(first_part_time) * t - 15 * t ^ 2 / 2; 
    sy(t + first_part_time) = 2000 + vy(first_part_time) * t + 8 * t ^ 2 / 2; 
    sz(t + first_part_time) = 200 + vz(first_part_time) * t + 10 * t ^ 2 / 2;
    vx(t + first_part_time) = vx(first_part_time)  - 15 * t; 
    vy(t + first_part_time) = vy(first_part_time)  + 8 * t; 
    vz(t + first_part_time) = vz(first_part_time)  + 10 * t;
    ax(t + first_part_time) = -15; ay(t + first_part_time) = 8; az(t + first_part_time) = 10;
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

