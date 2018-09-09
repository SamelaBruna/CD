entity somadorBCD is 
  port(A_BCD:  in bit_vector(3 downto 0);
       B_BCD:  in bit_vector(3 downto 0 );
       Ci_BCD: in bit;
       Co_BCD: out bit;
       S_BCD:  out bit_vector(3 downto 0));
       
end somadorBCD;

architecture arrangement of somadorBCD is

component somador4bits is 
  port(A:  in bit_vector(3 downto 0);
       B:  in bit_vector(3 downto 0 );
       Ci: in bit;
       Co: out bit;
       S:  out bit_vector(3 downto 0));
       
end component;

    signal S4b_out : bit_vector(3 downto 0);
    signal co4b_out, LC: bit;
     begin


    SOMADOR4BITS01: somador4bits port map(
      A => A_BCD,
      B => B_BCD,
      Ci => Ci_BCD,
      Co => co4b_out,
      S  => S4b_out);
      
      
      LC <= ((S4b_out(3) and S4b_out(2)) or (S4b_out(3) and S4b_out(1))) or co4b_out;
      Co_BCD <= LC;
      
      SOMADOR4BITS02: somador4bits port map(
        A(3) => '0',
        A(2) => LC,
        A(1) => LC,
        A(0) => '0',
        B => S4b_out,
        Ci => '0',
        S => S_BCD);
        
        
      end arrangement;
        
         
        
      
    
      
      
      
      
      
       
      
      
      





