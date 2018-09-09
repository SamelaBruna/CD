entity FINAL is 
  
  port(SW: in bit_vector(7 downto 0);
        HEX2: OUT BIT_VECTOR(6 downto 0);
        HEX1: OUT BIT_VECTOR(6 downto 0);
        HEX0: OUT BIT_VECTOR(6 downto 0));
        
end FINAL;

architecture exec of FINAL is

component BINBCD is 
  port(SW2: in bit_vector(7 downto 0);
       bcd1:out bit_vector(3 downto 0 );
       bcd2:out bit_vector(3 downto 0 );
       bcd3:out bit_vector(3 downto 0 ));
       
end component;

component C7SEG is 
    port( SW3: IN BIT_VECTOR(3 downto 0);
          HEX0: OUT BIT_VECTOR(6 downto 0));   
          
end component;

      signal bcd1_out, bcd2_out, bcd3_out : bit_vector(3 downto 0);
     
  
  begin

  binbcd01: BINBCD port map(
   
    SW2=> SW,
    bcd1 => bcd1_out,
    bcd2 => bcd2_out,
    bcd3 => bcd3_out);
   
   DISPLAY1: C7SEG port map( 
     SW3 => bcd1_out,
     HEX0 => hex2);
   
   DISPLAY2: C7SEG port map( 
     SW3 => bcd2_out,
     HEX0 => hex1);
    
   DISPLAY3: C7SEG port map( 
     SW3 => bcd3_out,
     HEX0 => hex0);
      
   
end exec;
    


