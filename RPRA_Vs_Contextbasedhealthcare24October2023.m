%%%%%%%%%%%% Calling and Using IDES15June2023 ......
xj = zeros(numbr_instns,numbr_instns);   % Trustworthiness of vehicle vj 
ri = zeros(numbr_instns,numbr_instns);   % Reputation of vehicle vi 
pij = zeros(numbr_instns,numbr_instns);   % Validated result of a message at a give time instant which is sent from vehicle vi to vehicl vj...
                                          % it is also measured in terms of probability and it is in range of [0 1]
% SimSxzArray = zeros(numbr_instns,30);    % Storing server Similarity of all during any instant t for time period T   , wherease 30 is the number of servers, recommenders, services, and their locations..value obtained from article "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"
SimSxzArray = zeros(30);
SaveTotalTrustArray = zeros(numbr_instns,1);   % Array for saving total trust value, Tr calculated from Algorihm-2 Eq. 12 from article "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"
% SimLxzArray = zeros(numbr_instns,30);    % Storing Social Contact Similarity  of all during any instant t for time period T    , wherease 30 is the number of servers, recommenders, services, and their locations...value obtained from article "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"
SimLxzArray = zeros(30);
%SimSrxzArray = zeros(numbr_instns,30);    % Storing Service Similarity of all during any instant t for time period T     , wherease 30 is the number of servers, recommenders, services, and their locations...value obtained from article "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"                                        
SimSrxzArray = zeros(30);
c = zeros(numbr_instns,numbr_instns);    % it is a constant ratio which is accumulated reputation at each iteration...  
Mi = zeros(numbr_instns,numbr_instns);    % it sotores identity of malacios node
% p = zeros(numbr_instns,numbr_instns);    % Implementation of mechanism to determine trustworthiness of vehicles   
p = 0;                                     % This function calculates the threshold required for identifiying malaicious node p   
                           % Requestor: A
LRA = ['S1','S2','S3','S7','S9','S13'];                   % List of Recommendors stored in requestor A                  
LSA = ['S1','S5','S25','S30'];                                 % List of Servers stored in requestor A
LLA = ['S3','S15','S19','S1','S5','S25','S30','S13'];      % List of Locations  stored in requestor A
LScA = ['SR1','SR4','SR9'];      % List of Services stored in requestor A
                       % Service Provider: B
LRB = ['S1','S2','S3','S7','S9','S13'];                   % List of Recommendors for service provider B                 
                        % S1
LRRS1 = ['S11','S12','S2','S30','S4','S28'];          % List of Recommendors stored in requestor S1                                
LRS1 = ['S11','S15','S5','S30'];                      % List of Servers stored in requestor S1                  
LSS1 = ['S13','S5','S11','S15','S5','S2','S30','S23'];        % List of Locations stored in requestor S1
LScS1 = ['SR3','SR6','SR9'];      % List of Services stored in requestor S1
DTS1 = 0.7;            % Direct Trust of S1 

                        % S2
LRRS2 = ['S1','S5','S3','S30'];          % List of Recommendors stored in requestor S2                        
LRS2 = ['S1','S12','S25','S30'];                      % List of Servers stored in requestor S2                  
LSS2 = ['S23','S15','S19','S1','S5','S25','S30','S13','S12'];        % List of Locations stored in requestor S2
LScS2 = ['SR1','SR4','SR29'];      % List of Services stored in requestor S2
DTS2 = 0.5;            % Direct Trust of S2 

                        % S3
LRRS3 = ['SR3','SR6','SR9'];          % List of Recommendors stored in requestor S3                         
LRS3 = ['S11','S12','S2','S30','S4','S28'];                      % List of Servers stored in requestor S3                  
LSS3 = ['S11','S12','S2','S30','S4','S28'];        % List of Locations stored in requestor S3
LScS3 = ['SR14','SR9'];      % List of Services stored in requestor S3
DTS3 = 0.2;            % Direct Trust of S3 

                        % S4
LRRS4 = ['S1','S5','S3','S30'];          % List of Recommendors stored in requestor S4                         
LRS4 = ['S1','S5','S3','S30'];                      % List of Servers stored in requestor S4                  
LSS4 = ['S13','S5','S11','S15','S5','S2','S30','S23'];        % List of Locations stored in requestor S4
LScS4 = ['SR3','SR6','SR9'];      % List of Services stored in requestor S4
DTS4 = 0.8;            % Direct Trust of S4 

                        % S5
LRRS5 = ['S21','S22','S1','S8'];          % List of Recommendors stored in requestor S5                         
LRS5 = ['S3','S14','S5','S28'];                      % List of Servers stored in requestor S5                  
LSS5 = ['S23','S25','S17','S19','S11','S12','S31','S27'];        % List of Locations stored in requestor S5
LScS5 = ['SR30','SR16','SR29'];      % List of Services stored in requestor S5
DTS5 = 0.6;            % Direct Trust of S5 

                        % S6
LRRS6 = ['S23','S25','S12','S15','S1','S7','S3','S23'];           % List of Recommendors stored in requestor S6                         
LRS6 = ['S21','S25','S15','S14'];                          % List of Servers stored in requestor S6                  
LSS6 = ['S6','S8','S18','S16','S24','S22','S2','S17'];        % List of Locations stored in requestor S6
LScS6 = ['SR24','SR21','SR19'];      % List of Services stored in requestor S6
DTS6 = 0.9;            % Direct Trust of S6 

                        % S7
LRRS7 = ['SR4','SR12','SR18'];          % List of Recommendors stored in requestor S7                         
LRS7 = ['S1','S5','S3','S30'];                      % List of Servers stored in requestor S7                  
LSS7 = ['S13','S5','S11','S15','S5','S2','S30','S23'];        % List of Locations stored in requestor S7
LScS7 = ['SR3','SR6','SR9'];      % List of Services stored in requestor S7
DTS7 = 0.8;            % Direct Trust of S7 

                        % S8
LRRS8 = ['S23','S25','S11','S16','S15','S12','S30','S19'];          % List of Recommendors stored in requestor S8                         
LRS8 = ['S12','S18','S5','S10'];                      % List of Servers stored in requestor S8                  
LSS8 = ['S8','S25','S19','S14','S5','S2','S27','S16'];        % List of Locations stored in requestor S8
LScS8 = ['SR6','SR18','SR23'];      % List of Services stored in requestor S8
DTS8 = 0.4;            % Direct Trust of S8 

                        % S9
