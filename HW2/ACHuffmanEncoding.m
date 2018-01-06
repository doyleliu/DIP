function outbit=ACHuffmanEncoding(x,y) 
%AC Huffman encoding funcnts like Dc encoding 
temp=x;
tempp=y;
tmp_value=abs(y);
if tmp_value==1;amplitude=1;
elseif(tmp_value >=   2 && tmp_value <=    3);amplitude = 2;
elseif(tmp_value >=   4 && tmp_value <=    7);amplitude = 3;
elseif(tmp_value >=   8 && tmp_value <=   15);amplitude = 4;
elseif(tmp_value >=  16 && tmp_value <=   31);amplitude = 5;
elseif(tmp_value >=  32 && tmp_value <=   63);amplitude = 6;
elseif(tmp_value >=  64 && tmp_value <=  127);amplitude = 7;
elseif(tmp_value >= 128 && tmp_value <=  255);amplitude = 8;
elseif(tmp_value >= 256 && tmp_value <=  511);amplitude = 9;
elseif(tmp_value >= 512 && tmp_value <= 1023);amplitude = 10;
end 
 
if (temp==0 && amplitude==1); codelen=2;accode=0;%accode=00;
elseif  (temp==0 && amplitude==2);codelen=2;accode=1;%accode=01;
elseif  (temp==0 && amplitude==3);codelen=3;accode=4;%accode=100;
elseif  (temp==0 && amplitude==4);codelen=4;accode=11;%accode=1011;
elseif  (temp==0 && amplitude==5);codelen=5;accode=26;%accode=1 1010;
elseif  (temp==0 && amplitude==6);codelen=7;accode=120;%accode=111 1000;
elseif  (temp==0 && amplitude==7);codelen=8;accode=248;%accode=1111 1000;
elseif  (temp==0 && amplitude==8);codelen=10;accode=1014;%accode=11 1111 0110;  
elseif  (temp==0 && amplitude==9);codelen=16;accode=65410;%accode=1111 1111 1000 0010;
elseif (temp==0 && amplitude==10);codelen=16;accode=65411;%accode=1111 1111 1000 0011;
    
elseif  (temp==1 && amplitude==1); codelen=4;accode=12;   %accode=1100;
elseif  (temp==1 && amplitude==2); codelen=5;accode=27;   %accode=1 1011;
elseif  (temp==1 && amplitude==3); codelen=7;accode=121;  %accode=1111 001;
elseif  (temp==1 && amplitude==4); codelen=9;accode=502;  %accode=1 1111 0110;
elseif  (temp==1 && amplitude==5);codelen=11;accode=2038; %accode=111 1111 0110;
elseif  (temp==1 && amplitude==6);codelen=16;accode=65412;%accode=1111 1111 1000 0100;
elseif  (temp==1 && amplitude==7);codelen=16;accode=65413;%accode=1111 1111 1000 0101;
elseif  (temp==1 && amplitude==8);codelen=16;accode=65414;%accode=1111 1111 1000 0110;  
elseif  (temp==1 && amplitude==9);codelen=16;accode=65415;%accode=1111 1111 1000 0111;
elseif (temp==1 && amplitude==10);codelen=16;accode=65416;%accode=1111 1111 1000 1000;
    
