%
% 第二章仿真实验 目标运动路线图
%

total_time = 500;
start_x = 100;
start_y = 100;
current_time = 1;

sx = zeros(1, total_time);
sy = zeros(1, total_time);

% 第一阶段，匀速运动.（10m/s, 0m/s）持续时间250s
for t = 1:250
    sx(current_time) = start_x + 10 * current_time;
    sy(current_time) = start_y;
    current_time = current_time + 1;
end

% 第二阶段，高机动，持续时间100s

% 当前位置
start_x = sx(250);
start_y = sy(250);
% 当前速度
current_vx = 10;
current_vy = 0;
% 当前加速度（2m/ss, 3m/ss）
ax = 1.2;
ay = 1.5;
%　当前加加速度（-0.015m/sss, 0.015m/sss）
aax = -0.005;
aay = 0.018;

for t = 1:150
    sx(current_time) = start_x + current_vx * t;
    sy(current_time) = start_y + current_vy * t;
    current_vx = current_vx + ax;
    current_vy = current_vy + ay;
    ax = ax + aax;
    ay = ay + aay;
    current_time = current_time + 1;
end

% 第三阶段，匀速运动，持续200s
% 当前位置
start_x = sx(400);
start_y = sy(400);
% 当前速度
start_vx = current_vx;
start_vy = current_vy + 200;

for t = 1:100
    sx(current_time) = start_x + start_vx * t;
    sy(current_time) = start_y + start_vy * t;
    current_time = current_time + 1;
end

plot(sx, sy, 'LineWidth', 2)
hold on

plot(sx(1), sy(1), 'ok', 'MarkerFaceColor','k')
text(sx(1), sy(1)+ 3000, 'A')
hold on

plot(sx(250), sy(250), 'ok', 'MarkerFaceColor','k')
text(sx(250), sy(250) + 3000, 'B')
hold on

plot(sx(400), sy(400), 'ok', 'MarkerFaceColor','k')
text(sx(400) - 1000, sy(400) + 2000, 'C')
hold on

plot(sx(500), sy(500), 'ok', 'MarkerFaceColor','k')
text(sx(500) - 1000, sy(500) + 2000, 'D')
hold on

grid on
xlabel('x(m)')
ylabel('y(m)')