LRRS9 = ['SR3','SR6','SR9'];           % List of Recommendors stored in requestor S9                         
LRS9 = ['S7','S9','s2','S3','S1','S29'];                      % List of Servers stored in requestor S9                  
LSS9 = ['S2','S3','S9','S7','S29','S1','S22'];        % List of Locations stored in requestor S9
LScS9 = ['SR3','SR7','SR8'];      % List of Services stored in requestor S9
DTS9 = 0.1;            % Direct Trust of S9 

                        % S10
LRRS10 = ['S11','S12','S2','S30','S4','S28'];          % List of Recommendors stored in requestor S10                         
LRS10 = ['S1','S25','S3','S26'];                      % List of Servers stored in requestor S10                  
LSS10 = ['S13','S5','S11','S15','S5','S2','S30','S23'];        % List of Locations stored in requestor S10
LScS10 = ['SR30','SR26','SR27'];      % List of Services stored in requestor S10
DTS10 = 0.6;            % Direct Trust of S10 

                        % S11
LRRS11 = ['S11','S12','S2','S30','S4','S28'];          % List of Recommendors stored in requestor S11                         
LRS11 = ['S6','S15','S19','S29'];                      % List of Servers stored in requestor S11                  
LSS11 = ['S1','S2','S12','S21','S28','S18','S16','S14'];        % List of Locations stored in requestor S11
LScS11 = ['SR29','SR16','SR9'];      % List of Services stored in requestor S11
DTS11 = 0.8;            % Direct Trust of S11 

                        % S12
LRRS12 = ['S13','S5','S11','S15','S5','S2','S30','S23'];          % List of Recommendors stored in requestor S12                         
LRS12 = ['S11','S15','S5','S30'];                      % List of Servers stored in requestor S12                  
LSS12 = ['S13','S5','S11','S15','S5','S2','S30','S23'];        % List of Locations stored in requestor S12
LScS12 = ['SR3','SR6','SR9'];      % List of Services stored in requestor S12
DTS12 = 0.7;            % Direct Trust of S12 

                        % S13
LRRS13 = ['S1','S5','S25','S30'];             % List of Recommendors stored in requestor S13                         
LRS13 = ['S6','S11','S7','S9','S13','S29'];                      % List of Servers stored in requestor S13                  
LSS13 = ['S6','S7','S9','S11','S13','S29','S27','S22'];        % List of Locations stored in requestor S13
LScS13 = ['SR3','SR4','SR9'];      % List of Services stored in requestor S13
DTS13 = 0.9;            % Direct Trust of S13 

                        % S14
LRRS14 = ['S13','S5','S11','S15','S5','S2','S30','S23'];          % List of Recommendors stored in requestor S14                         
LRS14 = ['S7','S12','S18','S24'];                      % List of Servers stored in requestor S14                  
LSS14 = ['S13','S6','S17','S25','S22','S27','S30','S26'];        % List of Locations stored in requestor S14
LScS14 = ['SR4','SR15','SR10'];      % List of Services stored in requestor S14
DTS14 = 0.2;            % Direct Trust of S14 

                        % S15
LRRS15 = ['S11','S12','S2','S30','S4','S28'];          % List of Recommendors stored in requestor S15                         
LRS15 = ['S13','S15','S9','S29'];                      % List of Servers stored in requestor S15                  
LSS15 = ['S16','S7','S8','S15','S17','S22','S30','S23'];        % List of Locations stored in requestor S15
LScS15 = ['SR29','SR26','SR29'];      % List of Services stored in requestor S15
DTS15 = 0.9;            % Direct Trust of S15 

                        % S16
LRRS16 = ['SR30','SR26','SR27'];         % List of Recommendors stored in requestor S16                         
LRS16 = ['S16','S27','S24','S3'];                      % List of Servers stored in requestor S16                  
LSS16 = ['S13','S15','S18','S25','S14','S12','S17','S27'];        % List of Locations stored in requestor S16
LScS16 = ['SR9','SR20','SR30'];      % List of Services stored in requestor S16
DTS16 = 0.5;            % Direct Trust of S16 

                        % S17
LRRS17 = ['S6','S15','S19','S29'];          % List of Recommendors stored in requestor S17                         
LRS17 = ['S1','S11','S21','S29'];                      % List of Servers stored in requestor S17                  
LSS17 = ['S23','S25','S11','S16','S15','S12','S30','S19'];        % List of Locations stored in requestor S17
LScS17 = ['SR8','SR5','SR29'];      % List of Services stored in requestor S17
DTS17 = 0.7;            % Direct Trust of S17 

                        % S18
LRRS18 = ['SR3','SR4','SR9'];           % List of Recommendors stored in requestor S18                         
LRS18 = ['S18','S21','S26','S23'];                      % List of Servers stored in requestor S18                  
LSS18 = ['S23','S25','S21','S5','S17','S12','S16','S27'];        % List of Locations stored in requestor S18
LScS18 = ['SR4','SR8','SR28'];      % List of Services stored in requestor S18
DTS18 = 0.6;            % Direct Trust of S18 

                        % S19
LRRS19 = ['S7','S12','S18','S24'];           % List of Recommendors stored in requestor S19                         
LRS19 = ['S1','S14','S25','S23'];                      % List of Servers stored in requestor S19                  
LSS19 = ['S4','S14','S24','S5','S17','S18','S22','S27'];        % List of Locations stored in requestor S19
LScS19 = ['SR6','SR19','SR20'];      % List of Services stored in requestor S19
DTS19 = 0.8;            % Direct Trust of S19 

                        % S20
LRRS20 = ['S16','S27','S24','S3'];          % List of Recommendors stored in requestor S20                         
LRS20 = ['S21','S22','S27','S29'];                      % List of Servers stored in requestor S20                  
LSS20 = ['S13','S5','S19','S27','S29','S21','S30','S17'];        % List of Locations stored in requestor S20
LScS20 = ['SR8','SR15','SR27'];      % List of Services stored in requestor S20
DTS20 = 0.2;            % Direct Trust of S20 

                        % S21