elseif (temp==2 && amplitude==1);codelen=5;accode=28;%accode=1 1100;
elseif (temp==2 && amplitude==2);codelen=8;accode=249;%accode=1111 1001;
elseif (temp==2 && amplitude==3);codelen=10;accode=1015;%accode=11 1111 0111;
elseif (temp==2 && amplitude==4);codelen=12;accode=4084;%accode=1111 1111 0100;
elseif (temp==2 && amplitude==5);codelen=16;accode=65417;%accode=1111 1111 1000 1001;
elseif (temp==2 && amplitude==6);codelen=16;accode=65418;%accode=1111 1111 1000 1010;
elseif (temp==2 && amplitude==7);codelen=16;accode=65419;%accode=1111 1111 1000 1011;
elseif (temp==2 && amplitude==8);codelen=16;accode=65420;%accode=1111 1111 1000 1100;  
elseif (temp==2 && amplitude==9);codelen=16;accode=65421;%accode=1111 1111 1000 1101;
elseif (temp==2 && amplitude==10);codelen=16;accode=65422;%accode=1111 1111 1000 1110;
    
    
elseif (temp==3 && amplitude==1);codelen=6;accode=58;%accode=1 11010;
elseif (temp==3 && amplitude==2);codelen=9;accode=503;%accode=1 1111 0111;
elseif (temp==3 && amplitude==3);codelen=12;accode=4085;%accode=1111 1111 0101;
elseif (temp==3 && amplitude==4);codelen=16;accode=65423;%accode=1111 1111 1000 1111;
elseif (temp==3 && amplitude==5);codelen=16;accode=65424;%accode=1111 1111 1001 0000;
elseif (temp==3 && amplitude==6);codelen=16;accode=65425;%accode=1111 1111 1001 0001;
elseif (temp==3 && amplitude==7);codelen=16;accode=65426;%accode=1111 1111 1001 0010;
elseif (temp==3 && amplitude==8);codelen=16;accode=65427;%accode=1111 1111 1001 0011;  
elseif (temp==3 && amplitude==9);codelen=16;accode=65428;%accode=1111 1111 1001 0100;
elseif (temp==3 && amplitude==10);codelen=16;accode=65429;%accode=1111 1111 1001 0101;
    
    
elseif (temp==4 && amplitude==1);codelen=6;accode=59;%accode=11 1011;
elseif (temp==4 && amplitude==2);codelen=10;accode=1016;%accode=11 1111 1000;
elseif (temp==4 && amplitude==3);codelen=16;accode=65430;%accode=1111 1111 1001 0110;
elseif (temp==4 && amplitude==4);codelen=16;accode=65431;%accode=1111 1111 1001 0111;
elseif (temp==4 && amplitude==5);codelen=16;accode=65432;%accode=1111 1111 1001 1000;
elseif (temp==4 && amplitude==6);codelen=16;accode=65433;%accode=1111 1111 1001 1001;
elseif (temp==4 && amplitude==7);codelen=16;accode=65434;%accode=1111 1111 1001 1010;
elseif (temp==4 && amplitude==8);codelen=16;accode=65435;%accode=1111 1111 1001 1011;  
elseif (temp==4 && amplitude==9);codelen=16;accode=65436;%accode=1111 1111 1001 1100;
elseif (temp==4 && amplitude==10);codelen=16;accode=65437;%accode=1111 1111 1001 1101;
    
elseif (temp==5 && amplitude==1);codelen=7;accode=122;%accode=111 1010;
elseif (temp==5 && amplitude==2);codelen=11;accode=2039;%accode=111 1111 0111;
elseif (temp==5 && amplitude==3);codelen=16;accode=65438;%accode=1111 1111 1001 1110;
elseif (temp==5 && amplitude==4);codelen=16;accode=65439;%accode=1111 1111 1001 1111;
elseif (temp==5 && amplitude==5);codelen=16;accode=65440;%accode=1111 1111 1010 0000;
elseif (temp==5 && amplitude==6);codelen=16;accode=65441;%accode=1111 1111 1010 0001;
elseif (temp==5 && amplitude==7);codelen=16;accode=65442;%accode=1111 1111 1010 0010;
elseif (temp==5 && amplitude==8);codelen=16;accode=65443;%accode=1111 1111 1010 0011;  
elseif (temp==5 && amplitude==9);codelen=16;accode=65444;%accode=1111 1111 1010 0100;
elseif (temp==5 && amplitude==10);codelen=16;accode=65445;%accode=1111 1111 1010 0101;

