%%%%%%%%%%%% Calling and Using IDES15June2023 ......
xj = zeros(numbr_instns,numbr_instns);   % Trustworthiness of vehicle vj 
ri = zeros(numbr_instns,numbr_instns);   % Reputation of vehicle vi 
pij = zeros(numbr_instns,numbr_instns);   % Validated result of a message at a give time instant which is sent from vehicle vi to vehicl vj...
                                          % it is also measured in terms of probability and it is in range of [0 1]
c = zeros(numbr_instns,numbr_instns);    % it is a constant ratio which is accumulated reputation at each iteration...  
Mi = zeros(numbr_instns,numbr_instns);    % it sotores identity of malacios node
% p = zeros(numbr_instns,numbr_instns);    % Implementation of mechanism to determine trustworthiness of vehicles   
p = 0;                                     % This function calculates the threshold required for identifiying malaicious node p   

%IDESClassObj.numbr_instr = numbr_inst;
% NM = randi([10,25]);   % Immitating the number of Normal Messages
% BM = randi([10,25]);   % Immitating the number of Bogus Messages
for t = 1:numbr_instns
    %IDESClassObj.t = t;
NM = randi([10,25]);   % Immitating the number of Normal Messages
BM = randi([10,25]);   % Immitating the number of Bogus Messages
%[IDESClassObj] = IDESClassObj.IdentifyingMV(IDESClassObj); 
xj(1:m,t)= rand([1,m]);   
n = randi([2,7]);   % Generating randomly the number of mallicious (or bogus) messages between 2 and 7....
% m is already defined by loading Above30A60A90PercentAllUpdtd15June2023.mat file.... 
ri(1:m,t) = rand([1,m]);   % Reputation of vehicle vi (downloaded by local server from central server)
pij(1:m,t) = rand([1,m]);
% IDESClassObj = IDES15June2023(m,n,xj,ri,pij,NM,BM,Mi,c,numbr_instns);  % Declaring instance object of the class "IDES15June2023"
% p(1:m,t) = rand([1,m]);  % Implementation of mechanism to determine trustworthiness of vehicles   
% p = 0;                   % This function calculates the threshold required for identifiying malaicious node p   
                     
%%%%%%%%%%% Step 1 - IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IDESClassObj = IDES15June2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,numbr_instns);  %  Declaring instance object of the class "IDES15June2023"
                            %(m,n,xj,ri,pij,NM,BM,c,Mi,numbr_instns)   %  And also calling constructor to initialize the parameters and the whole VFC scenario...        
% NumbrInstns = numbr_instns;
%%%%%%%%%%% Step 1 - TES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IDESClassObj = IDES15June2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,numbr_instns);  %  Declaring instance object of the class "IDES15June2023"
%%%%%%%%%%% Step 2 - IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k = 1:m
IDESClassObj.p = IdentifyingMV(IDESClassObj);   %    % Implementation of mechanism to determine trustworthiness of vehicles   
                                                                % Thisfunction calculates the threshold required for identifiying malaicious node 
                                                                % The "p" variable is the threshold used in the next line to determinie the node...
                                                         
if(ri(k,t) > IDESClassObj.p)                  % Detecting and identifying malacious node uisng the threshold value calculated by "IdentifyingMV" function...
IDESClassObj.Mi(k,t) = k;
end
%IDESClassObj = IDES15June2023(m,n,xj,ri,pij,NM,BM,Mi,numbr_instns);    % Call constructor to update the parameters and the whole VFC scenario...  
%%%%%%%%%%% Step 3 - IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IDESClassObj = PunishingMN(IDESClassObj);      % punishing malaciosu nodes....
%%%%%%%%%%% Step 4-IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IDESClassObj = IterativeRepManagt(IDESClassObj);       % Calculating the overal reputation in at time instant t to observe the effect of whole IDES mechanism.....
end
end
% AverageReputAllIDES = sum(objparam.ri,1);
%AverageReputAllIDES = sum(ri,1);
AverageReputAllIDES = sum(IDESClassObj.ri,1);

% base = 20; 
% yLogged = @(y,base) log(y)/log(base);    % Custome defined logarithmic function with variable "base"........
% yAverageReputAll = yLogged(AverageReputAll,base);

base = 20; 
yLogged = @(y,base) log(y)/log(base);    % Custome defined logarithmic function with variable "base"........
yLoggedAvergReputAll = yLogged(AverageReputAll,base);

yLoggedAvergReputAll = abs(yLoggedAvergReputAll);

% base = 20; 
% yLogged = @(y,base) log(y)/log(base);    % Custome defined logarithmic function with variable "base"........
% yLoggedAvergReputAllV2 = yLogged(AverageReputAll,base);


h9 = figure;
% plot(x,AverageReputAllIDES,x,yLoggedAvergReputAll);   %
% AverageReputAllIDES is aggregate average reputation of all vehicles handled by IDES, and AverageReputAll  is aggregate average reputation of all vehicles handled by RPRSplot(x,AverageReputAllIDES);\
yyaxis left;
t1 = gca;
p1 = plot(x,yLoggedAvergReputAll,'-*','LineWidth',2);
% set(t1,'ylabel','Average Perception values');
% p1 = plot(x,yLoggedAvergReputAll);
ylabel('Average Perception values');
set(t1,'YColor','black');
yyaxis right;
t2 = gca;
p2 = plot(x,AverageReputAllIDES,'-s','LineWidth',2);
ax2 = gca;
yticks('auto');
% yticklabels({'Minimum', 'Maximum'});
ylabel('Average Perception values');
legend('RPRA method','IDES method');
xlabel('Number of time instants');
% set(ax2,'FontWeight','Bold');
set(t1,'FontWeight','Bold');