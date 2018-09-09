entity somador4bits is 
  port(A:  in bit_vector(3 downto 0);
       B:  in bit_vector(3 downto 0 );
       Ci: in bit;
       Co: out bit;
       S:  out bit_vector(3 downto 0));
       
end somador4bits;
 
 architecture arrangement of somador4bits is
   
   component somador is
      port (a: in bit;
            b: in bit;
            ci: in bit;
            co: out bit;
            s: out bit);
        
   end component;
   
      signal co1_out, co2_out, co3_out: bit ;
     
     begin
        
        SOMADOR01: somador port map(
          a => A(0),
          b => B(0),
          ci => Ci,
          co => co1_out,
          s => S(0));
          
        SOMADOR02: somador port map(
          a => A(1),
          b => B(1),
          ci => co1_out,
          co => co2_out,
          s => S(1));
          
           
        SOMADOR03: somador port map(
          a => A(2),
          b => B(2),
          ci => co2_out,
          co => co3_out,
          s => s(2));
          
             
        SOMADOR04: somador port map(
          a => A(3),
          b => B(3),
          ci => co3_out,
          co => co,
          s => S(3));
       
               
end arrangement;   
                    
          
          

          
          
          
   
   
   
   