elseif (temp==6 && amplitude==1);codelen=7;accode=123;%accode=11 11011;
elseif (temp==6 && amplitude==2);codelen=12;accode=4086;%accode=1111 1111 0110;
elseif (temp==6 && amplitude==3);codelen=16;accode=65446;%accode=1111 1111 1010 0110;
elseif (temp==6 && amplitude==4);codelen=16;accode=65447;%accode=1111 1111 1010 0111;
elseif (temp==6 && amplitude==5);codelen=16;accode=65448;%accode=1111 1111 1010 1000;
elseif (temp==6 && amplitude==6);codelen=16;accode=65449;%accode=1111 1111 1010 1001;
elseif (temp==6 && amplitude==7);codelen=16;accode=65450;%accode=1111 1111 1010 1010;
elseif (temp==6 && amplitude==8);codelen=16;accode=65451;%accode=1111 1111 1010 1011;  
elseif (temp==6 && amplitude==9);codelen=16;accode=65452;%accode=1111 1111 1010 1100;
elseif (temp==6 && amplitude==10);codelen=16;accode=65453;%accode=1111 1111 1010 1101;
    
    
elseif (temp==7 && amplitude==1);codelen=8;accode=250;%accode=1111 1010;
elseif (temp==7 && amplitude==2);codelen=12;accode=4087;%accode=1111 1111 0111;
elseif (temp==7 && amplitude==3);codelen=16;accode=65454;%accode=1111 1111 1010 1110;
elseif (temp==7 && amplitude==4);codelen=16;accode=65455;%accode=1111 1111 1010 1111;
elseif (temp==7 && amplitude==5);codelen=16;accode=65456;%accode=1111 1111 1011 0000;
elseif (temp==7 && amplitude==6);codelen=16;accode=65457;%accode=1111 1111 1011 0001;
elseif (temp==7 && amplitude==7);codelen=16;accode=65458;%accode=1111 1111 1011 0010;
elseif (temp==7 && amplitude==8);codelen=16;accode=65459;%accode=1111 1111 1011 0011;  
elseif (temp==7 && amplitude==9);codelen=16;accode=65460;%accode=1111 1111 1011 0100;
elseif (temp==7 && amplitude==10);codelen=16;accode=65461;%accode=1111 1111 1011 0101;
    
elseif (temp==8 && amplitude==1);codelen=9;accode=504;%accode=1 1111 1000;
elseif (temp==8 && amplitude==2);codelen=15;accode=32704;%accode=111 1111 1100 0000;
elseif (temp==8 && amplitude==3);codelen=16;accode=65462;%accode=1111 1111 1011 0110;
elseif (temp==8 && amplitude==4);codelen=16;accode=65463;%accode=1111 1111 1011 0111;
elseif (temp==8 && amplitude==5);codelen=16;accode=65464;%accode=1111 1111 1011 1000;
elseif (temp==8 && amplitude==6);codelen=16;accode=65465;%accode=1111 1111 1011 1001;
elseif (temp==8 && amplitude==7);codelen=16;accode=65466;%accode=1111 1111 0011 1010;
elseif (temp==8 && amplitude==8);codelen=16;accode=65467;%accode=1111 1111 1011 1011;  
elseif (temp==8 && amplitude==9);codelen=16;accode=65468;%accode=1111 1111 1011 1100;
elseif (temp==8 && amplitude==10);codelen=16;accode=65469;%accode=1111 1111 1011 1101;
    
elseif (temp==9 && amplitude==1);codelen=9;accode=505;%accode=1 1111 1001;
elseif (temp==9 && amplitude==2);codelen=16;accode=65470;%accode=1111 1111 1011 1110;
elseif (temp==9 && amplitude==3);codelen=16;accode=65471;%accode=1111 1111 1011 1111;
elseif (temp==9 && amplitude==4);codelen=16;accode=65472;%accode=1111 1111 1100 0000;
elseif (temp==9 && amplitude==5);codelen=16;accode=65473;%accode=1111 1111 1100 0001;
elseif (temp==9 && amplitude==6);codelen=16;accode=65474;%accode=1111 1111 1100 0010;
elseif (temp==9 && amplitude==7);codelen=16;accode=65475;%accode=1111 1111 1100 0011;
elseif (temp==9 && amplitude==8);codelen=16;accode=65476;%accode=1111 1111 1100 0100;  
elseif (temp==9 && amplitude==9);codelen=16;accode=65477;%accode=1111 1111 1100 0101;
elseif (temp==9 && amplitude==10);codelen=16;accode=65478;%accode=1111 1111 1100 0110;