LRRS21 = ['S1','S14','S25','S23'];         % List of Recommendors stored in requestor S21                         
LRS21 = ['S11','S15','S5','S30'];                      % List of Servers stored in requestor S21                  
LSS21 = ['S13','S5','S11','S15','S5','S2','S30','S23'];        % List of Locations stored in requestor S21
LScS21 = ['SR3','SR6','SR9'];      % List of Services stored in requestor S21
DTS21 = 0.7;            % Direct Trust of S21 

                        % S22
LRRS22 = ['S23','S25','S11','S16','S15','S12','S30','S19'];          % List of Recommendors stored in requestor S22                         
LRS22 = ['S19','S21','S26','S29'];                      % List of Servers stored in requestor S22                  
LSS22 = ['S13','S15','S18','S21','S22','S29','S17','S3'];        % List of Locations stored in requestor S22
LScS22 = ['SR2','SR16','SR26'];      % List of Services stored in requestor S22
DTS22 = 0.3;            % Direct Trust of S22 

                        % S23
LRRS23 = ['S11','S15','S5','S30'];          % List of Recommendors stored in requestor S23                         
LRS23 = ['S21','S25','S27','S30'];                      % List of Servers stored in requestor S23                  
LSS23 = ['S11','S15','S17','S19','S5','S4','S24','S26'];        % List of Locations stored in requestor S23
LScS23 = ['SR4','SR12','SR18'];      % List of Services stored in requestor S23
DTS23 = 0.8;            % Direct Trust of S23 

                        % S24
LRRS24 = ['SR3','SR6','SR9'];          % List of Recommendors stored in requestor S24                         
LRS24 = ['S28','S24','S22','S14'];                      % List of Servers stored in requestor S24                  
LSS24 = ['S4','S8','S19','S21','S26','S28','S30','S2'];        % List of Locations stored in requestor S24
LScS24 = ['SR30','SR26','SR9'];      % List of Services stored in requestor S24
DTS24 = 0.6;            % Direct Trust of S24 

                        % S25
LRRS25 = ['SR4','SR12','SR18'];          % List of Recommendors stored in requestor S25                         
LRS25 = ['S2','S12','S25','S28'];                      % List of Servers stored in requestor S25                  
LSS25 = ['S23','S25','S21','S1','S7','S9','S3','S19'];        % List of Locations stored in requestor S25
LScS25 = ['SR23','SR26','SR10'];      % List of Services stored in requestor S25
DTS25 = 0.9;            % Direct Trust of S25 

                        % S26
LRRS26 = ['S4','S8','S19','S21','S26','S28','S30','S2'];          % List of Recommendors stored in requestor S26                         
LRS26 = ['S1','S9','S19','S29'];                      % List of Servers stored in requestor S26                  
LSS26 = ['S23','S25','S21','S15','S17','S24','S28','S30'];        % List of Locations stored in requestor S26
LScS26 = ['SR25','SR6','SR20'];      % List of Services stored in requestor S26
DTS26 = 0.6;            % Direct Trust of S26 

                        % S27
LRRS27 = ['S21','S25','S27','S30'];             % List of Recommendors stored in requestor S27                         
LRS27 = ['S1','S18','S19','S29'];                      % List of Servers stored in requestor S27                  
LSS27 = ['S13','S15','S19','S21','S25','S29','S30','S17'];        % List of Locations stored in requestor S27
LScS27 = ['SR13','SR16','SR29'];      % List of Services stored in requestor S27
DTS27 = 0.4;            % Direct Trust of S27 

                        % S28
LRRS28 = ['SR25','SR6','SR20'];           % List of Recommendors stored in requestor S28                         
LRS28 = ['S19','S18','S5','S3'];                      % List of Servers stored in requestor S28                  
LSS28 = ['S23','S25','S12','S15','S1','S7','S3','S23'];        % List of Locations stored in requestor S28
LScS28 = ['SR7','SR18','SR29'];      % List of Services stored in requestor S28
DTS28 = 0.8;            % Direct Trust of S28 

                        % S29
LRRS29 = ['S16','S14','S18','S15','S4','S24','S28','S22'];          % List of Recommendors stored in requestor S29                         
LRS29 = ['S21','S19','S21','S27'];                      % List of Servers stored in requestor S29                  
LSS29 = ['S11','S17','S19','S21','S24','S27','S27','S28'];        % List of Locations stored in requestor S29
LScS29 = ['SR13','SR14','SR4'];      % List of Services stored in requestor S29
DTS29 = 0.5;            % Direct Trust of S29 

                        % S30
LRRS30 = ['S19','S18','S5','S3'];            % List of Recommendors stored in requestor S30                         
LRS30 = ['S21','S22','S1','S8'];                      % List of Servers stored in requestor S30                  
LSS30 = ['S16','S14','S18','S15','S4','S24','S28','S22'];        % List of Locations stored in requestor S30
LScS30 = ['SR2','SR18','SR14'];      % List of Services stored in requestor S30
DTS30 = 0.6;            % Direct Trust of S30 

CellArrayRecommenders = {LRRS1,LRRS2,LRRS3,LRRS4,LRRS5,LRRS6,LRRS7,LRRS8,LRRS9,LRRS10,LRRS11,LRRS12,LRRS13,LRRS14,LRRS15,LRRS16,LRRS17,LRRS18,LRRS19,LRRS20,LRRS21,LRRS22,LRRS23,LRRS24,LRRS25,LRRS26,LRRS27,LRRS28,LRRS29,LRRS30};
CellArrayServer = {LRS1,LRS2,LRS3,LRS4,LRS5,LRS6,LRS7,LRS8,LRS9,LRS10,LRS11,LRS12,LRS13,LRS14,LRS15,LRS16,LRS17,LRS18,LRS19,LRS20,LRS21,LRS22,LRS23,LRS24,LRS25,LRS26,LRS27,LRS28,LRS29,LRS30};
CellArrayLocations = {LSS1,LSS2,LSS3,LSS4,LSS5,LSS6,LSS7,LSS8,LSS9,LSS10,LSS11,LSS12,LSS13,LSS14,LSS15,LSS16,LSS17,LSS18,LSS19,LSS20,LSS21,LSS22,LSS23,LSS24,LSS25,LSS26,LSS27,LSS28,LSS29,LSS30};
CellArrayServices = {LScS1,LScS2,LScS3,LScS4,LScS5,LScS6,LScS7,LScS8,LScS9,LScS10,LScS11,LScS12,LScS13,LScS14,LScS15,LScS16,LScS17,LScS18,LScS19,LScS20,LScS21,LScS22,LScS23,LScS24,LScS25,LScS26,LScS27,LScS28,LScS29,LScS30};
CellArrayDirectTrust = {DTS1,DTS2,DTS3,DTS4,DTS5,DTS6,DTS7,DTS8,DTS9,DTS10,DTS11,DTS12,DTS13,DTS14,DTS15,DTS16,DTS17,DTS18,DTS19,DTS20,DTS21,DTS22,DTS23,DTS24,DTS25,DTS26,DTS27,DTS28,DTS29,DTS30};
%Alphaxyprime = 1;
% Betaxyprime = 1;

