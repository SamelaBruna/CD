entity somador8bits is 
  port(As:  in bit_vector(7 downto 0);
       Bs:  in bit_vector(7 downto 0 );
       Ci: in bit;
       Co: out bit;
       Ss:  out bit_vector(7 downto 0));
       
end somador8bits;
 
 architecture arrangement of somador8bits is
   
   component somador is
      port (a: in bit;
            b: in bit;
            ci: in bit;
            co: out bit;
            s: out bit);
        
   end component;
   
      signal carry_out : bit_vector(0 to 6) ;
     
     begin
        
         SOMADOR01: somador port map(
          a => As(0),
          b => Bs(0),
          ci => Ci,
          co => carry_out(0),
          s => Ss(0));
          
        SOMADOR02: somador port map(
          a => As(1),
          b => Bs(1),
          ci => carry_out(0),
          co => carry_out(1),
          s => Ss(1));
          
           
        SOMADOR03: somador port map(
          a => As(2),
          b => Bs(2),
          ci => carry_out(1),
          co => carry_out(2),
          s => Ss(2));
          
             
        SOMADOR04: somador port map(
          a => As(3),
          b => Bs(3),
          ci => carry_out(2),
          co => carry_out(3),
          s => Ss(3));
        
        SOMADOR05: somador port map(
          a => As(4),
          b => Bs(4),
          ci => carry_out(3),
          co => carry_out(4),
          s => Ss(4));
          
       SOMADOR06: somador port map(
          a => As(5),
          b => Bs(5),
          ci => carry_out(4),
          co => carry_out(5),
          s => Ss(5));
        
        SOMADOR07: somador port map(
          a => As(6),
          b => Bs(6),
          ci => carry_out(5),
          co => carry_out(6),
          s => Ss(6));
        
        SOMADOR08: somador port map(
          a => As(7),
          b => Bs(7),
          ci => carry_out(6),
          co => Co,
          s => Ss(7));
       
               
end arrangement;   
                    
          
          

          
          
          
   
   
   
   