elseif (temp==10 && amplitude==1);codelen=9;accode=506;%accode=1 1111 1010;
elseif (temp==10 && amplitude==2);codelen=16;accode=65479;%accode=1111 1111 1100 0111;
elseif (temp==10 && amplitude==3);codelen=16;accode=65480;%accode=1111 1111 1100 1000;
elseif (temp==10 && amplitude==4);codelen=16;accode=65481;%accode=1111 1111 1100 1001;
elseif (temp==10 && amplitude==5);codelen=16;accode=65482;%accode=1111 1111 1100 1010;
elseif (temp==10 && amplitude==6);codelen=16;accode=65483;%accode=1111 1111 1100 1011;
elseif (temp==10 && amplitude==7);codelen=16;accode=65484;%accode=1111 1111 1100 1100;
elseif (temp==10 && amplitude==8);codelen=16;accode=65485;%accode=1111 1111 1100 1101;  
elseif (temp==10 && amplitude==9);codelen=16;accode=65486;%accode=1111 1111 1100 1110;
elseif (temp==10 && amplitude==10);codelen=16;accode=65487;%accode=1111 1111 1100 1111;

elseif (temp==11 && amplitude==1);codelen=10;accode=1017;%accode=11 1111 1001;
elseif (temp==11 && amplitude==2);codelen=16;accode=65488;%accode=1111 1111 1101 0000;
elseif (temp==11 && amplitude==3);codelen=16;accode=65489;%accode=1111 1111 1101 0001;
elseif (temp==11 && amplitude==4);codelen=16;accode=65490;%accode=1111 1111 1101 0010;
elseif (temp==11 && amplitude==5);codelen=16;accode=65491;%accode=1111 1111 1101 0011;
elseif (temp==11 && amplitude==6);codelen=16;accode=65492;%accode=1111 1111 1101 0100;
elseif (temp==11 && amplitude==7);codelen=16;accode=65493;%accode=1111 1111 1101 0101;
elseif (temp==11 && amplitude==8);codelen=16;accode=65494;%accode=1111 1111 1101 0110;  
elseif (temp==11 && amplitude==9);codelen=16;accode=65495;%accode=1111 1111 1101 0111;
elseif (temp==11 && amplitude==10);codelen=16;accode=65496;%accode=1111 1111 1101 1000;
 
elseif  (temp==12 && amplitude==1);codelen=10;accode=1018; %accode=11 1111 1010;
elseif  (temp==12 && amplitude==2);codelen=16;accode=65497;%accode=1111 1111 1101 1001;
elseif  (temp==12 && amplitude==3);codelen=16;accode=65498;%accode=1111 1111 1101 1010;
elseif  (temp==12 && amplitude==4);codelen=16;accode=65499;%accode=1111 1111 1101 1011;
elseif  (temp==12 && amplitude==5);codelen=16;accode=65500;%accode=1111 1111 1101 1100;
elseif  (temp==12 && amplitude==6);codelen=16;accode=65501;%accode=1111 1111 1101 1101;
elseif  (temp==12 && amplitude==7);codelen=16;accode=65502;%accode=1111 1111 1101 1110;
elseif  (temp==12 && amplitude==8);codelen=16;accode=65503;%accode=1111 1111 1101 1111;  
elseif  (temp==12 && amplitude==9);codelen=16;accode=65504;%accode=1111 1111 1110 0000;
elseif (temp==12 && amplitude==10);codelen=16;accode=65505;%accode=1111 1111 1110 0001;
    
