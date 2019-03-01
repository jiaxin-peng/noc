

t = 2;

ele_latency = 4;
opt_latency = 2;
buffer_latency = 1;
reconf_latency = 48;


% Actually the totoal_hops here should be latency. I wrote in this way for easy revision only.
total_hops = ele_hops*ele_latency + opt_latency*opt_hops + buffer*buffer_latency + num_reconf*reconf_latency;

%total

for i=1 : 66
hop(i,(1:28))=total_hops(t:t+27);
t=t+28;
end

t = 2;
for i=1 : 66
reconf(i,(1:28))=num_reconf(t:t+27);
t=t+28;
end

num_pkg_single = num_pkg(2:29);
%%%%%%%%%%%%%%%%%%%%%%%%% DECREASE - DT
% dv = 1;
% dt = 10;
% m = 3;
% n = 5;
% total_sub = m*n;
% 
% figure
% t = 1;
% for i=1:total_sub
% 
%     subplot(m, n, i)
%     plot(num_pkg_single,hop(t,1:28), 'Linewidth', 1.5)
%     hold
%     plot(num_pkg_single, hop(t+15,1:28), 'Linewidth', 1.5)
%     plot(num_pkg_single, hop(t+30,1:28), 'Linewidth', 1.5)
%     plot(num_pkg_single, hop(51,1:28), 'Linewidth', 1.5)
%     legend('DT = 10','DT = 2','DT = 5','electrical')
%     xlim([0 1000])
% 
% hold
%     switch mod(i, 5)
%             case 1
%                 driftVote = 1;
%             case 2 
%                 driftVote = 4;
%             case 3
%                 driftVote = 8;
%             case 4
%                 driftVote = 16;
%             case 0
%                 driftVote = 32;
%         otherwise
%                 disp('wrong driftVote');
%     end
%     
%   t = t+1;
%     
%   if i == n+1
%         dv = 2;
%     elseif i == n*2+1
%         dv = 4;
% %   else
% %       disp('wrong dt');
%     end
%     
%     
%     if mod(i, n) == 1
%          ylabel({['DV = ', num2str(dv)];'Average Latency (cycle)'}, 'FontWeight', 'bold')
%     end
%     if i == 13
%         xlabel('# of packets', 'FontWeight', 'bold')
%     end
%     if i<6
%         title(['driftVote = ', num2str(driftVote)])
%     end
% end

% # of Reconfigurations
% dv = 1;
% dt = 10;
% 
% figure
% t = 1;
% for i=1:total_sub
% 
%     subplot(m, n, i)
%     plot(num_pkg_single,reconf(t,1:28))
%     hold
%     plot(num_pkg_single, reconf(t+15,1:28))
%     plot(num_pkg_single, reconf(t+30,1:28))
%     legend('DT = 10','DT = 2','DT = 5')
%     xlim([0 1000])
% 
% hold
%     switch mod(i, 5)
%             case 1
%                 driftVote = 1;
%             case 2 
%                 driftVote = 4;
%             case 3
%                 driftVote = 8;
%             case 4
%                 driftVote = 16;
%             case 0
%                 driftVote = 32;
%         otherwise
%                 disp('wrong driftVote');
%     end
%     
%     if mod(t, 5) == 0
%         t = t+11;
%     else
%         t = t+1;
%     end
%     
%   if i == n+1
%         dv = 2;
%     elseif i == n*2+1
%         dv = 4;
%   else
%       disp('wrong dt');
%     end
%     
%     
%     if mod(i, n) == 1
%          ylabel({['DV = ', num2str(dv)];'avg. # of reconf.'})
%     end
%     if i == 13
%         xlabel('# of packages')
%     end
%     if i<6
%         title(['driftVote = ', num2str(driftVote)])
%     end
% end

% %%%%%%%%%%%%%%%%%%%%%%%%% DECREASE - DV
dv = 1;
dt = 10;
m = 3;
n = 5;
total_sub = m*n;

figure
t = 1;
for i=1:total_sub

    subplot(m, n, i)
    plot(num_pkg_single,hop(t,1:28), 'LineWidth', 1.5)
    hold
    plot(num_pkg_single, hop(t+5,1:28), 'LineWidth', 1.5)
    plot(num_pkg_single, hop(t+10,1:28), 'LineWidth', 1.5)
    plot(num_pkg_single, hop(51,1:28), 'LineWidth', 1.5)
    legend('DV = 1','DV = 2','DV = 4','electrical')
    xlim([0 1000])

