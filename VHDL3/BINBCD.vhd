entity BINBCD is 
  port(SW2: in bit_vector(7 downto 0);
       bcd1:out bit_vector(3 downto 0 );
       bcd2:out bit_vector(3 downto 0 );
       bcd3:out bit_vector(3 downto 0 ));
       
end BINBCD;
 
 architecture arrangement of BINBCD is
   
  component ciBINBCD is
     port (A: in bit_vector(3 downto 0);
           S: out bit_vector(3 downto 0));
   end component; 
   
  
   
   signal ci01_out, ci02_out, ci03_out, ci04_out, ci05_out, ci06_out, ci07_out: bit_vector(3 downto 0);         
   signal bcd_out: bit_vector(11 downto 0);
  begin
    
    CI01: ciBINBCD port map(
      A(3) => '0',
      A(2 downto 0)=> SW2(7 downto 5),
      S => ci01_out); 
      
    CI02: ciBINBCD port map(
      A(3 downto 1)=>ci01_out(2 downto 0),
      A(0)=>SW2(4),
      S => ci02_out);
      
      
    CI03: ciBINBCD port map(
      A(3 downto 1) => ci02_out(2 downto 0),
      A(0) => SW2(3),
      S => ci03_out);
      
    CI04: ciBINBCD port map(
     A(3) => '0',
     A(2) => ci01_out(3) ,
     A(1) => ci02_out(3) ,
     A(0) => ci03_out(3) ,
     S => ci04_out); 
      
    CI05: ciBINBCD port map(
      A(3 downto 1) => ci03_out(2 downto 0) ,
      A(0)=> SW2(2),
      S => ci05_out);
      
    CI06: ciBINBCD port map(
      A(3 downto 1) => ci04_out(2 downto 0) ,
      A(0) => ci05_out(3),
      S => ci06_out);
      
    CI07: ciBINBCD port map(
     A(3 downto 1)=> ci05_out(2 downto 0) ,
     A(0) => SW2(1) ,
      S => ci07_out );
      
     
      bcd_out(11) <= '0';
      bcd_out(10) <= '0';
      bcd_out(9) <= ci04_out(3); 
      bcd_out(8 downto 5) <= ci06_out(3 downto 0); 
      bcd_out(4 downto 1) <= ci07_out(3 downto 0) ; 
      bcd_out(0) <= SW2(0); 
      
      bcd1 <= bcd_out(11 downto 8);
      bcd2 <= bcd_out(7 downto 4);
      bcd3 <= bcd_out(3 downto 0);
      
        
            
        
end arrangement;
      
      
      
           
      
      
      