elseif  (temp==13 && amplitude==1);codelen=11;accode=2040; %accode=111 1111 1000;
elseif  (temp==13 && amplitude==2);codelen=16;accode=65506;%accode=1111 1111 1110 0010;
elseif  (temp==13 && amplitude==3);codelen=16;accode=65507;%accode=1111 1111 1110 0011;
elseif  (temp==13 && amplitude==4);codelen=16;accode=65508;%accode=1111 1111 1110 0100;
elseif  (temp==13 && amplitude==5);codelen=16;accode=65509;%accode=1111 1111 1110 0101;
elseif  (temp==13 && amplitude==6);codelen=16;accode=65510;%accode=1111 1111 1110 0110;
elseif  (temp==13 && amplitude==7);codelen=16;accode=65511;%accode=1111 1111 1110 0111;
elseif  (temp==13 && amplitude==8);codelen=16;accode=65512;%accode=1111 1111 1110 1000;  
elseif  (temp==13 && amplitude==9);codelen=16;accode=65513;%accode=1111 1111 1110 1001;
elseif (temp==13 && amplitude==10);codelen=16;accode=65514;%accode=1111 1111 1110 1010;    
    
elseif  (temp==14 && amplitude==1);codelen=16;accode=65515;%accode=1111 1111 1110 1011;
elseif  (temp==14 && amplitude==2);codelen=16;accode=65516;%accode=1111 1111 1110 1100;
elseif  (temp==14 && amplitude==3);codelen=16;accode=65517;%accode=1111 1111 1110 1101;
elseif  (temp==14 && amplitude==4);codelen=16;accode=65518;%accode=1111 1111 1110 1110;
elseif  (temp==14 && amplitude==5);codelen=16;accode=65519;%accode=1111 1111 1110 1111;
elseif  (temp==14 && amplitude==6);codelen=16;accode=65520;%accode=1111 1111 1111 0000;
elseif  (temp==14 && amplitude==7);codelen=16;accode=65521;%accode=1111 1111 1111 0001;
elseif  (temp==14 && amplitude==8);codelen=16;accode=65522;%accode=1111 1111 1111 0010;  
elseif  (temp==14 && amplitude==9);codelen=16;accode=65523;%accode=1111 1111 1111 0011;
elseif (temp==14 && amplitude==10);codelen=16;accode=65524;%accode=1111 1111 1111 0100;      
    
elseif  (temp==15 && amplitude==1);codelen=16;accode=65525;%accode=1111 1111 1111 0101;
elseif  (temp==15 && amplitude==2);codelen=16;accode=65526;%accode=1111 1111 1111 0110;
elseif  (temp==15 && amplitude==3);codelen=16;accode=65527;%accode=1111 1111 1111 0111;
elseif  (temp==15 && amplitude==4);codelen=16;accode=65528;%accode=1111 1111 1111 1000;
elseif  (temp==15 && amplitude==5);codelen=16;accode=65529;%accode=1111 1111 1111 1001;
elseif  (temp==15 && amplitude==6);codelen=16;accode=65530;%accode=1111 1111 1111 1010;
elseif  (temp==15 && amplitude==7);codelen=16;accode=65531;%accode=1111 1111 1111 1011; 
elseif  (temp==15 && amplitude==8);codelen=16;accode=65532;%accode=1111 1111 1111 1100; 
elseif  (temp==15 && amplitude==9);codelen=16;accode=65533;%accode=1111 1111 1111 1101;
elseif (temp==15 && amplitude==10);codelen=16;accode=65534;%accode=1111 1111 1111 1110;      
end
if tempp>0;
     outbit=[dec2bin(accode,codelen),dec2bin(tmp_value,amplitude)];
else outbit=[dec2bin(accode,codelen),dec2bin(2^amplitude-1-tmp_value,amplitude)];
end
