% The Whale Optimization Algorithm
function [Leader_score2a,Leader_pos2a,Convergence_curve2a,timing_woa2a]=WOA2a(SearchAgents_no,Max_iter,lb,ub,dim,fobj)
tic
% initialize position vector and score for the leader
Leader_pos2a=zeros(1,dim);
Leader_score2a=inf; %change this to -inf for maximization problems


%Initialize the positions of search agents
Positions=initialization(SearchAgents_no,dim,ub,lb);

Convergence_curve2a=zeros(1,Max_iter);

t=0;% Loop counter

% Main loop
while t<Max_iter
    for i=1:size(Positions,1)
        
        % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        
        % Calculate objective function for each search agent
        fitness=fobj(Positions(i,:));
        
        % Update the leader
        if fitness<Leader_score2a % Change this to > for maximization problem
            Leader_score2a=fitness; % Update alpha
            Leader_pos2a=Positions(i,:);
        end
        
    end
    
    a=2-t*((2)/Max_iter); % a decreases linearly fron 2 to 0 in Eq. (2.3)
    
    % using the expression of a third order rlc cuircuit design
    % with the equivalent cuircuit parameters being
    %SearchAgents_no being the resistance equivalent
    %dim being the inductance equivalent
    %and Max_iter being the capacitor value
    
    alpha=(SearchAgents_no/(2*(dim)));% expresses the damping rate
    omega=1/(sqrt(Max_iter*dim));% expresses the natural frequency
    
    s1=-alpha+(sqrt((alpha.^2)-(omega.^2)));% the specific solution of the function second order
    s2=-alpha-(sqrt((alpha.^2)-(omega.^2)));% the specific function of the function's second order
    
    a_change=a*(exp(s1*t))+a*(exp(s2*t));% culmination of the full expresion with the previous a used as the constant
    
    % a2 linearly dicreases from -1 to -2 to calculate t in Eq. (3.12)
    a2=-1+t*((-1)/Max_iter);
    
    % Update the Position of search agents 
    for i=1:size(Positions,1)
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        
        A=2*a_change*r1-a_change;  % Eq. (2.3) in the paper
        C=2*r2;      % Eq. (2.4) in the paper
        
        
        b=1;               %  parameters in Eq. (2.5)
        l=(a2-1)*rand+1;   %  parameters in Eq. (2.5)
        
        p = rand();        % p in Eq. (2.6)
        
        for j=1:size(Positions,2)
            
            if p<0.5   
                if abs(A)>=1
                    rand_leader_index = floor(SearchAgents_no*rand()+1);
                    X_rand = Positions(rand_leader_index, :);
                    D_X_rand=abs(C*X_rand(j)-Positions(i,j)); % Eq. (2.7)
                    Positions(i,j)=X_rand(j)-A*D_X_rand;      % Eq. (2.8)
                    
                elseif abs(A)<1
                    D_Leader=abs(C*Leader_pos2a(j)-Positions(i,j)); % Eq. (2.1)
                    Positions(i,j)=Leader_pos2a(j)-A*D_Leader;      % Eq. (2.2)
                end
                
            elseif p>=0.5
              
                distance2Leader=abs(Leader_pos2a(j)-Positions(i,j));
                % Eq. (2.5)
                Positions(i,j)=distance2Leader*exp(b.*l).*cos(l.*2*pi)+Leader_pos2a(j);
                
            end
            
        end
    end
    t=t+1
    Convergence_curve2a(t)=Leader_score2a;
    [t Leader_score2a]
timing_woa2a=toc;
end

