entity contador2 is
  port(A: in bit_vector(3 downto 0);
       bUD,Clr,load,en,Clock: in bit; 
       S: out bit_vector(3 downto 0)
          
    );
end contador2;  -- 0 crescente , 1 decrescente.

architecture funcionamento of contador2 is

component JK is
     port (clk,J,K,P,C: IN BIT;
           q: OUT BIT
                   
     ); 
 end component; 

    signal inJK, logicPres,logicClr,outJK: bit_vector (3 downto 0);
    signal up,down: bit_vector(3 downto 0);   
   

 begin       

    logicPres(3)<=load nand A(3);
    logicPres(2)<=load nand A(2);
    logicPres(1)<=load nand A(1);
    logicPres(0)<=load nand A(0);


    inJK(0)<=en;

    up(1)<=outJK(0) and not bUD;
    down(1)<=not outJK(0) and bUD;

    inJK(1)<=en and (up(1) or down(1));

    up(2)<=outJK(1) and up(1);
    down(2)<=not outJK(1) and down(1);

    inJK(2)<=en and (up(2) or down(2));

    up(3)<=outJK(2) and up(2);
    down(3)<=not outJK(2) and down(2);

    inJK(3)<=en and (up(3) or down(3));

   
    JK3: JK port map (
        clk => Clock,
        J=> inJK(3),
        K => inJK(3),
        P => logicPres(3),
        C=> Clr,
        q => outJK(3)
        
    );

    JK2: JK port map (
        clk => Clock,
        J=> inJK(2),
        K => inJK(2),
        P => logicPres(2),
        C=> Clr,
        q => outJK(2)
        
    );

    JK1: JK port map (
        clk => Clock,
        J=> inJK(1),
        K => inJK(1),
        P => logicPres(1),
        C=> Clr,
        q => outJK(1)
        
    );

    JK0: JK port map (
        clk => Clock,
        J=> inJK(0),
        K => inJK(0),
        P => logicPres(0),
        C=> Clr,
        q => outJK(0)
        
    );
          
    S <= outJK;

end funcionamento;