hold
    switch mod(i, 5)
            case 1
                driftVote = 1;
            case 2 
                driftVote = 4;
            case 3
                driftVote = 8;
            case 4
                driftVote = 16;
            case 0
                driftVote = 32;
        otherwise
                disp('wrong driftVote');
    end
    
    if mod(t, 5) == 0
        t = t+11;
    else
        t = t+1;
    end
    
  if i == n+1
        dt = 2;
    elseif i == n*2+1
        dt = 5;
%   else
%       disp('wrong dt');
    end
    
    
    if mod(i, n) == 1
         ylabel({['DT = ', num2str(dt)];'Average Latency (Cycle)'}, 'FontWeight', 'bold')
    end
    if i == 13
        xlabel('Number of packets', 'FontWeight', 'bold')
    end
    if i<6
        title(['driftVote = ', num2str(driftVote)])
    end
end


% dv = 1;
% dt = 10;
% 
% figure
% t = 1;
% for i=1:total_sub
% 
%     subplot(m, n, i)
%     plot(num_pkg_single,reconf(t,1:28))
%     hold
%     plot(num_pkg_single, reconf(t+5,1:28))
%     plot(num_pkg_single, reconf(t+10,1:28))
%     legend('DV = 1','DV = 2','DV = 4')
%     xlim([0 1000])
% 
% hold
%     switch mod(i, 5)
%             case 1
%                 driftVote = 1;
%             case 2 
%                 driftVote = 4;
%             case 3
%                 driftVote = 8;
%             case 4
%                 driftVote = 16;
%             case 0
%                 driftVote = 32;
%         otherwise
%                 disp('wrong driftVote');
%     end
%     
%     if mod(t, 5) == 0
%         t = t+11;
%     else
%         t = t+1;
%     end
%     
%   if i == n+1
%         dt = 2;
%     elseif i == n*2+1
%         dt = 5;
% %   else
% %       disp('wrong dt');
%     end
%     
%     
%     if mod(i, n) == 1
%          ylabel({['DT = ', num2str(dt)];'avg. # of reconf.'})
%     end
%     if i == 13
%         xlabel('# of packages')
%     end
%     if i<6
%         title(['driftVote = ', num2str(driftVote)])
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%% DECREASE - driftVote
% dv = 1;
% dt = 10;
% m = 1;
% n = 1;
% 
% figure
% t = 1;
% for i=1:9
%     subplot(3, 3, i)
% plot(num_pkg_single,hop(t,1:28))
% hold
% plot(num_pkg_single, hop(t+1,1:28))
% plot(num_pkg_single, hop(t+2,1:28))
% plot(num_pkg_single, hop(t+3,1:28))
% plot(num_pkg_single, hop(t+4,1:28))
% plot(num_pkg_single, hop(51,1:28))
% legend('driftVote = 1','driftVote = 4','driftVote = 8','driftVote = 16', 'driftVote = 32', 'electrical')
% xlim([0 1000])
% %xlabel('# of pakages')
%     if mod(i, 3) == 1
%          ylabel({['DT = ', num2str(dt)];'avg. # of hops'})
%     end
%     if i == 8
%         xlabel('# of packages')
%     end
%     if i==1 | i==2 |i == 3
%         title(['Decrement Value = ', num2str(dv)])
%     end
% hold
% 
%     if dv == 1
%         dv = 2;
%     elseif dv ==2
%         dv = 4;
%     else
%         dv = 1;
%     end
% 
%     if i == 3
%         dt = 2;
%     elseif i == 6
%         dt = 5;
%     end
%     
%     t=t+5;
% end
% 
% figure
% t = 1;
% dv = 1;
% dt = 10;
% for i=1:9
%     subplot(3, 3, i)
% plot(num_pkg_single,reconf(t,1:28))
% hold
% plot(num_pkg_single, reconf(t+1,1:28))
% plot(num_pkg_single, reconf(t+2,1:28))
% plot(num_pkg_single, reconf(t+3,1:28))
% plot(num_pkg_single, reconf(t+4,1:28))
% legend('driftVote = 1','driftVote = 4','driftVote = 8','driftVote = 16', 'driftVote = 32')
% xlim([0 1000])
% %xlabel('# of pakages')
%      if mod(i, 3) == 1
%          ylabel({['DT = ', num2str(dt)];'avg. # of reconf.'})
%     end
%     if i == 8
%         xlabel('# of packages')
%     end
%     if i==1 | i==2 |i == 3
%         title(['Decrement Value = ', num2str(dv)])
%     end
% hold
% 
%     if dv == 1
%         dv = 2;
%     elseif dv ==2
%         dv = 4;
%     else
%         dv = 1;
%     end
% 
%     if i == 3
%         dt = 2;
%     elseif i == 6
%         dt = 5;
%     end
%     
%     t=t+5;
% end