%IDESClassObj.numbr_instr = numbr_inst;
% NM = randi([10,25]);   % Immitating the number of Normal Messages
% BM = randi([10,25]);   % Immitating the number of Bogus Messages
for t = 1:numbr_instns
    %IDESClassObj.t = t;
    if(t == 1)
NM = randi([10,25]);   % Immitating the number of Normal Messages
BM = randi([10,25]);   % Immitating the number of Bogus Messages
%[IDESClassObj] = IDESClassObj.IdentifyingMV(IDESClassObj); 
xj(1:m,t)= rand([1,m]);   
n = randi([2,7]);   % Generating randomly the number of mallicious (or bogus) messages between 2 and 7....
% m is already defined by loading Above30A60A90PercentAllUpdtd15June2023.mat file.... 
ri(1:m,t) = rand([1,m]);   % Reputation of vehicle vi (downloaded by local server from central server)
pij(1:m,t) = rand([1,m]);
% IDESClassObj = ContextbasedHealthCare202320October2023(m,n,xj,ri,pij,NM,BM,Mi,c,numbr_instns);  % Declaring instance object of the class "ContextbasedHealthCare202320October2023"
% p(1:m,t) = rand([1,m]);  % Implementation of mechanism to determine trustworthiness of vehicles   
% p = 0;                   % This function calculates the threshold required for identifiying malaicious node p  
%taskType = 1;  %
Sxy = rand;    % Sx,y, it is a binary value where 1 represents satisfied experience and 0 not satisfied
Alphaxy = rand;  % Beta distribution parameters new values/scores 
Betaxy = rand;    % Beta distribution parameters new values/scores     
Alpha1xyprime = rand;  % Beta distribution parameters old values/scores 
Beta1xyprime = rand;  % Beta distribution parameters old values/scores 
Delattime = 100;   % We condisered this in milliseconds..
% Forjaccard = 0.5;   % Initialization based on the article "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"...
DecayFactorExp = 7 + (7-1)*rand;   % r = 20 + (150-20) .* rand(N,1) ... I could not find in the article..."Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"...
ForCosine = rand;   % Initialization based on the article "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"...
Forjaccard = rand;  % Initialization based on the article "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"...
Recomm = randi([1,30]);   % randi([min, max], [m, n])
SimSxz = 0.5;    % Initializing Server Similarity 
SimLxz = 0.5;    % Initializing Social Contact Similarity 
SimSrxz = 0.5;   % Initializing Service Similarity
% SimSxzArray  = zeros(numbr_instns,30);    % Storing server Similarity of all during any instant t for time period T   , wherease 30 is the number of servers, recommenders, services, and their locations..value obtained from article "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"    % Storing server Similarity of all during any instant t for time period T
SimSxzArray  = zeros(30);
%SimLxzArray   = zeros(numbr_instns,30);    % Storing server Similarity of all during any instant t for time period T   , wherease 30 is the number of servers, recommenders, services, and their locations..value obtained from article "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"    % Storing server Similarity of all during any instant t for time period T
SimLxzArray   = zeros(30);
% SimSrxzArray   = zeros(numbr_instns,30);    % Storing server Similarity of all during any instant t for time period T   , wherease 30 is the number of servers, recommenders, services, and their locations..value obtained from article "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"    % Storing server Similarity of all during any instant t for time period T
SimSrxzArray   = zeros(30);
% LSxz  = ['S19','S18','S5','S3'];             % List of Server similarity greater than 0.5
LSxz  = [];             % List of Server similarity greater than 0.5
% LPxz  = ['SR2','SR18','SR14'];               % List of Social Contact similarity greater than 0.5
LPxz  = [];               % List of Social Contact similarity greater than 0.5
% LSrxz = ['S2','S12','S25','S28'];            % List of Service similarity greater than 0.5
LSrxz = [];            % List of Service similarity greater than 0.5
Tdxy = 0.5;    % Direct trust output
Trxy = 0.5;    % InDirect trust output
HTdxy = 0;   % Entropy Direct trust 
HTrxy = 0;   % Entropy InDirect trust
    end
