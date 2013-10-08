function target = target_generator()
%
% 构造目标的运动数据。模拟雷达数据
% 目标运动分三个阶段，第一个阶段为匀速运动，第二个阶段为匀加速运动，第三个阶段为变加速.
%
% 参数size表示目标运动区域的大小，单位是米。目标在一个size*size*size大小的立方体中运动。
% 返回值是一个9行的矩阵，分别对应xyz坐标轴上的位置速度和加速度

target = [];
total_time = 500;       % 目标运动的总时间
first_part_time = 200;   % 第一阶段运动的时间
second_part_time = 150;  % 第二阶段运动的时间
third_part_time = 150;   % 第三阶段运动的时间
now = 1;
% 目标的位置，速度和加速度数据
sx = zeros(1, total_time); sy = zeros(1, total_time); sz = zeros(1, total_time);
vx = zeros(1, total_time); vy = zeros(1, total_time); vz = zeros(1, total_time);
ax = zeros(1, total_time); ay = zeros(1, total_time); az = zeros(1, total_time);

% 第一个阶段运动，目标匀速运动。速度(500, 0, 0)m/s，初始位置(4000,4000, 200)。
for t = 1:first_part_time
    sx(now) = 4000 + 200 * t; sy(now) = 4000; sz(now) = 200;
    vx(now) = 50 ; vy(now) = 0; vz(now) = 0;
    ax(now) = 0; ay(now) = 0; az(now) = 0;
    now = now + 1;
end

% 
% 第二阶段，目标匀加速运动。
%
% x轴方向，目标减速运动，加速度为15m/ss,
% y轴方向，目标加速运动，加速度为8m/ss，
% z轴方向，目标加速运动，加速度为10m/ss
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
% 第三阶段，目标变加速运动
%
% 初始加速度分别为（-15,8,10）m/ss。
% 
% x轴方向，目标加加速度为2m/sss,
% y轴方向，目标加加速度为-1m/sss，
% z轴方向，目标加加速度为-2m/sss
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

