
f_min=[];
timi_ng=[];
c = containers.Map;
for i=1:23 
    fun = strcat('F',int2str(i));
    c(int2str(i)) = fun;
end

 % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)
separater=[];
timer_seperater=[];
woa_2_separater=[];
woa_2a_separater=[];
woa_3_separater=[];
woa_3a_separater=[];
woa_4_separater=[];
woa_4a_separater=[];

for j=1:23
    Function_name=c(int2str(j));
    %means_time=[];
%timing=[];

    
for q=1:20
SearchAgents_no=100; % Number of search agents


%keys(c)
%values(c)
%c(1)





Max_iteration=500; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,WOA_cg_curve,timing_woa]=WOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
[Best_score2,Best_pos2,WOA_cg_curve2,timing_woa2]=WOA2(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

[Best_score2a,Best_pos2a,WOA_cg_curve2a,timing_woa2a]=WOA2a(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

[Best_score3,Best_pos3,WOA_cg_curve3,timing_woa3]=WOA3(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

[Best_score3a,Best_pos3a,WOA_cg_curve3a,timing_woa3a]=WOA3a(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

[Best_score4,Best_pos4,WOA_cg_curve4,timing_woa4]=WOA4(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

[Best_score4a,Best_pos4a,WOA_cg_curve4a,timing_woa4a]=WOA4a(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

[Best_score_ca,position_ca,timing_ca]=ca(SearchAgents_no,Max_iteration,Function_name);

[Best_score_abc,position_abc,timing_abc]=abc(SearchAgents_no,Max_iteration,Function_name);

[Best_score_de,position_de,timing_de]=de(SearchAgents_no,Max_iteration,Function_name);

[Alpha_score,Alpha_pos,Convergence_curve,timing_gwo]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);





f_min(q+1,:)=[Best_score,Best_score2,Best_score2a,Best_score3,Best_score3a,Best_score4,Best_score4a,Best_score_ca,Best_score_abc,Best_score_de,Alpha_score];
timi_ng(q+1,:)=[timing_woa,timing_woa2,timing_woa2a,timing_woa3,timing_woa3a,timing_woa4,timing_woa4a,timing_ca,timing_abc,timing_de,timing_gwo];

display(['The best solution obtained by WOA is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by WOA is : ', num2str(Best_score)]);

display(['The best solution obtained by WOA2 is : ', num2str(Best_pos2)]);
display(['The best optimal value of the objective funciton found by WOA2 is : ', num2str(Best_score2)]);

display(['The best solution obtained by WOA2a is : ', num2str(Best_pos2a)]);
display(['The best optimal value of the objective funciton found by WOA2a is : ', num2str(Best_score2a)]);

display(['The best solution obtained by WOA3 is : ', num2str(Best_pos3)]);
display(['The best optimal value of the objective funciton found by WOA3 is : ', num2str(Best_score3)]);

display(['The best solution obtained by WOA3a is : ', num2str(Best_pos3a)]);
display(['The best optimal value of the objective funciton found by WOA3a is : ', num2str(Best_score3a)]);

display(['The best solution obtained by WOA4 is : ', num2str(Best_pos4)]);
display(['The best optimal value of the objective funciton found by WOA4 is : ', num2str(Best_score4)]);

display(['The best solution obtained by WOA4a is : ', num2str(Best_pos4a)]);
display(['The best optimal value of the objective funciton found by WOA4a is : ', num2str(Best_score4a)]);



end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa2=[];
[p,h,stats]=ranksum(f_min(:,2),f_min(:,1));
ranking_woa2(1,1)=p;
ranking_woa2(2,1)=stats.zval;
ranking_woa2(3,1)=h;

for i=2:5
   [p,h,stats]=ranksum(f_min(:,2),f_min(:,i+6)) ;
ranking_woa2(1,i)=p;
ranking_woa2(2,i)=stats.zval;
ranking_woa2(3,i)=h;

end    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa2a=[];
[p,h,stats]=ranksum(f_min(:,3),f_min(:,1));
ranking_woa2a(1,1)=p;
ranking_woa2a(2,1)=stats.zval;
ranking_woa2a(3,1)=h;

for i=2:5
   [p,h,stats]=ranksum(f_min(:,3),f_min(:,i+6)) ;
ranking_woa2a(1,i)=p;
ranking_woa2a(2,i)=stats.zval;
ranking_woa2a(3,i)=h;

end    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa3=[];
[p,h,stats]=ranksum(f_min(:,4),f_min(:,1));
ranking_woa3(1,1)=p;
ranking_woa3(2,1)=stats.zval;
ranking_woa3(3,1)=h;

for i=2:5
   [p,h,stats]=ranksum(f_min(:,4),f_min(:,i+6)) ;
ranking_woa3(1,i)=p;
ranking_woa3(2,i)=stats.zval;
ranking_woa3(3,i)=h;

end    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa3a=[];
[p,h,stats]=ranksum(f_min(:,5),f_min(:,1));
ranking_woa3a(1,1)=p;
ranking_woa3a(2,1)=stats.zval;
ranking_woa3a(3,1)=h;

for i=2:5
   [p,h,stats]=ranksum(f_min(:,5),f_min(:,i+6)) ;
ranking_woa3a(1,i)=p;
ranking_woa3a(2,i)=stats.zval;
ranking_woa3a(3,i)=h;

end    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa4=[];
[p,h,stats]=ranksum(f_min(:,6),f_min(:,1));
ranking_woa4(1,1)=p;
ranking_woa4(2,1)=stats.zval;
ranking_woa4(3,1)=h;

for i=2:5
   [p,h,stats]=ranksum(f_min(:,6),f_min(:,i+6)) ;
ranking_woa4(1,i)=p;
ranking_woa4(2,i)=stats.zval;
ranking_woa4(3,i)=h;

end    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa4a=[];
[p,h,stats]=ranksum(f_min(:,7),f_min(:,1));
ranking_woa4a(1,1)=p;
ranking_woa4a(2,1)=stats.zval;
ranking_woa4a(3,1)=h;

for i=2:5
   [p,h,stats]=ranksum(f_min(:,7),f_min(:,i+6)) ;
ranking_woa4a(1,i)=p;
ranking_woa4a(2,i)=stats.zval;
ranking_woa4a(3,i)=h;

end    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_min(24,:)=['a','a','a','a','a','a','a','a','a','a','a'];
separater=[separater;f_min];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
timi_ng(24,:)=['a','a','a','a','a','a','a','a','a','a','a'];
timer_seperater=[timer_seperater;timi_ng];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa2(4,:)=['a','a','a','a','a'];
woa_2_separater=[woa_2_separater;ranking_woa2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa2a(4,:)=['a','a','a','a','a'];
woa_2a_separater=[woa_2a_separater;ranking_woa2a];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa3(4,:)=['a','a','a','a','a'];
woa_3_separater=[woa_3_separater;ranking_woa3];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa3a(4,:)=['a','a','a','a','a'];
woa_3a_separater=[woa_3a_separater;ranking_woa3a];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ranking_woa4(4,:)=['a','a','a','a','a'];
woa_4_separater=[woa_4_separater;ranking_woa4];

ranking_woa4a(4,:)=['a','a','a','a','a'];
woa_4a_separater=[woa_4a_separater;ranking_woa4a];

end
separater
%f_min(size(f_min,1)+2,:)=[mean(f_min(:,1)),Alpha_scoreAlpha_scoremean(f_min(:,2)),mean(f_min(:,3)),mean(f_min(:,4)),mean(f_min(:,5)),mean(f_min(:,6)),mean(f_min(:,7))]
%csvwrite('test2.csv',separater)
csvwrite('times.csv',timer_seperater)
csvwrite('rank_woa2.csv',woa_2_separater)
csvwrite('rank_woa2a.csv',woa_2a_separater)
csvwrite('rank_woa3.csv',woa_3_separater)
csvwrite('rank_woa3a.csv',woa_3a_separater)
csvwrite('rank_woa4.csv',woa_4_separater)
csvwrite('rank_woa4a.csv',woa_4a_separater)








