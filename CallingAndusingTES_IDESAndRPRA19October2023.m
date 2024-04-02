%%%%%%%%%%%% Calling and Using IDES15June2023 ......
xj = zeros(numbr_instns,numbr_instns);   % Trustworthiness of vehicle vj 
ri = zeros(numbr_instns,numbr_instns);   % Reputation of vehicle vi 
pij = zeros(numbr_instns,numbr_instns);   % Validated result of a message at a give time instant which is sent from vehicle vi to vehicl vj...
                                          % it is also measured in terms of probability and it is in range of [0 1]
c = zeros(numbr_instns,numbr_instns);    % it is a constant ratio which is accumulated reputation at each iteration...  
Mi = zeros(numbr_instns,numbr_instns);    % it sotores identity of malacios node
taskType = 1; % Initializing  the "tasktype" variable...It is the variable that stores the type of task based on fog vehicle that is either a frequent or less visitor of neighborhood...
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
p = 0;  % Implementation of mechanism to determine trustworthiness of vehicles   
           % Thisfunction calculates the threshold required for identifiying malaicious node p P has no role in TES implementation....but is included here in
           % TES class only to complete the inheritance from father class....
K = 6;    % Initializing the number of previous reputation values by K neighborhood fog vehicles...                   
%%%%%%%%%%% Step 1 - IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IDESClassObj = IDES15June2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,numbr_instns);  %  Declaring instance object of the class "IDES15June2023"
                            %(m,n,xj,ri,pij,NM,BM,c,Mi,numbr_instns)   %  And also calling constructor to initialize the parameters and the whole VFC scenario...        
% NumbrInstns = numbr_instns;
%%%%%%%%%%% Step 1 - TES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(t == 1)
TES16June2023 = TES16June2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,K,taskType,Beta,numbr_instns);  %  Declaring instance object of the class "TES16June2023"
else
        TES16June2023.m = m;
        TES16June2023.n = n;
        TES16June2023.xj = xj;
        %TES16June2023.ri = ri;
        TES16June2023.numbr_instns = numbr_instns;
        TES16June2023.pij = pij;
        TES16June2023.c = c;
        TES16June2023.NM = NM;
        TES16June2023.BM = BM;
        TES16June2023.Mi = Mi;
          TES16June2023.t = t;
        TES16June2023.p = p;
        % TES16June2023.K = K;
        %objparam.r1i = ;
        %TES16June2023.taskType = taskType;
        %TES16June2023.Beta = Beta;
end
%%%%%%%%%%% Step 2 - IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k = 1:m
TES16June2023.taskType = randi([1,2]);                  % Generating task type based on a fog vehicle that is frequent or less frequent visitor of the neighborhood....                                                        
%if(TES16June2023.ri(k,t) > AggregatedReput.p)            % Detecting and identifying malacious node uisng the threshold value calculated by "IdentifyingMV" function...
% IDESClassObj.Mi(k,t) = k;
TES16June2023 = AggregatedReput(TES16June2023);            % Implementation of mechanism to determine trustworthiness of vehicles   
                                                                % Thisfunction calculates the threshold required for identifiying malaicious node 
                                                                % The "p" variable is the threshold used in the next line to determinie the node...
TES16June2023.taskType = randi([1,2]);  % Generating the task type randomly to initialize the reputation calculation function based on task type as in the following statements...
[TES16June2023] = Identifyingtask(TES16June2023);  % Task type based on fog vehicles that are frquent (type 1) or less freqquent (type 2) visitors of neighborhood
end
%IDESClassObj = IDES15June2023(m,n,xj,ri,pij,NM,BM,Mi,numbr_instns);    % Call constructor to update the parameters and the whole VFC scenario...  
%%%%%%%%%%% Step 3 - IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IDESClassObj = PunishingMN(IDESClassObj);              % punishing malaciosu nodes....
%%%%%%%%%%% Step 4-IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IDESClassObj = IterativeRepManagt(IDESClassObj);       % Calculating the overal reputation in at time instant t to observe the effect of whole IDES mechanism.....
end
%end
TES16June2023.ri(:,t)
reputTESAll = sum(TES16June2023.ri,1);
base = 20; 
yLogged = @(y,base) log(y)/log(base);    % Custome defined logarithmic function with variable "base"........
yLoggedAvergReputAll = yLogged(AverageReputAll,base);
% plot(x,reputTESAll,x,AverageReputAll);
% base = 100; 
% yLogged = @(y,base) log(y)/log(base);    % Custome defined logarithmic function with variable "base"........
% yLoggedAvergReputAll = yLogged(AverageReputAll,base);
% 
% base = 100; 
% yLogged = @(y,base) log(y)/log(base);    % Custome defined logarithmic function with variable "base"........
% yLoggedReputTESAll = abs(yLogged(reputTESAll,base));

base = 20; 
yLogged = @(y,base) log(y)/log(base);    % Custome defined logarithmic function with variable "base"........
yLoggedreputTESAll = yLogged(reputTESAll,base);

base = 100; 
yLogged = @(y,base) log(y)/log(base);    % Custome defined logarithmic function with variable "base"........
yLoggedreputTESAllV2 = yLogged(reputTESAll,base);

base = 20; 
yLogged = @(y,base) log(y)/log(base);    % Custome defined logarithmic function with variable "base"........
yLoggedreputTESAllV3 = yLogged(reputTESAll,base);


h14 = figure;
% plot(x,yLoggedReputTESAll,x,yLoggedAvergReputAll);
% plot(x,yLoggedAvergReputAll,x,reputTESAll);
% legend('RPRA method','TES method');
yyaxis left;
t1 = gca;
plot(x,yLoggedAvergReputAll,'-s','LineWidth',2);
set(t1,'YColor','black');
ylabel('Average Perception values');
yyaxis right;
plot(x,yLoggedreputTESAll,'-*','LineWidth',2);
% plot(x,reputTESAll,'-*','LineWidth',2);
set(t1,'YColor','black');
%plot(x,reputTESAll);
yticks('auto');
% yticklabels({'Minimum', 'Maximum'});
ylabel('Average Perception values');
legend('RPRA method','TEP method');
xlabel('Number of time instants');
% ax2 = gca;
set(t1,'FontWeight','Bold');
saveas(h13,'TES_Vs_RPRAV3','png');
set(t1,'YColor','black');



