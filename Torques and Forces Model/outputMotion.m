positions = {q1, q2, q3, q4, q5, q6};
for i = 1:6
    current_q = positions{i};
    
    if isa(current_q, 'timeseries')
        p = current_q.Data;
        t_curr = current_q.Time;
    else
        p = current_q;
        t_curr = tout; 
    end
    v = gradient(p, t_curr);
    a = gradient(v, t_curr);
    figure('Name', ['Kinematic analysis of joint ', num2str(i)]);
    
    subplot(3,1,1);
    plot(t_curr, p, 'b', 'LineWidth', 1.5);
    ylabel('Position'); title(['Cupla ', num2str(i)]); grid on;
    
    subplot(3,1,2);
    plot(t_curr, v, 'r', 'LineWidth', 1.2);
    ylabel('Velocity'); grid on;
    
    subplot(3,1,3);
    plot(t_curr, a, 'g', 'LineWidth', 1.2);
    ylabel('Acceleration'); xlabel('Timp (s)'); grid on;
end