%SimInpA ,SimInpB,Recomm,simSxz,LSxz,Recommender
%%%%%%%%%%% Step 1 - IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function objparam = ContextbasedHealthCare202320October2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,K,taskType,numbr_instns,Beta,Sxy,Alphaxy,Betaxy,Alpha1xyprime,Beta1xyprime,Delattime,DecayFactorExp,Forjaccard,ForCosine,SimInpA,SimInpB,Recomm,simSxz,LSxz,Recommender)
% function objparam = ContextbasedHealthCare202320October2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,K,numbr_instns,Beta,Sxy,Alphaxy,Betaxy,Alpha1xyprime,Beta1xyprime,Delattime,DecayFactorExp,Forjaccard,ForCosine,Recomm,CellArrayRecommenders,CellArrayServer,CellArrayLocations,CellArrayServices,CellArrayDirectTrust)
% IDESClassObj = ContextbasedHealthCare202320October2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,K,numbr_instns,Beta,Sxy,Alphaxy,Betaxy,Alpha1xyprime,Beta1xyprime,Delattime,DecayFactorExp,Forjaccard,ForCosine,Recomm);  %  Declaring instance object of the class "ContextbasedHealthCare202320October2023"
% CBHClassObj = ContextbasedHealthCare202320October2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,K,numbr_instns,Beta,Sxy,Alphaxy,Betaxy,Alpha1xyprime,Beta1xyprime,Delattime,DecayFactorExp,Forjaccard,ForCosine,Recomm,CellArrayRecommenders,CellArrayServer,CellArrayLocations,CellArrayServices,CellArrayDirectTrust,SimSxz,SimLxz,SimSrxz,LSxz,LPxz,LSrxz);  %  Declaring instance object of the class "ContextbasedHealthCare202320October2023"
% CBHClassObj = ContextbasedHealthCare23Oct2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,K,numbr_instns,Beta,Sxy,Alphaxy,Betaxy,Alpha1xyprime,Beta1xyprime,Delattime,DecayFactorExp,Forjaccard,ForCosine,Recomm,CellArrayRecommenders,CellArrayServer,CellArrayLocations,CellArrayServices,CellArrayDirectTrust,SimSxz,SimLxz,SimSrxz,LSxz,LPxz,LSrxz,SimSxzArray,SimLxzArray,SimSrxzArray);  %  Declaring instance object of the class "ContextbasedHealthCare202320October2023"
 % ContextbasedHealthCare23Oct2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,K,numbr_instns,Beta,Sxy,Alphaxy,Betaxy,Alpha1xyprime,Beta1xyprime,Delattime,DecayFactorExp,Forjaccard,ForCosine,Recomm,CellArrayRecommenders,CellArrayServer,CellArrayLocations,CellArrayServices,CellArrayDirectTrust,SimSxz,SimLxz,SimSrxz,LSxz,LPxz,LSrxz,SimSxzArray,SimLxzArray,SimSrxzArray,Tdxy,Trxy)
 CBHClassObj = ContextbasedHealthCare23Oct2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,K,numbr_instns,Beta,Sxy,Alphaxy,Betaxy,Alpha1xyprime,Beta1xyprime,Delattime,DecayFactorExp,Forjaccard,ForCosine,Recomm,CellArrayRecommenders,CellArrayServer,CellArrayLocations,CellArrayServices,CellArrayDirectTrust,SimSxz,SimLxz,SimSrxz,LSxz,LPxz,LSrxz,SimSxzArray,SimLxzArray,SimSrxzArray,Tdxy,Trxy,HTdxy,HTrxy);  %  Declaring instance object of the class "ContextbasedHealthCare202320October2023"
% CBHClassObj2 = ContextbasedHealthCare202320October2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,K,numbr_instns,Beta,Sxy,Alphaxy,Betaxy,Alpha1xyprime,Beta1xyprime,Delattime,DecayFactorExp,Forjaccard,ForCosine,Recomm,CellArrayRecommenders,CellArrayServer,CellArrayLocations,CellArrayServices,CellArrayDirectTrust,SimSxz,SimLxz,SimSrxz,LSxz,LPxz,LSrxz);  %  Declaring instance object of the class "ContextbasedHealthCare202320October2023"
                            %(m,n,xj,ri,pij,NM,BM,c,Mi,numbr_instns)   %  And also calling constructor to initialize the parameters and the whole VFC scenario...        
% NumbrInstns = numbr_instns;
%%%%%%%%%%% Step 1 - TES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IDESClassObj = IDES15June2023(m,n,xj,ri,pij,NM,BM,c,Mi,t,p,numbr_instns);  %  Declaring instance object of the class "IDES15June2023"
%%%%%%%%%%% Step 2 - IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for k = 1:m
% IDESClassObj.p = IdentifyingMV(IDESClassObj);       %    % Implementation of mechanism to determine trustworthiness of vehicles   
%                                                                 % Thisfunction calculates the threshold required for identifiying malaicious node 
%                                                                 % The "p" variable is the threshold used in the next line to determinie the node...
% 
% if(ri(k,t) > IDESClassObj.p)                        % Detecting and identifying malacious node uisng the threshold value calculated by "IdentifyingMV" function...
% IDESClassObj.Mi(k,t) = k;
% end
% %IDESClassObj = IDES15June2023(m,n,xj,ri,pij,NM,BM,Mi,numbr_instns);    % Call constructor to update the parameters and the whole VFC scenario...  
% %%%%%%%%%%% Step 3 - IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IDESClassObj = PunishingMN(IDESClassObj);       % punishing malaciosu nodes....
% %%%%%%%%%%% Step 4-IDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IDESClassObj = IterativeRepManagt(IDESClassObj);       % Calculating the overal reputation in at time instant t to observe the effect of whole IDES mechanism.....
% end
% end
% AverageReputAllIDES = sum(objparam.ri,1);
%AverageReputAllIDES = sum(ri,1);
%for k = 1:CBHClassObj.Recomm
%SimSxz = CBHClassObj.Sim();
%,SimLxz,SimSrxz
%end
% Sxy,Alphaxyprime,Betaxyprime,Alphaxy,Betaxy,DecayFactorExp,Delattime,Alphaxyprime,Betaxyprime,Tdxy
%CBHClassObj = CBHClassObj.DirectTrust(CBHClassObj);           % Executing direct trust according to Algorithm-1
%CBHClassObj2.

  %   function [objparam] = DirectTrust(Sxy,Alphaxyprime,Betaxyprime,Alphaxy,Betaxy,DecayFactorExp,Delattime)     % Direct Trust Calculation
  Alphaxyprime =  Alpha1xyprime;
  Betaxyprime  =  Beta1xyprime;

                                        % Sxy,Alphaxyprime,Betaxyprime,Alphaxy,Betaxy,DecayFactorExp,Delattime     
% CBHClassObj = CBHClassObj.DirectTrust(CBHClassObj.Sxy,CBHClassObj.Alphaxyprime,CBHClassObj.Betaxyprime,CBHClassObj.Alphaxy,CBHClassObj.Betaxy,CBHClassObj.DecayFactorExp,CBHClassObj.Delattime);           % Executing direct trust according to Algorithm-1
                                    % Sxy,Alphaxyprime,Betaxyprime,Alphaxy,Betaxy,DecayFactorExp,Delattime 