% for t=1:9
% figure
% plot(num_pkg_single,hop(t,1:28))
% hold
% plot(num_pkg_single, hop(t+1,1:28))
% plot(num_pkg_single, hop(t+2,1:28))
% plot(num_pkg_single, hop(t+3,1:28))
% plot(num_pkg_single, hop(t+4,1:28))
% plot(num_pkg_single,hop(51,1:28))
% legend('driftVote = 1','driftVote = 4','driftVote = 8','driftVote = 16', 'driftVote = 32','pure electrical')
% xlim([0 1000])
% xlabel('# of pakages')
% ylabel('avg. # of hops')
% title(['DECAY TYPE = DECREASE (Decrement Threshold = ',num2str(dt),' Decrement Value = ', num2str(dv), ')'])
% hold
% 
% figure
% plot(num_pkg_single,reconf(t,1:28))
% hold
% plot(num_pkg_single, reconf(t+1,1:28))
% plot(num_pkg_single, reconf(t+2,1:28))
% plot(num_pkg_single, reconf(t+3,1:28))
% plot(num_pkg_single, reconf(t+4,1:28))
% legend('driftVote = 1','driftVote = 4','driftVote = 8','driftVote = 16', 'driftVote = 32')
% xlim([0 1000])
% xlabel('# of pakages')
% ylabel('avg. # of reconfiguration')
% title(['DECAY TYPE = DECREASE (Decrement Threshold = ',num2str(dt),' Decrement Value = ', num2str(dv), ')'])
% hold
% 
%     if dv == 1
%         dv = 2;
%     elseif dv ==2
%         dv = 4;
%     else
%         dv = 1;
%     end
% 
%     if t == 4
%         dt = 2;
%     elseif t == 7
%         dt = 5;
%     end
% end
% 


% figure
% plot(num_pkg_single, hop)
% title('# of hops - synthetic benchmark big x')
% xlim([0 1000])
% 
% figure
% plot(num_pkg_single, reconf)
% title('# of reconfiguration - synthetic benchmark big x')
% xlim([0 1000])

%%%%%%%%%%%%%%%%%%%%%%%%% RESET %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% RT
% dt = 10;
% m = 2; % # of rows
% n = 5; % # of columns
% total_sub = m*n;
% figure
% t = 52;
% 
% 
%         for i=1:total_sub/2
% 
%             subplot(1, n, i)
%             plot(num_pkg_single,hop(t,1:28),'LineWidth',1.5)
%             hold
%             plot(num_pkg_single, hop(t+5,1:28), 'LineWidth',1.5)
%             plot(num_pkg_single, hop(t+10,1:28), 'LineWidth',1.5)
%             plot(num_pkg_single, hop(51,1:28), 'LineWidth',1.5)
%             %set([h1 h2 h3 h4],'LineWidth',2)
%             legend('RT = 1','RT = 2','RT = 4','electrical')
%             xlim([0 1000])
% 
%         hold
%         
%  switch mod(i, 5)
%             case 1
%                 driftVote = 1;
%             case 2 
%                 driftVote = 4;
%             case 3
%                 driftVote = 8;
%             case 4
%                 driftVote = 16;
%             case 0
%                 driftVote = 32;
%         otherwise
%                 disp('wrong driftVote');
%     end
%         
%           t = t+1;
% 
%             if mod(i, n) == 1
%                  ylabel('Average Latency (cycle)', 'FontWeight', 'bold')
%             end
%              if i <= n
%                  title(['driftVote = ', num2str(driftVote)]);
%              end
%              if i == 3
%              xlabel('Number of Packets', 'FontWeight', 'bold')
%              end 
% 
%         end

