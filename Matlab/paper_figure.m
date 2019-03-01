Threshold = [2, 5, 10];

ele_latency = 4;
opt_latency = 2;
reconf_latency = 16;

j = 1;

for i = 57:61
    fft_RE_T2_hops(j) = (fft_opt_hops(i)+fft_ele_hops(i));
    j = j+1;
end

vote = [1 2 4 16 32];
vote_percentage = vote/256*100;

pure_ele_hops (4) = fft_opt_hops(67) + fft_ele_hops(67);    %fft pur ele
pure_ele_hops (1) = ep_opt_hops(67) + ep_ele_hops(67);
pure_ele_hops (2) = cg_opt_hops(67) + cg_ele_hops(67);
pure_ele_hops (3) = mg_opt_hops(67) + mg_ele_hops(67);
pure_ele_hops (5) = lu_opt_hops(67) + lu_ele_hops(67);


%%%%% FIGURE 1  %%%%%%%%%%%%%%%%%%%
hold on
xlim([vote_percentage(1), vote_percentage(5)]);
ylim([1, 10]);

title('# of Hops vs Vote Percentage for FT (RESET, Threshold = 2, Drift = 3)');

plot(vote_percentage, fft_RE_T2_hops);
xlabel('Vote Percentage');
ylabel('# of Hops');
plot(vote_percentage, ones(size(vote_percentage))*pure_ele_hops(4), 'r--');
legend({'DDDAS NoC', 'Electrical'}, 'Location', 'southeast');
hold off


ele_hops_RE_T2(1) = ep_ele_hops(57); 
ele_hops_RE_T2(2) = cg_ele_hops(57);
ele_hops_RE_T2(3) = mg_ele_hops(57);
ele_hops_RE_T2(4) = fft_ele_hops(57);
ele_hops_RE_T2(5) = lu_ele_hops(57);

opt_hops_RE_T2(1) = ep_opt_hops(57); 
opt_hops_RE_T2(2) = cg_opt_hops(57);
opt_hops_RE_T2(3) = mg_opt_hops(57);
opt_hops_RE_T2(4) = fft_opt_hops(57);
opt_hops_RE_T2(5) = lu_opt_hops(57);

hops_RE_T2(1) = ep_ele_hops(57) + ep_opt_hops(57); 
hops_RE_T2(2) = cg_ele_hops(57) + cg_opt_hops(57);
hops_RE_T2(3) = mg_ele_hops(57) + mg_opt_hops(57);
hops_RE_T2(4) = fft_ele_hops(57) + fft_opt_hops(57);
hops_RE_T2(5) = lu_ele_hops(57) + lu_opt_hops(57);

hops ((1:5), 1)= hops_RE_T2(1:5);
hops ((1:5), 2)= pure_ele_hops(1:5);

hops_legend = cell (1, 2);
hops_legend {1} = 'DDDAS NoC'; hops_legend{2} = 'Pure Electrical NoC ';


benchmark = {'EP', 'CG', 'MG', 'FT', 'LU'};
benchmark_wo_ep = {'CG', 'MG', 'FT', 'LU'};


%%%%%%%%Figure 2 - hops
 for i = 1:5
hops_percentage (i)  = (pure_ele_hops(i)-hops_RE_T2(i))/pure_ele_hops(i)*100;
 end
 hops_percentage (5) = 0.0000;