% CBHClassObj = CBHClassObj.DirectTrust(CBHClassObj);                                    
%CBHClassObj.DirectTrust(CBHClassObj);  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Start script of Direct Trust

 if(CBHClassObj.Sxy == 0)                           % Use of if else statement : https://www.mathworks.com/help/matlab/ref/if.html
   CBHClassObj.Alphaxyprime = 1;
   CBHClassObj.Betaxyprime = 1;
 else
   CHClassObj.Alphaxyprime = rand;         % Store some positive value (We used random positive number)
   CBHClassObj.Betaxyprime = rand;          % Store some positive value (We used random positive number)
 end
 %end

 CBHClassObj.Alphaxy = exp(-CBHClassObj.DecayFactorExp*CBHClassObj.Delattime)*CBHClassObj.Alphaxyprime + CBHClassObj.Sxy;    % https://www.mathworks.com/help/matlab/ref/exp.html#bt9_gku-5  .... For exponential function... 
 CBHClassObj.Betaxy = exp(-CBHClassObj.DecayFactorExp*CBHClassObj.Delattime)*CBHClassObj.Betaxyprime + (1-CBHClassObj.Sxy);  
 % For unweighted InDirect trust
 %IntermediateDT1 = objparam.Alphaxy/(objparam.Alphaxy+objparam.Betaxy);              % Direct Trust Calculation...Line 14 of Algorithm-1
 CBHClassObj.Tdxy = CBHClassObj.Alphaxy/(CBHClassObj.Alphaxy+CBHClassObj.Betaxy);     % Direct Trust Calculation...Line 14 of Algorithm-1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End Script of Diect Trust
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % Start of Calling similarity function...%%%%%%%%%%%%%%%%%%%%%%%%
% CBHClassObj.InDirectTrust(CBHClassObj);            % Executing in direct trust according to Algorithm-1 

   index1 = 1;
        while(index1 <= CBHClassObj.Recomm)    
            randomIndexX = randi(numel(CBHClassObj.CellArrayServer));           % Generating random index of "objparam.CellArrayServer" array....For X user
            % CellArrayServer
            randomIndexZ = randi(numel(CBHClassObj.CellArrayServer));           % Generating random index of "objparam.CellArrayServer" array.... For Z Server

            %%%%%%%%%%%%%%%%%%%%%%%%% Start Split data  

          % Define the delimiter
            delimiter = 'S';
            CellDataX = CBHClassObj.CellArrayServer(randomIndexX); 
            CellDataZ = CBHClassObj.CellArrayServer(randomIndexZ); 

          % Loop through each cell and split the merged data
          %for i = 1:numel(randomIndexX)
          %splitData{i} = strsplit(randomIndexX{i}, delimiter);
          % splitData(i) = strsplit(randomIndexX{i}, delimiter);
          % splitData(i) = strsplit(randomIndexX(i), delimiter);
          % splitData = strsplit(randomIndexX, delimiter);
          % stringData = randomIndexX(1);
          % stringData = CellDataX(1);
          stringDataX = char(CellDataX{1});                           % strData = char(cellData{1});
          stringDataZ = char(CellDataZ{1});
          splitDataX = strsplit(stringDataX, delimiter);

          % Determine the desired size (maximum length of both arrays)
           maxSize = max(length(stringDataX), length(stringDataZ));
           PaddingElementsX = maxSize - length(stringDataX);
           PaddingElementsZ = maxSize - length(stringDataZ);
            % Pad the arrays to match the maximum size 
            if(PaddingElementsX > 0)
            paddedstringDataX = padarray(stringDataX, [0,PaddingElementsX], 'S', 'post');
            %paddedstringDataZ = padarray(stringDataZ, [0, PaddingElementsZ], '', 'post');
            end
            if(PaddingElementsX <= 0)
            paddedstringDataX = stringDataX;
            end
            if(PaddingElementsZ > 0)
            % paddedstringDataX = padarray(stringDataX, [0, PaddingElementsZ], '', 'post');
            paddedstringDataZ = padarray(stringDataZ, [0,PaddingElementsZ], 'S', 'post');
            end
            if(PaddingElementsZ <= 0)
            paddedstringDataZ = stringDataZ;
            end


           % Extend the shorter array by repeating it
           % while length(stringDataX) < maxSize
           %  stringDataX = [stringDataX, stringDataX]; % Concatenate array1 with itself
           % end 
           % 
           % while length(stringDataZ) < maxSize
           % stringDataZ = [stringDataZ, stringDataZ]; % Concatenate array2 with itself
           % end

          %end
            %%%%%%%%%%%%%%%%%%%%%%%%% End Split Data

            % Sim23October2023(CBHClassObj.CellArrayServer(randomIndexX),CBHClassObj.CellArrayServer(randomIndexZ));    % Calling similarity function...
            %Sim23October2023(stringDataX,stringDataY);    % Calling similarity function...,CBHClassObj.CellArrayServer(randomIndexZ));    % Calling similarity function...
            Sim23October2023(paddedstringDataX,paddedstringDataZ,CBHClassObj);
            %objparam.simSxz = objparam.Forjaccard;
            %objparam.simSxz = objparam.ForCosine;
            CBHClassObj.SimSxz = max(CBHClassObj.ForCosine,CBHClassObj.Forjaccard); 
            
            if(CBHClassObj.SimSxz >= 0.5)
                CBHClassObj.SimSxzArray(index1) = CBHClassObj.SimSxz;      % Storing trust values for utility in further equations...
                % objparam.CellArrayRecommenders(randomIndexX) = Recommender
                Recommender = CBHClassObj.CellArrayRecommenders(randomIndexX);
                %Recomm_size = size(Recommender,2);
                Recommstring = char(Recommender{1}); 
                RecommIndex = randi([1, size(Recommstring,2)]);
                LsxzZeroVisit = 0;
                if(size(CBHClassObj.LSxz) == 0)
                % CBHClassObj.LSxz = [CBHClassObj.LSxz,Recommstring(RecommIndex)];
                CBHClassObj.LSxz = Recommstring;
                LsxzZeroVisit = 1;
                end
                if(size(CBHClassObj.LSxz) ~= 0)
                    if(LsxzZeroVisit == 0)
                        CBHClassObj.LSxz = [CBHClassObj.LSxz,Recommstring(RecommIndex)];
                    end
                end
            end
        index1 = index1+1;
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % End of Calling similarity function...%%%%%%%%%%%%%%%%%%%%%%%%
clear CBHClassObj.Forjaccard CBHClassObj.ForCosine;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % Start of Social Contact similarity function...%%%%%%%%%%%%%%%%%%%%%%%%

  index2 = 1;
        while(index2 <= length(CBHClassObj.LSxz))    
            randomIndexSCSFX = randi(numel(CBHClassObj.CellArrayLocations));           % Generating random index of "objparam.CellArrayLocations" array....For X user
            % CellArrayServer
            randomIndexSCSFZ = randi(numel(CBHClassObj.CellArrayLocations));           % Generating random index of "objparam.CellArrayLocations" array.... For Z Server

            %%%%%%%%%%%%%%%%%%%%%%%%% Start Split data  

          % Define the delimiter
            delimiter = 'S';
            CellDataSCSFX = CBHClassObj.CellArrayServer(randomIndexSCSFX); 
            CellDataSCSFZ = CBHClassObj.CellArrayServer(randomIndexSCSFZ); 

          % Loop through each cell and split the merged data
          %for i = 1:numel(randomIndexX)
          %splitData{i} = strsplit(randomIndexX{i}, delimiter);
          % splitData(i) = strsplit(randomIndexX{i}, delimiter);
          % splitData(i) = strsplit(randomIndexX(i), delimiter);
          % splitData = strsplit(randomIndexX, delimiter);
          % stringData = randomIndexX(1);
          % stringData = CellDataX(1);
          stringDataSCSFX = char(CellDataSCSFX{1});                           % strData = char(cellData{1});
          stringDataSCSFZ = char(CellDataSCSFZ{1});
          splitDataSCSFX = strsplit(stringDataSCSFX, delimiter);

          % Determine the desired size (maximum length of both arrays)
           maxSize = max(length(stringDataSCSFX), length(stringDataSCSFZ));
           PaddingElementsSCSFX = maxSize - length(stringDataSCSFX);
           PaddingElementsSCSFZ = maxSize - length(stringDataSCSFZ);
            % Pad the arrays to match the maximum size 
            if(PaddingElementsSCSFX > 0)
            paddedstringDataSrSX = padarray(stringDataSCSFX, [0,PaddingElementsSCSFX], 'S', 'post');
            %paddedstringDataZ = padarray(stringDataZ, [0, PaddingElementsZ], '', 'post');
            end
            if(PaddingElementsSCSFX <= 0)
            paddedstringDataSrSX = stringDataSCSFX;
            end
            if(PaddingElementsSCSFZ > 0)
            % paddedstringDataX = padarray(stringDataX, [0, PaddingElementsZ], '', 'post');
            paddedstringDataSCSFZ = padarray(stringDataSCSFZ, [0,PaddingElementsSCSFZ], 'S', 'post');
            end
            if(PaddingElementsSCSFZ <= 0)
            paddedstringDataSCSFZ = stringDataSCSFZ;
            end


           % Extend the shorter array by repeating it
           % while length(stringDataX) < maxSize
           %  stringDataX = [stringDataX, stringDataX]; % Concatenate array1 with itself
           % end 
           % 
           % while length(stringDataZ) < maxSize
           % stringDataZ = [stringDataZ, stringDataZ]; % Concatenate array2 with itself
           % end

          %end
            %%%%%%%%%%%%%%%%%%%%%%%%% End Split Data

            % Sim23October2023(CBHClassObj.CellArrayServer(randomIndexX),CBHClassObj.CellArrayServer(randomIndexZ));    % Calling similarity function...
            %Sim23October2023(stringDataX,stringDataY);    % Calling similarity function...,CBHClassObj.CellArrayServer(randomIndexZ));    % Calling similarity function...
            SocialSim23October2023(paddedstringDataSrSX,paddedstringDataSCSFZ,CBHClassObj);
            %objparam.simSxz = objparam.Forjaccard;
            %objparam.simSxz = objparam.ForCosine;
            CBHClassObj.SimLxz = max(CBHClassObj.ForCosine,CBHClassObj.Forjaccard); 
            
            if(CBHClassObj.SimLxz >= 0.5)
                CBHClassObj.SimLxzArray(index2) = CBHClassObj.SimLxz;      % Storing trust values for utility in further equations...
                % objparam.CellArrayRecommenders(randomIndexX) = Recommender
                Recommender = CBHClassObj.CellArrayRecommenders(randomIndexX);
                %Recomm_size = size(Recommender,2);
                Recommstring = char(Recommender{1}); 
                RecommIndex = randi([1, size(Recommstring,2)]);
                LsxzZeroVisit = 0;
                if(size(CBHClassObj.LPxz) == 0)
                % CBHClassObj.LSxz = [CBHClassObj.LSxz,Recommstring(RecommIndex)];
                CBHClassObj.LPxz = Recommstring;
                LPxzZeroVisit = 1;
                end
                if(size(CBHClassObj.LPxz) ~= 0)
                    if(LPxzZeroVisit == 0)
                        CBHClassObj.LPxz = [CBHClassObj.LPxz,Recommstring(RecommIndex)];
                    end
                end
            end
        index2 = index2+1;
        end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % End of Social Contact similarity function...%%%%%%%%%%%%%%%%%%%%%%%%
