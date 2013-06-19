function target = jerk_target_generator()
%
% 构造目标的运动数据。模拟雷达数据
% 目标运动分两个阶段，第一个阶段为低机动运动，第二个阶段为高机动运动.
%
% 参数size表示目标运动区域的大小，单位是米。目标在一个size*size*size大小的立方体中运动。
% 返回值是一个9行的矩阵，分别对应xyz坐标轴上的位置速度和加速度

target = [];
total_time = 100;       % 目标运动的总时间
first_part_time = 70;   % 第一阶段运动的时间
second_part_time = 30;  % 第二阶段运动的时间
% 目标的位置，速度和加速度数据
sx = zeros(1, total_time); sy = zeros(1, total_time); sz = zeros(1, total_time);
vx = zeros(1, total_time); vy = zeros(1, total_time); vz = zeros(1, total_time);
ax = zeros(1, total_time); ay = zeros(1, total_time); az = zeros(1, total_time);

% 第一个阶段运动，目标匀加速运动。加速度(2, 0, 0)m/ss，初始速度(50, 0, 0)m/s，初始位置(0,2000, 200)，运动时间为30s。
for t = 1:first_part_time
    sx(t) = 50 * t + 2 * t ^ 2 / 2; sy(t) = 2000; sz(t) = 200;
    vx(t) = 50  + 2 * t; vy(t) = 0; vz(t) = 0;
    ax(t) = 2; ay(t) = 0; az(t) = 0;
end

% 
% 第二阶段，目标高机动运动。
%
% x轴方向，目标减速运动，加速度为5m/ss,
% y轴方向，目标加速运动，加速度为8m/ss，
% z轴方向，目标加速运动，加速度为10m/ss
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

