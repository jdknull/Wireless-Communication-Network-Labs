% User data 
user1_data = [0 0 0 0 0 0 0 0];
user2_data = [1 1 1 1 0 0 0 0];  
user3_data = [1 1 1 1 1 1 1 1];

% Spreading codes
user1_code = [0 1 0 1 0 1 0 1];
user2_code = [0 0 1 1 0 0 1 1]; 
user3_code = [0 0 0 0 0 0 0 0];

% XOR spread data with codes
user1_spread = xor(user1_data,user1_code);
user2_spread = xor(user2_data,user2_code);
user3_spread = xor(user3_data,user3_code);

disp('Spread data:');
disp(user1_spread);
disp(user2_spread);
disp(user3_spread);


% Generate waveforms 
user1_waveform = size(user1_spread);
user1_waveform(user1_spread == 0) = 1; % 0 = +1V
user1_waveform(user1_spread == 1) = -1; % 1 = -1V

user2_waveform = size(user2_spread);
user2_waveform(user2_spread == 0) = 1; % 0 = +1V
user2_waveform(user2_spread == 1) = -1; % 1 = -1V

user3_waveform = size(user3_spread);
user3_waveform(user3_spread == 0) = 1; % 0 = +1V
user3_waveform(user3_spread == 1) = -1; % 1 = -1V

disp('Users waveforms:');
disp(user1_waveform);
disp(user2_waveform);
disp(user3_waveform);


% Combine waveforms
c_signal = user1_waveform + user2_waveform + user3_waveform;

disp('Transmitted signal:');
disp(c_signal);

% Generate waveforms 
user1_codeW = size(user1_code);
user1_codeW(user1_code == 0) = 1; % 0 = +1V
user1_codeW(user1_code == 1) = -1; % 1 = -1V

user2_codeW = size(user2_code);
user2_codeW(user2_code == 0) = 1; % 0 = +1V
user2_codeW(user2_code == 1) = -1; % 1 = -1V

user3_codeW = size(user3_code);
user3_codeW(user3_code == 0) = 1; % 0 = +1V
user3_codeW(user3_code == 1) = -1; % 1 = -1V

disp('Users waveforms:');
disp(user1_codeW);
disp(user2_codeW);
disp(user3_codeW);

% Extract user 1 data
u1_data1 = dot(c_signal(1:4),user1_codeW(1:4))/4;
u1_data2 = dot(c_signal(5:8),user1_codeW(5:8))/4;
disp('User 1 extracted data:');
user1D = [u1_data1 u1_data2];
disp(user1D);

% Extract user 2 data  
u2_data1 = dot(c_signal(1:4),user2_codeW(1:4))/4;
u2_data2 = dot(c_signal(5:8),user2_codeW(5:8))/4;
disp('User 2 extracted data:');
user2D =[u2_data1 u2_data2];
disp(user2D);

% Extract user 3 data
u3_data1 = dot(c_signal(1:4),user3_codeW(1:4))/4; 
u3_data2 = dot(c_signal(5:8),user3_codeW(5:8))/4;
disp('User 3 extracted data:');
user3D = [u3_data1 u3_data2];
disp(user3D);


% Convert to binary 
user1_data = size(user1D);
user1_data(user1D == 1) = 0; % 0 = +1V
user1_data(user1D == -1) = 1; % 1 = -1V

user2_data = size(user2D);
user2_data(user2D == 1) = 0; % 0 = +1V
user2_data(user2D == -1) = 1; % 1 = -1V

user3_data = size(user3D);
user3_data(user3D == 1) = 0; % 0 = +1V
user3_data(user3D == -1) = 1; % 1 = -1V

disp('Users waveforms:');
disp(user1_data);
disp(user2_data);
disp(user3_data);