clear CBHClassObj.Forjaccard CBHClassObj.ForCosine;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % Start of Service similarity function...%%%%%%%%%%%%%%%%%%%%%%%%

index3 = 1;
        while(index3 <= length(CBHClassObj.LPxz))    
            randomIndexSrSX = randi(numel(CBHClassObj.CellArrayServices));           % Generating random index of "objparam.CellArrayLocations" array....For X user
            % CellArrayServer
            randomIndexSrSZ = randi(numel(CBHClassObj.CellArrayServices));           % Generating random index of "objparam.CellArrayLocations" array.... For Z Server

            %%%%%%%%%%%%%%%%%%%%%%%%% Start Split data  

          % Define the delimiter
            delimiter = 'S';
            CellDataSrSX = CBHClassObj.CellArrayServer(randomIndexSrSX); 
            CellDataSrSZ = CBHClassObj.CellArrayServer(randomIndexSrSZ); 

          % Loop through each cell and split the merged data
          %for i = 1:numel(randomIndexX)
          %splitData{i} = strsplit(randomIndexX{i}, delimiter);
          % splitData(i) = strsplit(randomIndexX{i}, delimiter);
          % splitData(i) = strsplit(randomIndexX(i), delimiter);
          % splitData = strsplit(randomIndexX, delimiter);
          % stringData = randomIndexX(1);
          % stringData = CellDataX(1);
          stringDataSrSX = char(CellDataSrSX{1});                           % strData = char(cellData{1});
          stringDataSrSZ = char(CellDataSrSZ{1});
          splitDataSrSX = strsplit(stringDataSrSX, delimiter);

          % Determine the desired size (maximum length of both arrays)
           maxSize = max(length(stringDataSrSX), length(stringDataSrSZ));
           PaddingElementsSrSX = maxSize - length(stringDataSrSX);
           PaddingElementsSrSZ = maxSize - length(stringDataSrSZ);
            % Pad the arrays to match the maximum size 
            if(PaddingElementsSrSX > 0)
            paddedstringDataSrSX = padarray(stringDataSrSX, [0,PaddingElementsSrSX], 'S', 'post');
            %paddedstringDataZ = padarray(stringDataZ, [0, PaddingElementsZ], '', 'post');
            end
            if(PaddingElementsSrSX <= 0)
            paddedstringDataSrSX = stringDataSrSX;
            end
            if(PaddingElementsSrSZ > 0)
            % paddedstringDataX = padarray(stringDataX, [0, PaddingElementsZ], '', 'post');
            paddedstringDataSrSZ = padarray(stringDataSrSZ, [0,PaddingElementsSrSZ], 'S', 'post');
            end
            if(PaddingElementsSrSZ <= 0)
            paddedstringDataSrSZ = stringDataSrSZ;
            end


           % Extend the shorter array by repeating it
           % while length(stringDataX) < maxSize
           %  stringDataX = [stringDataX, stringDataX]; % Concatenate array1 with itself
           % end 
           % 
           % while length(stringDataZ) < maxSize
           % stringDataZ = [stringDataZ, stringDataZ]; % Concatenate array2 with itself
           % end

          %end
            %%%%%%%%%%%%%%%%%%%%%%%%% End Split Data

            % Sim23October2023(CBHClassObj.CellArrayServer(randomIndexX),CBHClassObj.CellArrayServer(randomIndexZ));    % Calling similarity function...
            %Sim23October2023(stringDataX,stringDataY);    % Calling similarity function...,CBHClassObj.CellArrayServer(randomIndexZ));    % Calling similarity function...
            ServiceSim24October2023(paddedstringDataSrSX,paddedstringDataSCSFZ,CBHClassObj);
            %objparam.simSxz = objparam.Forjaccard;
            %objparam.simSxz = objparam.ForCosine;
            CBHClassObj.SimSrxz = max(CBHClassObj.ForCosine,CBHClassObj.Forjaccard); 
            
            if(CBHClassObj.SimSrxz >= 0.5)
                CBHClassObj.SimSrxzArray(index3) = CBHClassObj.SimSrxz;      % Storing trust values for utility in further equations...
                % objparam.CellArrayRecommenders(randomIndexX) = Recommender
                Recommender = CBHClassObj.CellArrayRecommenders(randomIndexX);
                %Recomm_size = size(Recommender,2);
                Recommstring = char(Recommender{1}); 
                RecommIndex = randi([1, size(Recommstring,2)]);
                LsxzZeroVisit = 0;
                if(size(CBHClassObj.LSrxz) == 0)
                % CBHClassObj.LSxz = [CBHClassObj.LSxz,Recommstring(RecommIndex)];
                CBHClassObj.LSrxz = Recommstring;
                LPxzZeroVisit = 1;
                end
                if(size(CBHClassObj.LSrxz) ~= 0)
                    if(LPxzZeroVisit == 0)
                        CBHClassObj.LSrxz = [CBHClassObj.LSrxz,Recommstring(RecommIndex)];
                    end
                end
            end
        index3 = index3+1;
        end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % Start of Calculaing Total similarity function (Indirect trust)...%%%%%%%%%%%%%%%%%%%%%%%%