figure
h = bar(hops_percentage(1:5));
%text(1:length(hops_percentage),hops_percentage,num2str(hops_percentage'),'vert','bottom','horiz','center'); 
%legend(h, hops_legend);
%legend ('DDAS NoC');
set(gca, 'xticklabel', benchmark);
ylabel('Hops Saving (%)');
%title('Hops Saveing for NAS Benchmarks (DDDAS NoC - RESET, Threshold = 2, Drift = 3, Vote Percentage = 0.3%)');
text(1:length(hops_percentage),hops_percentage,num2str(hops_percentage'),'vert','bottom','horiz','center');



buffer_RE_T2(1) = ep_buffer(57) + ep_buffer(57); 
buffer_RE_T2(2) = cg_buffer(57) + cg_buffer(57);
buffer_RE_T2(3) = mg_buffer(57) + mg_buffer(57);
buffer_RE_T2(4) = fft_buffer(57) + fft_buffer(57);
buffer_RE_T2(5) = lu_buffer(57) + lu_buffer(57);

refconf_RE_T2(1) = ep_num_reconf(57) + ep_num_reconf(57); 
refconf_RE_T2(2) = cg_num_reconf(57) + cg_num_reconf(57);
refconf_RE_T2(3) = mg_num_reconf(57) + mg_num_reconf(57);
refconf_RE_T2(4) = fft_num_reconf(57) + fft_num_reconf(57);
refconf_RE_T2(5) = lu_num_reconf(57) + lu_num_reconf(57);



latency_16 = ele_latency*ele_hops_RE_T2(1:5) + opt_hops_RE_T2(1:5)*opt_latency+ reconf_latency*refconf_RE_T2(1:5)+ buffer_RE_T2(1:5);
latency_ele = pure_ele_hops(1:5)*ele_latency+buffer_RE_T2(1:5);

reconf_latency2 = 48;
latency_48 = ele_latency*ele_hops_RE_T2(1:5) + opt_hops_RE_T2(1:5)*opt_latency+ reconf_latency2*refconf_RE_T2(1:5)+ buffer_RE_T2(1:5);


latency((1:5),1) = latency_16;
latency((1:5),2) = latency_48;
%latency((1:5),3) = latency_ele;

%Figure 5 - latency saving 
for i = 2:5
latency_saving(i-1,1) = (latency_ele(i)-latency_16(i))/latency_ele(i)*100;
latency_saving(i-1,2) = (latency_ele(i)-latency_48(i))/latency_ele(i)*100;
end

latency_saving(4, :) = 0;

figure
ls = bar(latency_saving);

legend(ls, latency_legend, 'Location', 'southeast');
set(gca, 'xticklabel', benchmark_wo_ep);
ylabel('Time Savings (%)');
title('Time Saving of NAS Benchmarks (DDDAS NoC - RESET, Threshold = 2, Drift = 3, Vote Percentage = 0.3%)');

%%%%%%%%%% Figure 4

% latency_legend = cell (1, 3);
% latency_legend{1} = 'Reconfiguration Time = 16'; 
% latency_legend{2} = 'Reconfiguration Time = 48 ';
% latency_legend{3} = 'Pure Electrical ';
% 
% figure
% 
% l = bar(latency);
% 
% legend(l, latency_legend);
% set(gca, 'xticklabel', benchmark);
% ylabel('Latency (cycles)');
% title('Normalized Latency (DDDAS NoC - RESET, Threshold = 2, Drift = 3, Vote Percentage = 0.3%)');

%%%%%%%%%%%%%%%%%%%%%% Figure 3 - Normalized Latency

% figure


% normalized
%nor_latency = latency((1:5),1)/latency( (1:5), 2);

% nor_latency_legend = cell (1, 2);
% nor_latency_legend {1} = 'Reconfiguration Time = 16'; latency_legend{2} = 'Reconfiguration Time = 256 ';
% 
% nor_latency = zeros(5, 2);
% for i = 1:5
%  nor_latency(i, 1)= latency_16(i)/latency_ele(i);
%  nor_latency(i, 2) = latency_256(i)/latency_ele(i);
% end
%  l = bar(nor_latency);
%  legend(l, nor_latency_legend);
% set(gca, 'xticklabel', benchmark);
% ylabel('normalized latency');
% title('Normalized Latency (DDDAS NoC - RESET, Threshold = 2, Drift = 3, Vote Percentage = 0.3%)');