%     t = 52;
%     for i=total_sub/2+1:total_sub
%         subplot(m, n, i)
%         plot(num_pkg_single,reconf(t,1:28))
%         hold
%         plot(num_pkg_single, reconf(t+5,1:28))
%         plot(num_pkg_single, reconf(t+10,1:28))
% 
%         legend('RT = 1','RT = 2','RT = 4')
%         xlim([0 1000])
%         hold
% 
%       t = t+1;
% 
%         if mod(i, n) == 1
%              ylabel('avg. # of reconf.')
%         end
%         if i == ceil(n/2)+n*(m-1)
%             xlabel('# of packages')
%         end
% 
%     end
%%%%%%%%%%%%%%% driftVote %%%%%%%%%%%%%%%%%
% dt = 10;
% m = 2;
% n = 3;
% total_sub = m*n;
% figure
% t = 52;
% 
%         for i=1:total_sub/2
%             %subplot(m, n, i)
%             subplot(1, n, i)
%             plot(num_pkg_single,hop(t,1:28), 'LineWidth',1.5)
%             hold
%             plot(num_pkg_single, hop(t+1,1:28), 'LineWidth',1.5)
%             plot(num_pkg_single, hop(t+2,1:28), 'LineWidth',1.5)
%             plot(num_pkg_single, hop(t+3,1:28), 'LineWidth',1.5)
%             plot(num_pkg_single, hop(t+4,1:28), 'LineWidth',1.5)
%             %plot(num_pkg_single, hop(51,1:28))
%             legend('driftVote = 1','driftVote = 4','driftVote = 8','driftVote = 16','driftVote = 32','electrical')
%             xlim([0 1000])
% 
%         hold
%         
%         switch mod(i,3)
%             case 1
%                 dv = 10;
%             case 2
%                 dv = 2;
%             case 0
%                 dv = 5;
%             otherwise
%                 disp('wrong dv');
%         end
%         
%           t = t+5;
% 
%             if mod(i, n) == 1
%                  ylabel('Average Latency (cycle)', 'FontWeight', 'bold')
%             end
%              if i <= n
%                  title(['RT = ', num2str(dv)]);
%              end
%              if i == 2
%              xlabel('Number of Packets', 'FontWeight', 'bold')
%              end 
% 
%         end
% 
% %     t = 52;
% %     for i=total_sub/2+1:total_sub
% %         subplot(m, n, i)
% %         plot(num_pkg_single,reconf(t,1:28))
% %         hold
% %         plot(num_pkg_single, reconf(t+1,1:28))
% %         plot(num_pkg_single, reconf(t+2,1:28))
% %         plot(num_pkg_single, reconf(t+3,1:28))
% %         plot(num_pkg_single, reconf(t+4,1:28))
% %         legend('driftVote = 1','driftVote = 4','driftVote = 8','driftVote = 16','driftVote = 32')
% %         xlim([0 1000])
% %         hold
% % 
% %       t = t+5;
% % 
% %         if mod(i, n) == 1
% %              ylabel('avg. # of reconf.')
% %         end
% %         if i == ceil(n/2)+n*(m-1)
% %             xlabel('# of packages')
% %         end
% % 
% %     end


%%%%%%%%%%%%%%%%%%%%%   BEST CASES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  figure
%  subplot (1, 2, 1)
% plot(num_pkg_single,hop(2,1:28))
% hold
% plot(num_pkg_single, hop(4,1:28))
% plot(num_pkg_single, hop(51,1:28))
% legend('best hops: DT=10, DV=1, driftVote=4','best reconfiguration: DT=10, DV=1, driftVote=16','pure electrical')
% xlim([0 500])
% xlabel('# of pakages')
% ylabel('avg. # of hops')
% title('Best Cases - # of hops')
% hold
% 
% subplot (1, 2, 2)
% plot(num_pkg_single, reconf(2,1:28))
% hold
% plot(num_pkg_single, reconf(4,1:28))
% legend('best hops: DT=10, DV=1, driftVote=4','best reconfiguration: DT=10, DV=1, driftVote=16')
% xlim([0 500])
% xlabel('# of pakages')
% ylabel('avg. # of reconfiguration')
% title('Best Cases - # of reconfigurations')
% hold

%%%%%%%%%%%%%%%%%%%%%   ALL

% figure
% hold on
% for i = 1:66
%     plot(num_pkg_single, hop(i, 1:28))
% end
% 
% hold off
% 
% xlabel('# of pakages');
% ylabel('avg. # of hops');