% Concatenate the arrays along a specified dimension (e.g., 3rd dimension)
combinedSimilarityArray1 = [CBHClassObj.SimSrxzArray CBHClassObj.SimSxzArray CBHClassObj.SimLxzArray];
n3 = randi([1,30]);   % randi([min, max], [m, n])   % Immitating top 3 recommenders...
SumAllSimxzNumerator = sum(combinedSimilarityArray1(1:n));
SumAllSimxzDenominrator = sum(combinedSimilarityArray1,'all');
CBHClassObj.Trxy =  SumAllSimxzNumerator/SumAllSimxzDenominrator;           % Calculating Indirect trust ... Equation 11 of "Context-Based Adaptive Fog Computing Trust Solution for Time-Critical Smart Healthcare Systems"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % End of Calucalting Total similarity function (Indirect trust)...%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % Start of Calucalting Adaptive Weight...%%%%%%%%%%%%%%%%%%%%%%%%
 CBHClassObj.HTdxy = -CBHClassObj.Tdxy*log(CBHClassObj.Tdxy) - (1-CBHClassObj.Tdxy)*log(1-CBHClassObj.Tdxy);    % Calculating direct entropy
 CBHClassObj.HTrxy = -CBHClassObj.Trxy*log(CBHClassObj.Trxy) - (1-CBHClassObj.Trxy)*log(1-CBHClassObj.Trxy);    % Calculating Indirect entropy

 w = (1-CBHClassObj.HTdxy/log(CBHClassObj.Tdxy))/((1-CBHClassObj.HTdxy/log(CBHClassObj.Tdxy)+(1-CBHClassObj.HTrxy/log(CBHClassObj.Trxy))));    % Calculating adaptive weight....
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % End of Calucalting Adaptive Weight...%%%%%%%%%%%%%%%%%%%%%%%%


TotalTrustxy = w*CBHClassObj.Tdxy + (1-w)*CBHClassObj.Trxy;
SaveTotalTrustArray(t,1) = TotalTrustxy;
end

% The relevant workspace is saved by the name % "TrustVFCAllMethodsWithoutLog24October2023.mat".....
